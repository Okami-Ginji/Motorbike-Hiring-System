/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.colorbike.controller;

import com.colorbike.dao.BookingDAO;
import com.colorbike.dto.Account;
import com.colorbike.dto.Booking;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author huypd
 */
@WebServlet(name="BookingHistoryServlet", urlPatterns={"/bookingHistory"})
public class BookingHistoryServlet extends HttpServlet {
   
    BookingDAO bookingDAO = BookingDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String statusBooking = request.getParameter("status");
        String deliveryStatus = null;
        if (statusBooking.equals("confirmed"))
            deliveryStatus = request.getParameter("deliveryStatus");
        if (deliveryStatus == null)
            deliveryStatus = "all";
        List<Booking> listB = bookingDAO.getBookingWithDetails(statusBooking, deliveryStatus, acc.getAccountId());
        request.setAttribute("deliveryStatus", deliveryStatus);
        request.setAttribute("listB", listB);
        request.setAttribute("status", statusBooking);
        request.getRequestDispatcher("bookingHistory.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

}
