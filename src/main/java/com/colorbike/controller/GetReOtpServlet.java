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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}