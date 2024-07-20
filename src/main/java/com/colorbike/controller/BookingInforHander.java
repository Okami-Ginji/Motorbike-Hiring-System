/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.constant.SendEmail;
import com.colorbike.dao.AccessoryDetailDAO;
import com.colorbike.dao.AccountDAO;
import com.colorbike.dao.BookingDAO;
import com.colorbike.dao.BookingDetailDAO;
import com.colorbike.dao.CustomerDAO;
import com.colorbike.dao.MotorcycleDetailDAO;
import com.colorbike.dao.MotorcycleStatusDAO;
import com.colorbike.dao.PaymentDAO;
import com.colorbike.dto.AccessoryDetail;
import com.colorbike.dto.Customer;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "BookingInforHander", urlPatterns = {"/bookinghandler"})
@MultipartConfig
public class BookingInforHander extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           HttpSession session = request.getSession();
            String a = (String) session.getAttribute("pickup");
             out.print(a);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L; 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HashMap<String, Object> dataMap = new HashMap<>();
        Part filePart = null;
        
        
        
       

         //Initialize FileUploaded with upload directory
//        String uploadPath = getServletContext().getRealPath("/upload");
        FileUploaded fileUploaded = new FileUploaded("D:\\ailaithuexeha\\MotorcycleRental\\src\\main\\webapp\\upload");
        // Initialize FileUploaded with a relative directory path
