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
import com.colorbike.dto.SearchCriteria.PriceRange;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

@WebServlet(name = "SearchCriteriaServlet", urlPatterns = {"/searchCriteria"})
public class SearchCriteriaServlet extends HttpServlet {

    MotorcycleDAO motorcycleDAO = MotorcycleDAO.getInstance();
    CategoryDAO categoryDAO = CategoryDAO.getInstance();
    PriceListDAO priceListDAO = PriceListDAO.getInstance();
    BrandDAO brandDAO = BrandDAO.getInstance();
    DemandDAO demandDAO = DemandDAO.getInstance();
    DemandPriceRangeDAO demandPriceRangeDAO = DemandPriceRangeDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        HttpSession session = request.getSession();
        session.setAttribute("criteria", criteria);
        
        List<Motorcycle> motorcycles = motorcycleDAO.searchTop3MotorcyclesByCriteria(criteria);
        List<Category> categoriesList = categoryDAO.getAllCategory();
        List<PriceList> priceLists = priceListDAO.getAllPriceList();
        List<Brand> brandLists = brandDAO.getAllBrand();
        List<String> listDisplacement = motorcycleDAO.getListDisplacements();
        List<Demand> listDemand = demandDAO.getAllDemand();
        List<PriceRange> listPriceRange = demandPriceRangeDAO.getListDemandPriceRanges();

        Map<Integer, String> categoryMap = new HashMap<>();
        for (Category category : categoriesList) {
            categoryMap.put(category.getCategoryID(), category.getCategoryName());
        }

        Map<Integer, Double> priceMap = new HashMap<>();
        for (PriceList priceList : priceLists) {
            priceMap.put(priceList.getPriceListId(), priceList.getDailyPriceForDay());
        }
        request.setAttribute("search", "searchCriteria");
        request.setAttribute("listPriceRange", listPriceRange);
        request.setAttribute("listDisplacement", listDisplacement);
        request.setAttribute("listBrand", brandLists);
        request.setAttribute("listDemand", listDemand);
        request.setAttribute("categories", categoriesList);
        request.setAttribute("priceLists", priceLists);
        request.setAttribute("categoryMap", categoryMap);
        request.setAttribute("priceMap", priceMap);
        request.setAttribute("motorcycles", motorcycles);
        if (motorcycles.isEmpty()) {
            request.setAttribute("noResults", true);
        }
        request.getRequestDispatcher("motorbikes.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
