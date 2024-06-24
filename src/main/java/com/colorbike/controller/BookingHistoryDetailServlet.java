/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.BookingDAO;
import com.colorbike.dao.ExtensionDAO;
import com.colorbike.dao.PaymentDAO;
import com.colorbike.dto.Booking;
import com.colorbike.dto.Extension;
import com.colorbike.dto.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Map;

@WebServlet(name = "BookingHistoryDetailServlet", urlPatterns = {"/bookingHistoryDetail"})
public class BookingHistoryDetailServlet extends HttpServlet {

    BookingDAO bookingDAO = BookingDAO.getInstance();
    ExtensionDAO extensionDAO = ExtensionDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        Booking booking = bookingDAO.getBookingById(bookingId);
        Map<String, Integer> motorcycleDetails = bookingDAO.getMotorcycleDetailsByBookingID(bookingId);
        Extension extension = extensionDAO.getExtensionByBookingID(bookingId);
        Payment payment = PaymentDAO.getInstance().getPayMentbyBookingId(bookingId);
        request.setAttribute("payment", payment);
        request.setAttribute("extension", extension);
        request.setAttribute("booking", booking);
        request.setAttribute("motorcycleDetails", motorcycleDetails);
        request.setAttribute("statusBooking", booking.getStatusBooking());

        request.getRequestDispatcher("bookingHistoryDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
