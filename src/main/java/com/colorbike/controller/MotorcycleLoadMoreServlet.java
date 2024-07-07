/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.CategoryDAO;
import com.colorbike.dao.MotorcycleDAO;
import com.colorbike.dao.PriceListDAO;
import com.colorbike.dto.Category;
import com.colorbike.dto.Motorcycle;
import com.colorbike.dto.PriceList;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 *
 * @author PC
 */
@WebServlet(name = "MotorcycleLoadMoreServlet", urlPatterns = {"/load"})
public class MotorcycleLoadMoreServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String amount = request.getParameter("total");
        int iAmount = Integer.parseInt(amount);
        List<Motorcycle> listM = MotorcycleDAO.getInstance().getNext3Motorcycles(iAmount);
        
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        for (Motorcycle m : listM) {
            Category c = CategoryDAO.getInstance().getCategoryById(m.getCategoryID());
            PriceList p = PriceListDAO.getInstance().getPricingByid(String.valueOf(m.getPriceListID()));
            String formattedPrice = currencyFormatter.format(p.getDailyPriceForDay() * 1000);
            out.println("<div class=\"motorcycle box col-md-3\">\n"
                    + "                                    <div class=\"banner-image\">\n"
                    + "                                        <img src=\"images/" + m.getImage() + "\" width=\"100%\" height=\"100%\" alt=\"alt\"/>\n"
                    + "                                    </div>\n"
                    + "                                    <h2 style=\"margin: 16px;\" href=\"motorcycleDetail?id=" + m.getMotorcycleId() + "\"><strong>" + m.getModel() + "</strong></h2>\n"
                    + "                                    <p style=\"font-weight: bold;\">" + c.getCategoryName() +"<br/>\n"
                    + "                                        " + formattedPrice + "/ngày\n"
                    + "                                    </p>\n"
                    + "                                    <div class=\"button-wrapper\">\n"
                    + "                                        <button class=\"btn outline-huhu\"><a href=\"motorcycleDetail?id=" + m.getMotorcycleId() + "\">CHI TIẾT</a></button>\n"
                    + "                                        <button class=\"btn fill\"><a href=\"booking?motorcycleid=" + m.getMotorcycleId() + "\">THUÊ NGAY</a></button>\n"
                    + "\n"
                    + "                                    </div>\n"
                    + "                                </div>");
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
