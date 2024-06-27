/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.TouristLocation;
import com.colorbike.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huypd
 */
public class TouristLocationDAO implements Serializable, DAO<FAQDAO> {

    private static TouristLocationDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private TouristLocationDAO() {
    }

    public static TouristLocationDAO getInstance() {

        if (instance == null) {
            instance = new TouristLocationDAO();
        }
        return instance;
    }

    public List<TouristLocation> getAllTouristLocation() {
        List<TouristLocation> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "Select * from TouristLocation;";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new TouristLocation(rs.getInt("locationId"), rs.getString("locationName"), rs.getString("locationImage"), rs.getString("description"), rs.getString("urlArticle"), rs.getString("staffID")));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public TouristLocation getTouristLocationbyID(int id) {
        String sql = "SELECT * FROM TouristLocation WHERE LocationID = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                TouristLocation touristLocation = new TouristLocation();
                touristLocation.setLocationId(rs.getInt(1));
                touristLocation.setLocationName(rs.getString(2));
                touristLocation.setLocationImage(rs.getString(3));
                touristLocation.setDescription(rs.getString(4));
                touristLocation.setUrlArticle(rs.getString(5));
                touristLocation.setStaffID(rs.getString(6));

                return touristLocation;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void addNewTouristLocation(TouristLocation touristLocation) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "INSERT INTO [dbo].[TouristLocation] ([LocationName], [LocationImage], [Description], [UrlArticle], [StaffID]) VALUES (?, ?, ?, ?, ?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, touristLocation.getLocationName());
            stm.setString(2, touristLocation.getLocationImage());
            stm.setString(3, touristLocation.getDescription());
            stm.setString(4, touristLocation.getUrlArticle());
            stm.setString(5, touristLocation.getStaffID());
            rs = stm.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
//    public void addNewTouristLocation(String locationName, String locationImage, String description, String urlArticle, String staffID) {
//        PreparedStatement stm;
//        ResultSet rs;
//        try {
//            String sql = "INSERT INTO [dbo].[TouristLocation] ([LocationName], [LocationImage], [Description], [UrlArticle], [StaffID]) VALUES (?, ?, ?, ?, ?)";
//            stm = conn.prepareStatement(sql);
//            stm.setString(1, locationName);
//            stm.setString(2, locationImage);
//            stm.setString(3, description);
//            stm.setString(4, urlArticle);
//            stm.setString(5, staffID);
//            rs = stm.executeQuery();
//        } catch (Exception ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }

    public void deleteTouristLocation(String id) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "Delete from [dbo].[TouristLocation] where LocationID= ?;";
            stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateTouristLocation(TouristLocation touristLocation) {
        PreparedStatement stm;
        try {
            String sql = "UPDATE [dbo].[TouristLocation]\n"
                    + "   SET [LocationName] = ?\n"
                    + "      ,[LocationImage] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[UrlArticle] = ?\n"
                    + "      ,[StaffID] = ?\n"
                    + " WHERE LocationID = ?";
            stm = conn.prepareStatement(sql);
            stm.setInt(6, touristLocation.getLocationId());
            stm.setString(1, touristLocation.getLocationName());
            stm.setString(2, touristLocation.getLocationImage());
            stm.setString(3, touristLocation.getDescription());
            stm.setString(4, touristLocation.getUrlArticle());
            stm.setString(5, touristLocation.getStaffID());
            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("TouristLocation updated successfully.");
            } else {
                System.out.println("No TouristLocation updated.");
            }
        } catch (Exception e) {
            System.out.println("Error updating TouristLocation: " + e.getMessage());
        }
    }

    @Override
    public List<FAQDAO> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(FAQDAO t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(FAQDAO t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(FAQDAO t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

   
}
