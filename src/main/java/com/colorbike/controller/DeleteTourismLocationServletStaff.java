/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.TouristLocationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author ADMIN
 */
@WebServlet(name = "DeleteTourismLocationServletStaff", urlPatterns = {"/DeleteTourismLocationServletStaff"})
public class DeleteTourismLocationServletStaff extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TouristLocationDAO touristLocationDAO = TouristLocationDAO.getInstance();
        try {
            String id = request.getParameter("locationId");
            touristLocationDAO.deleteTouristLocation(id);
            response.sendRedirect("TourismLocationServletStaff");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    
}
