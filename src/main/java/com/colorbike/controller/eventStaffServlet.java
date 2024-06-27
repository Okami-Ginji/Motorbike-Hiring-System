/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.EventDAO;
import com.colorbike.dao.StaffDAO;
import com.colorbike.dto.Event;
import com.colorbike.dto.Staff;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "eventStaffServlet", urlPatterns = {"/eventStaffServlet"})
public class eventStaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EventDAO eventDAO = EventDAO.getInstance();
        StaffDAO staffDAO = StaffDAO.getInstance();
        
        List<Staff> staffList = staffDAO.getAllStaff();
        List<Event> eventList = eventDAO.getAllEvent();
        
        request.setAttribute("staffList", staffList);
        request.setAttribute("eventList", eventList);
        request.getRequestDispatcher("eventStaff.jsp").forward(request, response);
    }

}
