/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.BrandDAO;
import com.colorbike.dao.CategoryDAO;
import com.colorbike.dao.DemandDAO;
import com.colorbike.dao.DemandPriceRangeDAO;
import com.colorbike.dao.MotorcycleDAO;
import com.colorbike.dao.PriceListDAO;
import com.colorbike.dto.Motorcycle;
import com.colorbike.dto.SearchCriteria;
import com.colorbike.dto.SearchCriteria.PriceRange;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author huypd
 */
@WebServlet(name = "SearchCriteriaServlet", urlPatterns = {"/searchCriteria"})
public class SearchCriteriaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchCriteriaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchCriteriaServlet at " + request.getContextPath() + "</h1>");
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
        MotorcycleDAO motorcycleDAO = MotorcycleDAO.getInstance();

        String[] priceRanges = request.getParameterValues("priceRanges");
        String[] brands = request.getParameterValues("brands");
        String[] categories = request.getParameterValues("categories");
        String[] displacements = request.getParameterValues("displacements");
        String[] demands = request.getParameterValues("demands");
        SearchCriteria criteria = new SearchCriteria();

        //   Populate the criteria object
        if (priceRanges != null) {
            for (String range : priceRanges) {
                String[] prices = range.split(",");
                double minPrice = Double.parseDouble(prices[0]);
                double maxPrice = Double.parseDouble(prices[1]);
                if (maxPrice == 0) {
                    maxPrice = Double.MAX_VALUE;
                }
                criteria.addPriceRange(minPrice, maxPrice);
            }
        }
        if (brands != null) {
            for (String brandId : brands) {
                criteria.addBrandID(Integer.parseInt(brandId));
            }
        }

        if (categories != null) {
            for (String categoryId : categories) {
                criteria.addCategoryID(Integer.parseInt(categoryId));
            }
        }

        if (displacements != null) {
            for (String displacement : displacements) {
                criteria.addDisplacement(displacement);
            }
        }

        if (demands != null) {
            for (String demandId : demands) {
                criteria.addDemandID(Integer.parseInt(demandId));
            }
        }
        List<Motorcycle> motorcycles = motorcycleDAO.searchMotorcycleByCriteria(criteria);
//        response.getWriter().println(motorcycles);
        request.setAttribute("motorcycles", motorcycles);
        request.getRequestDispatcher("motorbikes.jsp").forward(request, response);
        
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
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
