/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.colorbike.controller;

import com.colorbike.dao.MotorcycleDAO;
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
import java.util.List;

/**
 *
 * @author huypd
 */
@WebServlet("/searchCriteria")
public class SearchCriteriaServlet extends HttpServlet {
   
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//    } 


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

        // Populate the criteria object
        if (priceRanges != null) {
            for (String range : priceRanges) {
                String[] prices = range.split(";");
                double minPrice = Double.parseDouble(prices[0]);
                double maxPrice = Double.parseDouble(prices[1]);
                criteria.addPriceRange(minPrice, maxPrice);
            }
        }

        if (brands != null) {
            for (String brand : brands) {
                criteria.addBrandID(Integer.parseInt(brand));
            }
        }

        if (categories != null) {
            for (String category : categories) {
                criteria.addCategoryID(Integer.parseInt(category));
            }
        }

        if (displacements != null) {
            for (String displacement : displacements) {
                criteria.addDisplacement(displacement);
            }
        }

        if (demands != null) {
            for (String demand : demands) {
                criteria.addDemandID(Integer.parseInt(demand));
            }
        }

        List<Motorcycle> motorcycles = motorcycleDAO.searchMotorcycleByCriteria(criteria);
        response.getWriter().println(motorcycles);
//        request.setAttribute("motorcycles", motorcycles);
//        request.getRequestDispatcher("motorbikes.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
