/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.MotorcycleDAO;
import com.colorbike.dto.Motorcycle;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.apache.commons.fileupload.FileUpload;

/**
 *
 * @author DiepTCNN
 */
@WebServlet(name = "AddMotorbikeServlet", urlPatterns = {"/addMotorbike"})
@MultipartConfig
public class AddMotorbikeServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddMotorbikeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMotorbikeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part image = request.getPart("image");

        String id = request.getParameter("id");
        String model = request.getParameter("model");
        String displacement = request.getParameter("displacement");
        String description = request.getParameter("description");
        int minAge = Integer.parseInt(request.getParameter("minAge"));
        int brandID = Integer.parseInt(request.getParameter("brandID"));
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        int priceListID = Integer.parseInt(request.getParameter("priceListID"));

        MotorcycleDAO md = MotorcycleDAO.getInstance();

//        String relativePath = getServletContext().getRealPath("/images");
//        FileUploaded f = new FileUploaded(relativePath);
//        FileUploaded f = new FileUploaded("D:\\FPT_UNI\\SWP391\\Code\\MotorcycleRental\\src\\main\\webapp\\images");

        // Đường dẫn thư mục lưu trữ ảnh
//        String uploadPath = getServletContext().getRealPath("/images");
//        File uploadDir = new File(uploadPath);
//        if (!uploadDir.exists()) {
//            uploadDir.mkdir();
//        }
//
//        // Lấy tên tệp
//        String fileName = getFileName(image);
//        String filePath = uploadPath + File.separator + fileName;
//        
//        // Lưu tệp vào thư mục
//        image.write(filePath);
        String fileName = getFileName(image);
        try {
            Motorcycle motor = new Motorcycle(id, model, fileName, displacement, description, minAge, brandID, categoryID, priceListID);
            md.addMotorcycle(motor);
        } catch (Exception e) {
            System.out.println(e);
        }
        FileUploaded f = new FileUploaded("D:\\ailaithuexeha\\MotorcycleRental\\src\\main\\webapp\\images");

        String line = f.handleFileUpload(image, fileName);
        System.out.println(line);

        response.sendRedirect("motorManage");

    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        if (contentDisposition != null) {
            for (String cd : contentDisposition.split(";")) {
                if (cd.trim().startsWith("filename")) {
                    return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                }
            }
        }
        return null;
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
