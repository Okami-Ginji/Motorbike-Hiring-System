/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.TouristLocationDAO;
import com.colorbike.dto.TouristLocation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "TouristLocationServlet", urlPatterns = {"/touristLocation"})
public class TouristLocationServlet extends HttpServlet {
    
    TouristLocationDAO touristLocationDAO = TouristLocationDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<TouristLocation> touristLocations = touristLocationDAO.getAllTouristLocation();
        request.setAttribute("touristLocation", touristLocations);
        request.getRequestDispatcher("touristLocation.jsp").forward(request, response);
    }  
}
