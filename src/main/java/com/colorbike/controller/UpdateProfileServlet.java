package com.colorbike.controller;

import com.colorbike.dao.AccountDAO;
import com.colorbike.dto.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/updateprofile"})
public class UpdateProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfileServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String phoneNumber = request.getParameter("phonenumber");
        String userName = request.getParameter("username");
        String accountID = request.getParameter("accountID");
        int roleID = Integer.parseInt(request.getParameter("roleID"));
        try {
            if (isEmptyOrNull(email) && isEmptyOrNull(userName)) {
                request.setAttribute("errorProfile", "Cập nhật hồ sơ thất bại! Không được để trống email và username.");
            } else {
                if (!isEmptyOrNull(phoneNumber) && !phoneNumber.matches("\\d{9,12}")) {
                    request.setAttribute("errorProfile", "Cập nhật hồ sơ thất bại! Số điện thoại không bao gồm chữ và bao gồm từ 9 đến 12 số.");
                } else {
                    if (isEmptyOrNull(firstName) || isEmptyOrNull(lastName) || isEmptyOrNull(address)
                            || isEmptyOrNull(dob) || isEmptyOrNull(gender) || isEmptyOrNull(accountID)) {
                        request.setAttribute("errorProfile", "Cập nhật hồ sơ thất bại! Vui lòng điền đầy đủ thông tin bắt buộc.");
                    } else {
                        AccountDAO.getInstance().update(firstName, lastName, gender, dob, address, phoneNumber, email, userName, Integer.parseInt(accountID));
                        request.setAttribute("mess", "Cập nhật hồ sơ thành công!");
                        HttpSession session = request.getSession();
                        Account account = (Account) session.getAttribute("account");
                        session.setAttribute("account", AccountDAO.getInstance().checkLogin(account.getUserName(), account.getPassWord()));
                    }
                }
            }
        } catch (NumberFormatException ex) {
            System.out.println(ex);
        }
        if (roleID == 1) {
            request.getRequestDispatcher("profileCustomer.jsp").forward(request, response);
        }
        request.getRequestDispatcher("profileStaff.jsp").forward(request, response);

    }

    private boolean isEmptyOrNull(String str) {
        return str == null || str.trim().isEmpty();
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
