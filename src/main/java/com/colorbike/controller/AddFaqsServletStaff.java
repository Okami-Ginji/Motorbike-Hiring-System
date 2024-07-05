/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.FAQDAO;
import com.colorbike.dto.FAQ;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddFaqsServletStaff", urlPatterns = {"/faqs"})
public class AddFaqsServletStaff extends HttpServlet {

    FAQDAO faqdao = FAQDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<FAQ> faqs = faqdao.getAllFAQ();
        request.setAttribute("faqs", faqs);
        request.getRequestDispatcher("faqsManagement.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        List<FAQ>  faqs = faqdao.getAllFAQ();
        request.setAttribute("faqs", faqs);
        try {
            // Kiểm tra tính hợp lệ của các tham số
            if (question != null && !question.trim().isEmpty() &&
                answer != null && !answer.trim().isEmpty()) {
                // Tạo đối tượng FAQ và thêm vào cơ sở dữ liệu
                FAQ faq = new FAQ(0, question, answer);
                faqdao.addNewFAQs(faq);

                response.sendRedirect("faqs");
            } else {
                // Nếu dữ liệu không hợp lệ, chuyển hướng về form với thông báo lỗi
                request.setAttribute("errorMessage", "Câu hỏi và câu trả lời không được để trống.");
                request.getRequestDispatcher("faqsManagement.jsp").forward(request, response);
            }
        } catch (Exception e) {
            Logger.getLogger(AddFaqsServletStaff.class.getName()).log(Level.SEVERE, "Lỗi khi thêm FAQ", e);
        }
    }
}

