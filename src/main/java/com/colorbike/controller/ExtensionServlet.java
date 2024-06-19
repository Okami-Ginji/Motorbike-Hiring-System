/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.colorbike.controller;

import com.colorbike.dao.BookingDAO;
import com.colorbike.dao.ExtensionDAO;
import com.colorbike.dto.Booking;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author huypd
 */
@WebServlet(name="ExtensionServlet", urlPatterns={"/extension"})
public class ExtensionServlet extends HttpServlet {
    //LOGIC: Ấn vào 1 mục --> Xem detail và nhập newEndDate, submit --> Trả về trạng thái và gửi email


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //chưa xong, đợi booking xong đã
        String bookingId = request.getParameter("newEndDate"); //lấy bookingId của đơn thuê muốn gia hạn
        BookingDAO bookingDAO = BookingDAO.getInstance();
        Booking booking = bookingDAO.getBookingById(bookingId);
        String newEndDate = request.getParameter("newEndDate");
        ExtensionDAO extensionDAO = ExtensionDAO.getInstance();
        extensionDAO.addExtension(newEndDate, newEndDate, 0, bookingId);
    }


}