//        String uploadPath = getServletContext().getInitParameter("UPLOAD_DIRECTORY");
//        String absoluteUploadPath = getServletContext().getRealPath(File.separator + uploadPath);
//        FileUploaded fileUploaded = new FileUploaded(absoluteUploadPath);

        // Process request parts
        for (Part part : request.getParts()) {
            String fieldName = part.getName();
            if (fieldName.equals("file")) {
                filePart = part;
            } else {
                InputStream inputStream = part.getInputStream();
                String value = new BufferedReader(new InputStreamReader(inputStream))
                        .lines().collect(java.util.stream.Collectors.joining("\n"));
                dataMap.put(fieldName, value);
            }
        }
        
        

        // Convert JSON data to HashMap
        Gson gson = new Gson();
         try {
             Type type = new TypeToken<HashMap<String, Object>>() {}.getType();
             dataMap.putAll(gson.fromJson((String) dataMap.get("jsonData"), type));
         } catch (Exception e) {
             e.printStackTrace();
             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid JSON format");
             return;
         }
         
          //Create or Update Customer
        CustomerDAO daoC = CustomerDAO.getInstance();
        String customerId = (String) dataMap.get("customerId");
        String identityCard = (String) dataMap.get("identityCard");
        String issuedon = (String) dataMap.get("issuedon");
        String expdate = (String) dataMap.get("expdate");
        int accountId = Integer.parseInt((String) dataMap.get("accountId"));
        
        // Save file if present
        String uploadedFilePath = null;
        String filename = "imageIdC" + customerId + ".jpg";
        
        if(customerId.equalsIgnoreCase("Not")){          
            daoC.createNewCustomer(identityCard, filename, issuedon, expdate, "CMND/CCCD", 1, accountId);
            System.out.println(customerId);
            filename = "imageIdC" + daoC.getCustomerbyAccountID(accountId).getCustomerId() + ".jpg";
            daoC.updateCustomer(identityCard, filename, issuedon, expdate, "CMND/CCCD", daoC.getCustomerbyAccountID(accountId).getCustomerId());
        } else {
            daoC.updateCustomer(identityCard, filename, issuedon, expdate, "CMND/CCCD", Integer.parseInt(customerId));           
        }
        
        if (filePart != null) {
            uploadedFilePath = fileUploaded.handleFileUpload(filePart, filename);
            dataMap.put("filePath", uploadedFilePath);
            request.setAttribute("message", "File uploaded successfully: " + uploadedFilePath);
        }
        

        // Process other data from dataMap
        String pickupDate = (String) dataMap.get("pickupDate");
        String pickupLocation = (String) dataMap.get("pickupLocation");
        String returnLocation = (String) dataMap.get("returnLocation");
        String returnDate = (String) dataMap.get("returnDate");
        
        String firstname = (String) dataMap.get("fistname");
        String lastname = (String) dataMap.get("lastname");
        String phone = (String) dataMap.get("phone");
        String email = (String) dataMap.get("email");
        String address = (String) dataMap.get("address");
        String dob = (String) dataMap.get("dob");
        String gender = (String) dataMap.get("gender");
        String total = (String) dataMap.get("total");
        String paymentDate = (String) dataMap.get("paymenttime");
        int amount = Integer.parseInt((String) dataMap.get("amount"));

        // Get current date and time
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        
        //Update Account
        AccountDAO daoA = AccountDAO.getInstance();      
        daoA.update(firstname, lastname, gender, dob, address, phone, email, daoA.getAccountbyID(accountId).getUserName(), accountId);
        
        System.out.println(accountId);
        
        // Generate booking ID
        String bookingid = generateBookingCode();

        // Save booking data to database
        // Assume BookingDAO is a class to handle database operations
        BookingDAO dao = BookingDAO.getInstance();
        dao.addBooking(bookingid, formattedDateTime, pickupDate, returnDate, pickupLocation, returnLocation, 0, daoC.getCustomerbyAccountID(accountId).getCustomerId());

        // Process bike details
        Type bikeListType = new TypeToken<ArrayList<HashMap<String, String>>>() {}.getType();
        ArrayList<HashMap<String, String>> bikeDetails = gson.fromJson(gson.toJson(dataMap.get("bikeDetails")), bikeListType);

        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDateString = currentDateTime.format(formatterDate);

        MotorcycleDetailDAO daoMD = MotorcycleDetailDAO.getInstance();
        MotorcycleStatusDAO daoMS = MotorcycleStatusDAO.getInstance();
        BookingDetailDAO daoBD = BookingDetailDAO.getInstance();
        Random random = new Random();
        
        // Map để lưu số lượng xe theo tên
        LinkedHashMap<String, Integer> bikeCounts = new LinkedHashMap<>();

        for (HashMap<String, String> bikeDetail : bikeDetails) {
            String bikeName = bikeDetail.get("name");
            int bikePrice = Integer.parseInt(bikeDetail.get("price"));
            bikeCounts.put(bikeName, bikeCounts.getOrDefault(bikeName, 0) + 1);
            List<Integer> list = daoMD.getListAvailableMotorcycleDetailIdByMotorcycleName(bikeName);
            int randomElement = list.get(random.nextInt(list.size()));
            daoMS.insertMotorcycleStatus(randomElement, "STAFF00001", "Không có sẵn", formattedDateString, "Chờ nhân viên xác nhận");
            daoBD.addBookingDetail(randomElement, bookingid, bikePrice);
        }

        // Process accessory details
        Type accessoryListType = new TypeToken<ArrayList<HashMap<String, Object>>>() {}.getType();
        ArrayList<HashMap<String, Object>> accessoryDetails = gson.fromJson(gson.toJson(dataMap.get("accessories")), accessoryListType);

        AccessoryDetailDAO daoAD = AccessoryDetailDAO.getInstance();

        for (HashMap<String, Object> accessoryDetail : accessoryDetails) {
            int accessoryId = Integer.parseInt((String) accessoryDetail.get("id"));
            int quantity = Integer.parseInt((String) accessoryDetail.get("quantity"));
            double price = (double) accessoryDetail.get("price");
            daoAD.insert(new AccessoryDetail(bookingid, accessoryId, quantity, price));
        }
        
        //Payment
        // Định dạng chuỗi đầu vào
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        
        // Chuyển đổi chuỗi thành LocalDateTime
        LocalDateTime dateTime = LocalDateTime.parse(paymentDate, inputFormatter);
        
        // Định dạng chuỗi đầu ra
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        // Chuyển đổi LocalDateTime thành chuỗi định dạng mới
        String paymentDateText = dateTime.format(outputFormatter);
        PaymentDAO daoP = PaymentDAO.getInstance();
        daoP.addPayment(bookingid, "Ngân hàng", paymentDateText, amount/100000, "Thành công");
        
        // Send confirmation email
       StringBuilder emailContent = new StringBuilder();
        emailContent.append("<!DOCTYPE html>\n");
        emailContent.append("<html lang=\"vi\">\n");
        emailContent.append("<head>\n");
        emailContent.append("    <meta charset=\"UTF-8\">\n");
        emailContent.append("    <title>Thông tin đặt xe</title>\n");
        emailContent.append("    <style>\n");
        emailContent.append("        body {\n");
        emailContent.append("            font-family: Arial, sans-serif;\n");
        emailContent.append("        }\n");
        emailContent.append("        .container {\n");
        emailContent.append("            max-width: 600px;\n");
        emailContent.append("            margin: 0 auto;\n");
        emailContent.append("            padding: 20px;\n");
        emailContent.append("            border: 1px solid #ddd;\n");
        emailContent.append("            border-radius: 10px;\n");
        emailContent.append("        }\n");
        emailContent.append("        .header {\n");
        emailContent.append("            font-size: 18px;\n");
        emailContent.append("            font-weight: bold;\n");
        emailContent.append("            margin-bottom: 20px;\n");
        emailContent.append("        }\n");
        emailContent.append("        .info, .vehicle-info, .note {\n");
        emailContent.append("            margin-bottom: 20px;\n");
        emailContent.append("        }\n");
        emailContent.append("        .info div, .vehicle-info div {\n");
        emailContent.append("            margin-bottom: 10px;\n");
        emailContent.append("        }\n");
        emailContent.append("        .info div span, .vehicle-info div span {\n");
        emailContent.append("            font-weight: bold;\n");
        emailContent.append("        }\n");
        emailContent.append("        .note ul {\n");
        emailContent.append("            list-style: none;\n");
        emailContent.append("            padding: 0;\n");
        emailContent.append("        }\n");
        emailContent.append("        .note ul li {\n");
        emailContent.append("            margin-bottom: 10px;\n");
        emailContent.append("        }\n");
        emailContent.append("    </style>\n");
        emailContent.append("</head>\n");
        emailContent.append("<body>\n");
        emailContent.append("<div class=\"container\">\n");
        emailContent.append("    <div class=\"header\">Thông tin đặt xe của bạn</div>\n");
        emailContent.append("    <div class=\"info\">\n");
        emailContent.append("        <div><span>Họ tên:</span> ").append(firstname).append(" ").append(lastname).append("</div>\n");
        emailContent.append("        <div><span>Số điện thoại:</span> ").append(phone).append("</div>\n");
        emailContent.append("        <div><span>Email:</span> ").append(email).append("</div>\n");
        emailContent.append("        <div><span>Ngày nhận xe:</span> ").append(pickupDate).append("</div>\n");
        emailContent.append("        <div><span>Ngày trả xe:</span> ").append(returnDate).append("</div>\n");
        emailContent.append("        <div><span>Địa điểm nhận xe:</span> ").append(pickupLocation).append("</div>\n");
        emailContent.append("        <div><span>Địa điểm trả xe:</span> ").append(returnLocation).append("</div>\n");
        emailContent.append("    </div>\n");
        emailContent.append("    <div class=\"vehicle-info\">\n");
        emailContent.append("        <div class=\"header\">Thông tin xe:</div>\n");

        // Lặp qua danh sách xe và thêm thông tin vào email
        for (Map.Entry<String, Integer> entry : bikeCounts.entrySet()) {
            String bikeName = entry.getKey();
            int quantity = entry.getValue();
            emailContent.append("        <div><span>Tên xe:</span> ").append(bikeName).append("             x").append(quantity).append("</div>\n");
//            emailContent.append("        <div><span>Số lượng:</span> x").append(quantity).append(" VND</div>\n");
        }
        emailContent.append("<div><span>Phí thuê xe dự tính:</span> ").append(total).append(" VND</div>");
        emailContent.append("    </div>\n");
        emailContent.append("    <div class=\"note\">\n");
        emailContent.append("        <div class=\"header\">Lưu ý:</div>\n");
        emailContent.append("        <ul>\n");
        emailContent.append("            <li>Vui lòng mang theo giấy tờ tùy thân khi nhận xe.</li>\n");
        emailContent.append("            <li>Kiểm tra kỹ thông tin xe trước khi nhận.</li>\n");
        emailContent.append("            <li>Liên hệ với chúng tôi nếu có bất kỳ thắc mắc nào.</li>\n");
        emailContent.append("        </ul>\n");
        emailContent.append("    </div>\n");
        emailContent.append("</div>\n");
        emailContent.append("</body>\n");
        emailContent.append("</html>\n");
        SendEmail.sendVerificationEmail(email, emailContent.toString());

        // Set the response content type
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(gson.toJson(dataMap));
//        response.sendRedirect("index.jsp");
    }

    private String generateBookingCode() {
          //Khởi tạo một đối tượng Random
        Random random = new Random();

        // Sinh ra 6 số ngẫu nhiên từ 0 đến 999999
        int randomNumber = random.nextInt(1000000);

        // Format số ngẫu nhiên thành chuỗi, thêm vào "BOOK"
        String bookingCode = "BOOK" + String.format("%06d", randomNumber);

        return bookingCode;
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}