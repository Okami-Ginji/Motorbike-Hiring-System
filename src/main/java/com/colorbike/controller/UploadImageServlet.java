/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.colorbike.controller;

import com.colorbike.dao.AccountDAO;
import com.colorbike.dto.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 *
 * @author MINH TUAN
 */
@WebServlet(name = "UploadImageServlet", urlPatterns = {"/uploadimage"})
@MultipartConfig // Thêm annotation này
public class UploadImageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private FileUploaded fileUploadHandler;

    @Override
    public void init() throws ServletException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        fileUploadHandler = new FileUploaded(uploadPath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("profileCustomer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        String name = request.getParameter("name");
        Part filePart = request.getPart("file");
        
        String realPath = request.getServletContext().getRealPath("/images");
        String fileName =  Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if( !Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }
        filePart.write(realPath + "/" + fileName);
        } catch (Exception e) {
            System.out.println(e);
        }
//        if (filePart != null && filePart.getSize() > 0) {
//            String fileName = fileUploadHandler.generateNewFileName(fileUploadHandler.getFileName(filePart));
//            String filePath = fileUploadHandler.handleFileUpload(filePart, fileName);
//            Account account = (Account) session.getAttribute("account");
//            if (filePath != null) {
//                // Update the database with the new file path
//                AccountDAO.getInstance().updateProfileImage(account.getAccountId(), filePath);
//
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
//                response.getWriter().write("{\"success\": true, \"filePath\": \"" + filePath + "\"}");
//            } else {
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
//                response.getWriter().write("{\"success\": false}");
//            }
//        } else {
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write("{\"success\": false, \"message\": \"No file uploaded\"}");
//        }
    }
}
