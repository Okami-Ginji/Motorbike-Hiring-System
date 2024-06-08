/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.colorbike.controller;

import com.colorbike.dao.MotorcycleDAO;
import com.colorbike.dto.Motorcycle;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author huypd
 */
@WebServlet(name="SearchMotorcycleServlet", urlPatterns={"/searchMotorcycle"})
public class SearchMotorcycleServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //lấy key được gõ vào thanh input
        String key = request.getParameter("name");
        MotorcycleDAO motorcycleDAO = MotorcycleDAO.getInstance();
        List<Motorcycle> list = motorcycleDAO.searchMotorcycleByName(key);
        //request.setAttribute("list", list); //thống nhất đặt tên sau
        //request.getRequestDispatcher("").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }


}
