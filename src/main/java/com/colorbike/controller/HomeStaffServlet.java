/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.CategoryDAO;
import com.colorbike.dao.MotorcycleDAO;
import com.colorbike.dao.PriceListDAO;
import com.colorbike.dto.Account;
import com.colorbike.dto.Category;
import com.colorbike.dto.Motorcycle;
import com.colorbike.dto.PriceList;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author MINH TUAN
 */
@WebServlet(name = "HomeStaffServlet", urlPatterns = {"/homeStaff"})
public class HomeStaffServlet extends HttpServlet {

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
        
        MotorcycleDAO md = MotorcycleDAO.getInstance();
        CategoryDAO c = CategoryDAO.getInstance();
        PriceListDAO pd = PriceListDAO.getInstance();
        
        List<Motorcycle> listM = md.getTop5MotorcycleTheMostRental();
        List<PriceList> listP = pd.getAllPriceList();
        
        LinkedHashMap<String, Integer> listCR = c.geNumberRentalCategory();
                
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        session.setAttribute("account", account);
        
        request.setAttribute("listM", listM);
        request.setAttribute("listP", listP);
        
        Gson gson = new Gson();
        String json = gson.toJson(listCR);
        request.setAttribute("categoryData", json);
        
        request.getRequestDispatcher("homeStaff.jsp").forward(request, response);
        
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
