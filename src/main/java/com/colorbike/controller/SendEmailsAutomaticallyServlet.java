/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.constant.SendEmail;
import com.colorbike.dao.AccountDAO;
import com.colorbike.dao.BookingDAO;
import com.colorbike.dao.CustomerDAO;
import com.colorbike.dto.Account;
import com.colorbike.dto.Booking;
import com.colorbike.dto.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "SendEmailsAutomaticallyServlet", urlPatterns = {"/auto"})
public class SendEmailsAutomaticallyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
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
            out.println("<title>Servlet SendEmailsAutomaticallyServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendEmailsAutomaticallyServlet at " + request.getContextPath() + "</h1>");
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
    private static boolean notificationSent = false; // Biến flag để kiểm tra xem thông báo đã được gửi chưa
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
         // Get current date and time
//        LocalDateTime currentDateTime = LocalDateTime.now();
        String str = "05-07-2024 20:05:00";
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime currentDateTime = LocalDateTime.parse(str, formatter);
//        String formattedDateTime = currentDateTime.format(formatter);
        BookingDAO daoB = BookingDAO.getInstance();
        CustomerDAO daoC = CustomerDAO.getInstance();
        AccountDAO daoA = AccountDAO.getInstance();
        
        List<Booking> listB = daoB.getAllBookings();
        for(Booking booking: listB){
            String startDateStr = booking.getStartDate(); // Giả sử `getStartDate()` trả về String           
            // Chuyển đổi chuỗi thành LocalDateTime
            LocalDateTime startDate = LocalDateTime.parse(startDateStr, formatter);
            
            // Tính toán khoảng thời gian giữa thời gian hiện tại và thời gian bắt đầu
            Duration duration = Duration.between(currentDateTime, startDate);
            long hoursBetween = duration.toHours();

            // Kiểm tra nếu còn 3 giờ nữa là đến thời gian bắt đầu
            if (hoursBetween <= 3 && !notificationSent) {
                Customer customer = daoC.getCustomerbyID(booking.getCustomerID());
                Account account = daoA.getAccountbyID(customer.getAccountId());
                SendEmail.sendVerificationEmail(account.getEmail(), "aaaaaaaaaa");
                notificationSent = true; // Đánh dấu là đã gửi thông báo
            }
        }
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
