package com.colorbike.controller;

import com.colorbike.constant.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DiepTCNN
 */
@WebServlet(name = "reOtpServlet", urlPatterns = {"/reOtp"})
public class GetReOtpServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Generate verification code
        String verificationCode = SendEmail.generateRandomFourDigits();
        // Save verification code in session
        session.setAttribute("verificationCode", verificationCode);
        // Send verification email
        String emailContent = "<h3>Hello,</h3>"
                   + "<p>To complete the registration process, please use the following OTP code:</p>"
                   + "<p>OTP code: <b>" + verificationCode + ".</b></p>"
                   + "<p>If you do not require this code, please ignore the email or contact us at the.color.bike.company@gmail.com</p>";
        SendEmail.sendVerificationEmail(email, emailContent);
        // Redirect to the confirmation page

        response.sendRedirect("otpRegister.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}