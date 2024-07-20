/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.AccessoryDAO;
import com.colorbike.dto.Accessory;
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
@WebServlet(name = "AddAccessoryStaff", urlPatterns = {"/AddAccessoryStaff"})
public class AddAccessoryStaff extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccessoryDAO accessoryDAO = AccessoryDAO.getInstance();
        FileUploaded fileUploaded = new FileUploaded("D:\\ailaithuexeha\\MotorcycleRental\\src\\main\\webapp\\images");
        try {
            String accessoryName = request.getParameter("accessoryName");

            String imageName = "imageAccessory" + accessoryName + ".jpg";
            Part imagePart = request.getPart("accessoryImage");
            fileUploaded.handleFileUpload(imagePart, imageName);

            String iconImageName = "iconAccessory" + accessoryName + ".jpg";
            Part iconImagePart = request.getPart("accessoryImageIcon");
            fileUploaded.handleFileUpload(iconImagePart, iconImageName);

            String accessoryDescription = request.getParameter("accessoryDescription");
            double price = Double.parseDouble(request.getParameter("price"));

            Accessory accessory = new Accessory(0, accessoryName, imageName, iconImageName, accessoryDescription, price);
            accessoryDAO.addNewAccessory(accessory);

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("accessoriesStaffServlet");

    }
}
