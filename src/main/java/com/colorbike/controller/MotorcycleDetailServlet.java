/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.AccessoryDAO;
import com.colorbike.dao.BrandDAO;
import com.colorbike.dao.MotorcycleDAO;
import com.colorbike.dao.PriceListDAO;
import com.colorbike.dto.Accessory;
import com.colorbike.dto.Brand;
import com.colorbike.dto.Motorcycle;
import com.colorbike.dto.PriceList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MotorcycleDetailServlet", urlPatterns = {"/motorcycleDetail"})
public class MotorcycleDetailServlet extends HttpServlet {

    MotorcycleDAO motorcycleDAO = MotorcycleDAO.getInstance();
    BrandDAO brandDAO = BrandDAO.getInstance();
    PriceListDAO priceListDAO = PriceListDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String motorcycleId = request.getParameter("id");

        Motorcycle motorcycleDetail = motorcycleDAO.getMotorcycleByid(motorcycleId);
        List<Brand> brand = brandDAO.getAllBrand();
        int priceListId = motorcycleDetail.getPriceListID();

        PriceList priceList = priceListDAO.getPricingByid(String.valueOf(priceListId));
        List<Accessory> listAccess = AccessoryDAO.getInstance().getAll();

        request.setAttribute("motorcycleDetail", motorcycleDetail);
        request.setAttribute("brand", brand);
        request.setAttribute("priceList", priceList);
        request.setAttribute("listAccess", listAccess);
        request.getRequestDispatcher("motorbikeDetails.jsp").forward(request, response);
    }

}
