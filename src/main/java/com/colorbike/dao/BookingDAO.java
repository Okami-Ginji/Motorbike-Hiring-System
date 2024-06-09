/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Booking;
import com.colorbike.dto.Motorcycle;
import com.colorbike.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huypd
 */
public class BookingDAO {
     private static BookingDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private BookingDAO() {
    }

    public static BookingDAO getInstance() {

        if (instance == null) {
            instance = new BookingDAO();
        }
        return instance;
    }
    
    public Booking getBookingById(String bookingId) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT * FROM Booking WHERE BookingID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, bookingId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Booking(rs.getString("BookingID"), rs.getString("BookingDate"), rs.getString("StartDate"),
                        rs.getString("EndDate"), rs.getString("DeliveryLocation"), rs.getString("ReturnedLocation"), rs.getInt("VoucherID"), rs.getInt("CustomerID"));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
