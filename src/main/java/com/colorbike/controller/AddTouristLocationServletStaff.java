/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.StaffDAO;
import com.colorbike.dao.TouristLocationDAO;
import com.colorbike.dto.Staff;
import com.colorbike.dto.TouristLocation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@MultipartConfig
@WebServlet(name = "AddTouristLocationServletStaff", urlPatterns = {"/AddTouristLocationServletStaff"})
public class AddTouristLocationServletStaff extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TouristLocationDAO touristLocationDAO = TouristLocationDAO.getInstance();
        FileUploaded fileUploaded = new FileUploaded("D:\\FPT_UNIVERSITY\\5_Summer24\\SWP391\\MotorcycleRental\\src\\main\\webapp\\images");
        try {
            String locationName = request.getParameter("locationName");
            
            String name = "imageTour" + locationName + ".jpg";
            Part part = request.getPart("locationImage");
            fileUploaded.handleFileUpload(part, name);
            

            String description = request.getParameter("description");
            String urlArticle = request.getParameter("urlArticle");
            String staffID = request.getParameter("staffID");

            TouristLocation touristLocation = new TouristLocation(0, locationName, name, description, urlArticle, staffID);
            touristLocationDAO.addNewTouristLocation(touristLocation);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        response.sendRedirect("TourismLocationServletStaff");
    }
}
