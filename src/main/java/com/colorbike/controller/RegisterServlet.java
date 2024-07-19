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
            if (checkValidPass(password)) {
                if (password.equals(confirmPass)) { // check password == confirm pass
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String gender = request.getParameter("gender");
                    String phone = request.getParameter("phone");
                    String username = request.getParameter("username");
                    if ((checkNull(firstname) || checkNull(lastname) || checkNull(gender)
                            || checkNull(phone) || checkNull(username) || checkNull(email))) {
                        request.setAttribute("errorInput", "Vui lòng nhập đúng định dạng trước khi tiếp tục.");
                        request.getRequestDispatcher("register2.jsp").forward(request, response);
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("firstname", firstname);
                    session.setAttribute("lastname", lastname);
                    session.setAttribute("gender", gender);
                    session.setAttribute("phone", phone);
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("email", email);

                    String verificationCode = SendEmail.generateRandomFourDigits();
                    session.setAttribute("verificationCode", verificationCode);
                    String emailContent = "<h3>Chào bạn,</h3>"
                            + "<p>Để hoàn tất quá trình đăng ký, vui lòng sử dụng mã OTP sau:</p>"
                            + "<p>Mã OTP: <b>" + verificationCode + ".</b></p>"
                            + "<p>Nếu bạn không yêu cầu mã này, vui lòng bỏ qua email hoặc liên hệ với chúng tôi theo địa chỉ: the.color.bike.company@gmail.com</p>";
                    SendEmail.sendVerificationEmail(email, emailContent);

                    response.sendRedirect("otpRegister.jsp");
                } else {
                    request.setAttribute("errorInput", "Mật khẩu và xác nhận mật khẩu không bằng nhau. Vui lòng thử lại!");
                    request.getRequestDispatcher("register2.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorInput", "Password phải chứa ít nhất 8 ký tự, bao gồm ít nhất 1 ký tự in hoa và 1 chữ số. Vui lòng thử lại!");
                request.getRequestDispatcher("register2.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorInput", "Email không hợp lệ hoặc đã tồn tại. Vui lòng thử lại!"); // email đã tồn tại
            request.getRequestDispatcher("register2.jsp").forward(request, response);
        }
    }

    private boolean checkValidPass(String pass) {
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,}$";
        return pass != null && pass.matches(passwordRegex);
    }

    private boolean checkNull(String text) {
        return text == null || text.trim().isEmpty();
    }
}
