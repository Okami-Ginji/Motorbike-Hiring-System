/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.EventDAO;
import com.colorbike.dto.Event;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author ADMIN
 */
@MultipartConfig
@WebServlet(name = "UpdateEventStaff", urlPatterns = {"/UpdateEventStaff"})
public class UpdateEventStaff extends HttpServlet {

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
            out.println("<title>Servlet UpdateEventStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateEventStaff at " + request.getContextPath() + "</h1>");
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
        EventDAO eventDAO = EventDAO.getInstance();
        String eventIDst = request.getParameter("eventID");
        int id = Integer.parseInt(eventIDst);
        Event event = eventDAO.getEventbyID(id);
        request.setAttribute("event", event);
        request.getRequestDispatcher("/eventStaff.jsp").forward(request, response);
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
        EventDAO eventDAO = EventDAO.getInstance();
        FileUploaded fileUploaded = new FileUploaded("D:\\ailaithuexeha\\MotorcycleRental\\src\\main\\webapp\\images");
        
        String eventIDst = request.getParameter("editEventID");
        String eventTitle = request.getParameter("editEventTitle");
//        String createdDate = request.getParameter("editCreatedDate");
        String startDate = request.getParameter("editStartDate");
        String endDate = request.getParameter("editEndDate");
        String content = request.getParameter("editContent");
        System.out.println(startDate);
        String name = "imageEvent" + eventTitle + ".jpg";
        Part part = request.getPart("editEventImage");
        fileUploaded.handleFileUpload(part, name);
        
        // Get current date and time
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        
        String discount = request.getParameter("editDiscount");
        
        String staffID = request.getParameter("editStaffID");
        try {
            int eventID = Integer.parseInt(eventIDst);
            double dis = Double.parseDouble(discount);
            Event event = new Event(eventID, eventTitle, formattedDateTime, startDate, endDate, content, name, dis, staffID);
            eventDAO.updateEvent(event);
        } catch (Exception e) {
        }
        response.sendRedirect("eventStaffServlet");
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
