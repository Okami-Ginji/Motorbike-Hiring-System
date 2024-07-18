/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.EventDAO;
import com.colorbike.dto.Event;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;

/**
 *
 * @author ADMIN
 */
@MultipartConfig
@WebServlet(name = "AddNewEventStaff", urlPatterns = {"/AddNewEventStaff"})
public class AddNewEventStaff extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EventDAO eventDAO = EventDAO.getInstance();
        FileUploaded fileUploaded = new FileUploaded("D:\\FPT_UNIVERSITY\\5_Summer24\\SWP391\\MotorcycleRental\\src\\main\\webapp\\images");

        try {
            // Retrieve form data
            String eventTitle = request.getParameter("eventTitle");
            String createdDate = request.getParameter("createdDate");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String content = request.getParameter("content");

            // Handle file upload for eventImage
            String name = "imageEvent" + eventTitle + ".jpg"; // Adjust filename logic as per your requirement
            Part part = request.getPart("eventImage");
            fileUploaded.handleFileUpload(part, name); // Handle file upload

            // Retrieve other form data
            double discount = Double.parseDouble(request.getParameter("discount"));
            String staffID = request.getParameter("staffID");

            // Create Event object
            Event event = new Event(0, eventTitle, createdDate, startDate, endDate, content, name, discount, staffID);

            // Add event to database
            eventDAO.addNewEvent(event);

        } catch (Exception e) {
            // Handle exceptions
            System.out.println("Error adding event: " + e.getMessage());
            e.printStackTrace(); // Log stack trace for debugging
        }

        // Redirect to eventStaffServlet after adding event
        response.sendRedirect("eventStaffServlet");
    }
}
