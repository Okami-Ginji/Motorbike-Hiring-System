package com.colorbike.controller;

import com.colorbike.constant.SendEmail;
import com.colorbike.dao.AccountDAO;
import com.colorbike.dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        AccountDAO dao = AccountDAO.getInstance();

        Account acc = dao.getAccountByEmail(email); // email đã tồn tại

        if (acc == null) { // email chưa tồn tại 
            String password = request.getParameter("password");
            String confirmPass = request.getParameter("passwordConfirmation");
             if (password.equals(confirmPass)) { // check password == confirm pass
                String firstname = request.getParameter("firstname");
                String lastname = request.getParameter("lastname");
                String gender = request.getParameter("gender");
             //   String address = request.getParameter("address");
                String phone = request.getParameter("phone");
            //    String dob = request.getParameter("dob");
                String username = request.getParameter("username");
                if (firstname == null || firstname.isEmpty()
                        || lastname == null || lastname.isEmpty()
                        || gender == null || gender.isEmpty()
                 //       || address == null || address.isEmpty()
                        || phone == null || phone.isEmpty()                     
                //        || dob == null || dob.isEmpty()
                        || username == null || username.isEmpty()) {

                    request.setAttribute("info", "Please enter full information!!!"); 
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
                HttpSession session = request.getSession();
                session.setAttribute("firstname", firstname);
                session.setAttribute("lastname", lastname);
                session.setAttribute("gender", gender);
          //      session.setAttribute("address", address);
                session.setAttribute("phone", phone);
          //      session.setAttribute("dob", dob);
                session.setAttribute("username", username);
                session.setAttribute("password", password);
                session.setAttribute("email", email);

                // Generate verification code
                String verificationCode = SendEmail.generateRandomFourDigits();
                // Save verification code in session
                session.setAttribute("verificationCode", verificationCode);
                String emailContent = "<h3>Hello,</h3>"
                        + "<p>To complete the registration process, please use the following OTP code:</p>"
                        + "<p>OTP code: <b>" + verificationCode + ".</b></p>"
                        + "<p>If you do not require this code, please ignore the email or contact us at the.color.bike.company@gmail.com</p>";
                // Send verification email
                SendEmail.sendVerificationEmail(email, emailContent);
                // Redirect to the confirmation page

                response.sendRedirect("otpRegister.jsp");
            } else {
                request.setAttribute("msgPass", "Mật khẩu và xác nhận mật khẩu không bằng nhau. Vui lòng thử lại!");
                request.getRequestDispatcher("register2.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msgEmail", "Email không hợp lệ hoặc đã tồn tại. Vui lòng thử lại!"); // email đã tồn tại
            request.getRequestDispatcher("register2.jsp").forward(request, response);
        }
    }

}
