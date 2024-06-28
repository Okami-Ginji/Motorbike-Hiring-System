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
import com.colorbike.dto.Brand;
import com.colorbike.dto.Category;
import com.colorbike.dto.Demand;
import com.colorbike.dto.Motorcycle;
import com.colorbike.dto.PriceList;
import com.colorbike.dto.SearchCriteria;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MotorcycleServlet2", urlPatterns = {"/MotorcycleServlet2"})
public class MotorcycleServlet2 extends HttpServlet {
private static final long serialVersionUID = 1L;

    MotorcycleDAO motorcycleDAO = MotorcycleDAO.getInstance();
    CategoryDAO categoryDAO = CategoryDAO.getInstance();
    PriceListDAO priceListDAO = PriceListDAO.getInstance();
    BrandDAO brandDAO = BrandDAO.getInstance();
    DemandDAO demandDAO = DemandDAO.getInstance();
    DemandPriceRangeDAO demandPriceRangeDAO = DemandPriceRangeDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> categories = categoryDAO.getAllCategory();
        List<PriceList> priceLists = priceListDAO.getAllPriceList();
        List<Brand> brandLists = brandDAO.getAllBrand();
        List<String> listDisplacement = motorcycleDAO.getListDisplacements();
        List<Demand> listDemand = demandDAO.getAllDemand();
        List<SearchCriteria.PriceRange> listPriceRange = demandPriceRangeDAO.getListDemandPriceRanges();
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int count = motorcycleDAO.getTotalMotorcycles();
        int endPage = count / 9;
        if (count % 9 != 0) {
            endPage++;
        }

        List<Motorcycle> motorcycles = motorcycleDAO.pagingMotorcycles(index);

        request.setAttribute("endP", endPage);

        Map<Integer, String> categoryMap = new HashMap<>();
        for (Category category : categories) {
            categoryMap.put(category.getCategoryID(), category.getCategoryName());
        }

        Map<Integer, Double> priceMap = new HashMap<>();
        for (PriceList p : priceLists) {
            priceMap.put(p.getPriceListId(), p.getDailyPriceForDay());
        }


        request.setAttribute("listPriceRange", listPriceRange);
        request.setAttribute("listDisplacement", listDisplacement);
        request.setAttribute("listBrand", brandLists);
        request.setAttribute("listDemand", listDemand);
        request.setAttribute("motorcycles", motorcycles);
        request.setAttribute("categories", categories);
        request.setAttribute("priceLists", priceLists);
        request.setAttribute("categoryMap", categoryMap);
        request.setAttribute("priceMap", priceMap);

        request.getRequestDispatcher("includes\\motorbikes2.jsp").forward(request, response);
    }
}
