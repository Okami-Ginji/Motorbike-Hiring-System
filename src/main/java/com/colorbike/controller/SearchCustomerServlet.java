/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.AccountDAO;
import com.colorbike.dao.BookingDAO;
import com.colorbike.dao.CustomerDAO;
import com.colorbike.dto.Account;
import com.colorbike.dto.Booking;
import com.colorbike.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 *
 * @author MINH TUAN
 */
@WebServlet(name = "SearchCustomerServlet", urlPatterns = {"/searchCustomer"})
public class SearchCustomerServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchCustomerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        HttpSession session = request.getSession();
        String accountIdParam = request.getParameter("accountId");
        int accountId = 0;

        if (accountIdParam != null && !accountIdParam.isEmpty()) {
            accountId = Integer.parseInt(accountIdParam);
        }
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        String id = request.getParameter("id");
        List<Account> accounts = AccountDAO.getInstance().getAccountbyCustomerID(Integer.parseInt(id));
        Map<Integer, Integer> updatedStatuses = AccountDAO.getInstance().updateRoleAndGetStatuses(accountId, isActive);
        List<Account> avaiaccount = AccountDAO.getInstance().getAvailableCustomerAccount();
        Map<Integer, Customer> customerMap = CustomerDAO.getInstance().getCustomersMappedByAccountId();
        Map<Integer, Integer> bookingCount = AccountDAO.getInstance().getBookingCountbyAccount();

        int activeCount = 0;
        int disabledCount = 0;

        for (Account account : accounts) {
            if (account.getRoleID() == 1) {
                activeCount++;
            } else if (account.getRoleID() == 4) {
                disabledCount++;
            }
        }
        session.setAttribute("isActive", isActive);
        session.setAttribute("updatedStatuses", updatedStatuses);
        session.setAttribute("accounts", accounts);
        session.setAttribute("avaiaccount", avaiaccount);
        session.setAttribute("activeCount", activeCount);
        session.setAttribute("disabledCount", disabledCount);
        session.setAttribute("allCount", accounts.size());
        session.setAttribute("customerMap", customerMap);
        session.setAttribute("bookingCount", bookingCount);
        request.getRequestDispatcher("manageCustomer.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String accountIdParam = request.getParameter("accountId");
        int accountId = 0; 

        if (accountIdParam != null && !accountIdParam.isEmpty()) {
            accountId = Integer.parseInt(accountIdParam);
        }
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        List<Account> accounts = AccountDAO.getInstance().searchAccountsbyUserNameandName(username, name);
        Map<Integer, Integer> updatedStatuses = AccountDAO.getInstance().updateRoleAndGetStatuses(accountId, isActive);
        List<Account> avaiaccount = AccountDAO.getInstance().getAvailableCustomerAccount();
        Map<Integer, Customer> customerMap = CustomerDAO.getInstance().getCustomersMappedByAccountId();
        Map<Integer, Integer> bookingCount = AccountDAO.getInstance().getBookingCountbyAccount();

        int activeCount = 0;
        int disabledCount = 0;

        for (Account account : accounts) {
            if (account.getRoleID() == 1) {
                activeCount++;
            } else if (account.getRoleID() == 4) {
                disabledCount++;
            }
        }
        session.setAttribute("isActive", isActive);
        session.setAttribute("updatedStatuses", updatedStatuses);
        session.setAttribute("accounts", accounts);
        session.setAttribute("avaiaccount", avaiaccount);
        session.setAttribute("activeCount", activeCount);
        session.setAttribute("disabledCount", disabledCount);
        session.setAttribute("allCount", accounts.size());
        session.setAttribute("customerMap", customerMap);
        session.setAttribute("bookingCount", bookingCount);
        request.getRequestDispatcher("manageCustomer.jsp").forward(request, response);
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
