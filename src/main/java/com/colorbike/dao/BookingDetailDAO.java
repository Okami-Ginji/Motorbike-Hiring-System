/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.BookingDetail;
import com.colorbike.dto.Customer;
import com.colorbike.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huypd
 */
public class BookingDetailDAO {
     private static BookingDetailDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private BookingDetailDAO() {
    }

    public static BookingDetailDAO getInstance() {

        if (instance == null) {
            instance = new BookingDetailDAO();
        }
        return instance;
    }
    
    public void addBookingDetail(int MotorcycleDetailID, String BookingID, double TotalPrice) {
        String sql = "INSERT INTO [dbo].[Booking Detail]\n"
                + "           ([MotorcycleDetailID]\n"
                + "           ,[BookingID]\n"
                + "           ,[TotalPrice])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, MotorcycleDetailID);
            ps.setString(2, BookingID);
            ps.setDouble(3, TotalPrice);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        BookingDetailDAO dao = getInstance();
        dao.addBookingDetail(3,"BOOK271639",200.000);
       
//        List<Motorcycle> list = dao.searchMotorcycleByName("maha");
//        for (Motorcycle x : list) {
//            System.out.println(x);
//        }
    }
}
