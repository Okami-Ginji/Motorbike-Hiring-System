/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.FAQDAO;
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
@WebServlet(name = "deleteFAQsStaff", urlPatterns = {"/deleteFAQs"})
public class deleteFAQsStaff extends HttpServlet {

    FAQDAO fAQDAO = FAQDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String questionID = request.getParameter("questionID");
        
        fAQDAO.deleteFAQs(questionID);
        request.setAttribute("mess", "Deleted!");
//        request.getRequestDispatcher("faqsManagement.jsp").forward(request, response);
        response.sendRedirect("faqs");
    }
    
}
