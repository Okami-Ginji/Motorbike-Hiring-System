/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.controller;

import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.commons.fileupload.FileUpload;

/**
 *
 * @author Administrator
 */
public class FileUploaded {
    private String uploadPath;

    public FileUploaded(String uploadPath) {
        this.uploadPath = uploadPath;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Tạo thư mục nếu chưa tồn tại
        }
    }
    

    public String handleFileUpload(Part part, String fileName) throws IOException {
        String originalFileName = getFileName(part);
        if (originalFileName != null && !originalFileName.isEmpty()) {
            String newFileName = generateNewFileName(originalFileName);
            String filePath = uploadPath + File.separator + fileName;
            File file = new File(filePath);
            Files.copy(part.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            return filePath;
        }
        return null;
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        if (contentDisposition != null) {
            for (String cd : contentDisposition.split(";")) {
                if (cd.trim().startsWith("filename")) {
                    return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                }
            }
        }
        return null;
    }

    private String generateNewFileName(String originalFileName) {
        String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String fileExtension = "";
        int dotIndex = originalFileName.lastIndexOf('.');
        if (dotIndex > 0) {
            fileExtension = originalFileName.substring(dotIndex);
        }
        return originalFileName.substring(0, dotIndex) + "_" + timestamp + fileExtension;
    }

    public static void main(String[] args) {
        // Example usage
        String uploadDir = "/upload";
        FileUploaded fileUploadHandler = new FileUploaded(uploadDir);

        // Assuming 'part' is obtained from an HTTP request in a servlet environment
        // Part part = request.getPart("file");

        // Simulate the part object (for example purposes only, this part won't work in non-servlet environments)
        // try {
        //     String uploadedFilePath = fileUploadHandler.handleFileUpload(part);
        //     System.out.println("File uploaded to: " + uploadedFilePath);
        // } catch (IOException e) {
        //     e.printStackTrace();
        // }
    }
}