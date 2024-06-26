/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.AccountDAO;
import com.colorbike.dao.BookingDAO;
import com.colorbike.dao.BrandDAO;
import com.colorbike.dao.FeedbackDAO;
import com.colorbike.dao.MotorcycleDAO;
import com.colorbike.dao.PriceListDAO;
import com.colorbike.dto.Account;
import com.colorbike.dto.Booking;
import com.colorbike.dto.Brand;
import com.colorbike.dto.Feedback;
import com.colorbike.dto.Motorcycle;
import com.colorbike.dto.PriceList;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author DiepTCNN
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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

        FeedbackDAO fd = FeedbackDAO.getInstance(); //view feedback

        MotorcycleDAO md = MotorcycleDAO.getInstance();//view featured motorbikes
        BrandDAO bd = BrandDAO.getInstance();
        PriceListDAO pd = PriceListDAO.getInstance();
        List<Feedback> listF = fd.getAllFeedbacks();
        List<Motorcycle> listM = md.getTop5MotorcycleTheMostRental();
        List<Brand> listB = bd.getAllBrand();
        List<PriceList> listP = pd.getAllPriceList();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            Booking book = BookingDAO.getInstance().getLastestBooking(account.getAccountId());
            if (book != null) {
                request.setAttribute("book", book);
                request.setAttribute("statusBooking", book.getStatusBooking());
            } else {
                request.removeAttribute("book");
                request.removeAttribute("statusBooking");
            }
        }
        session.setAttribute("account", account);
        request.setAttribute("listF", listF);
        request.setAttribute("listM", listM);
        request.setAttribute("listB", listB);
        request.setAttribute("listP", listP);

        request.getRequestDispatcher("home.jsp").forward(request, response);
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
