/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.constant.SendEmail;
import com.colorbike.dao.AccountDAO;
import com.colorbike.dao.BookingDAO;
import com.colorbike.dao.CancellationDAO;
import com.colorbike.dao.ExtensionDAO;
import com.colorbike.dao.StaffDAO;
import com.colorbike.dto.Account;
import com.colorbike.dto.Booking;
import com.colorbike.dto.Cancellation;
import com.colorbike.dto.Extension;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author MINH TUAN
 */
@WebServlet(name = "RejectBookingbyStaffServlet", urlPatterns = {"/rejectBooking"})
public class RejectBookingbyStaffServlet extends HttpServlet {

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
            out.println("<title>Servlet RejectBookingbyStaffServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RejectBookingbyStaffServlet at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        
        String bookingID = request.getParameter("bookingID");
        String cancelReason = request.getParameter("cancelreason");
        String timeBook = request.getParameter("timeBook");
        String cusId = request.getParameter("cusId");
        Account accountStaff = (Account) session.getAttribute("account");
        Account account = AccountDAO.getInstance().getAccountbyCustomerId(Integer.parseInt(cusId));
        //reject đơn hàng từ customer
        if (cancelReason != null) {
            CancellationDAO.getInstance().insertCancellation(cancelReason, bookingID, StaffDAO.getInstance().getStaffbyAccountID(accountStaff.getAccountId()).getStaffID());
            BookingDAO.getInstance().updateBookingStatus(bookingID, "Đã hủy");
        }
        String emailContent = ""
                + "<h3><strong>ColorBike </strong>xin chào quý khách, </h3>"
                + "<p>Mã đơn hàng: <strong>" + bookingID + "</strong> của đã xảy ra lỗi trong quá trình đặt đơn </p>"
                + "<p>Thời gian đặt: " + timeBook + " </p>"
                + "<p>Lý do: " + cancelReason + "</p>"
                + "<p>Vui lòng đặt lại đơn thuê xe để hoàn thành việc đặt đơn</p>"
                + "<p>ColorBike xin cảm ơn, chúc quý khách một ngày vui vẻ! </p>";
        SendEmail.sendVerificationEmail(account.getEmail(), emailContent);

        List<Booking> bookings = BookingDAO.getInstance().getAllBookings();
        List<Cancellation> cancels = CancellationDAO.getInstance().getAllCancellation();
        List<Extension> extend = ExtensionDAO.getInstance().getAllExtension();
        Map<String, Map<String, Integer>> motorcycleDetailsMap = new HashMap<>();

        for (Booking book : bookings) {
            Map<String, Integer> motorcycleDetails = BookingDAO.getInstance().getMotorcycleDetailsByBookingID(book.getBookingID());
            motorcycleDetailsMap.put(book.getBookingID(), motorcycleDetails);
        }

        request.setAttribute("motorcycleDetailsMap", motorcycleDetailsMap);
        session.setAttribute("bookings", bookings);
        session.setAttribute("cancels", cancels);
        session.setAttribute("extend", extend);
        request.getRequestDispatcher("manageBooking.jsp").forward(request, response);
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
