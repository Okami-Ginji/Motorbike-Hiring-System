/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Category;
import com.colorbike.dto.Motorcycle;
import com.colorbike.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huypd
 */
public class CategoryDAO implements Serializable, DAO<Category>{
    private static CategoryDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private CategoryDAO() {
    }

    public static CategoryDAO getInstance() {

        if (instance == null) {
            instance = new CategoryDAO();
        }
        return instance;
    }
    
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "Select * from Category;";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("categoryID"),rs.getString("categoryName")));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public Category getCategoryById(int categoryId) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "Select * from Category where CategoryID = ?";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt("categoryID"),rs.getString("categoryName"));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public LinkedHashMap<String, Integer> geNumberRentalCategory() {
        LinkedHashMap<String, Integer> list = new LinkedHashMap<>();
        PreparedStatement stm;
        ResultSet rs;
        try {

            String sql = "SELECT \n" +
                        "    c.CategoryID,\n" +
                        "    c.CategoryName,\n" +
                        "    COUNT(bd.BookingDetailID) AS RentalCount\n" +
                        "FROM \n" +
                        "    [dbo].[Category] c\n" +
                        "LEFT JOIN \n" +
                        "    [dbo].[Motorcycle] m ON c.CategoryID = m.CategoryID\n" +
                        "LEFT JOIN \n" +
                        "    [dbo].[Motorcycle Detail] md ON m.MotorcycleID = md.MotorcycleID\n" +
                        "LEFT JOIN \n" +
                        "    [dbo].[Booking Detail] bd ON md.MotorcycleDetailID = bd.MotorcycleDetailID\n" +
                        "LEFT JOIN \n" +
                        "    [dbo].[Booking] b ON bd.BookingID = b.BookingID\n" +
                        "GROUP BY \n" +
                        "    c.CategoryID, c.CategoryName";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.put(rs.getString("CategoryName"),rs.getInt("RentalCount"));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        CategoryDAO dao = CategoryDAO.getInstance();
        LinkedHashMap<String, Integer> list = dao.geNumberRentalCategory();
        System.out.println(list.isEmpty());
    }
    @Override
    public List<Category> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Category t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Category t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Category t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
