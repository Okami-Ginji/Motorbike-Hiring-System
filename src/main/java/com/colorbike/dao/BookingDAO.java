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
import java.sql.SQLException;
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
    
    public void addBooing(String bookingID,String bookingDate,String startDate,String endDate,String deliveryLocation,String returnedLocation, Integer voucherID, int customerID){
        String sql = " INSERT INTO [dbo].[Booking] (\n" +
                    "    [BookingID], \n" +
                    "    [BookingDate], \n" +
                    "    [StartDate], \n" +
                    "    [EndDate], \n" +
                    "    [DeliveryLocation], \n" +
                    "    [ReturnedLocation], \n" +
                    "    [DeliveryStatus], \n" +
                    "    [VoucherID], \n" +
                    "    [CustomerID]\n" +
                    ") VALUES"
                    + " (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlNoVoucher = " INSERT INTO [dbo].[Booking] (\n" +
                    "    [BookingID], \n" +
                    "    [BookingDate], \n" +
                    "    [StartDate], \n" +
                    "    [EndDate], \n" +
                    "    [DeliveryLocation], \n" +
                    "    [ReturnedLocation], \n" +
                    "    [DeliveryStatus], \n" +
                    "    [CustomerID]\n" +
                    ") VALUES"
                    + " (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            if(voucherID == 0){
                PreparedStatement ps = conn.prepareStatement(sqlNoVoucher);
                ps.setString(1, bookingID);
                ps.setString(2, bookingDate);
                ps.setString(3, startDate);
                ps.setString(4, endDate);
                ps.setString(5, deliveryLocation);
                ps.setString(6, returnedLocation);
                ps.setString(7, "Chưa giao");
                ps.setInt(8, customerID);
                ps.executeUpdate();
            }else {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, bookingID);
                ps.setString(2, bookingDate);
                ps.setString(3, startDate);
                ps.setString(4, endDate);
                ps.setString(5, deliveryLocation);
                ps.setString(6, returnedLocation);
                ps.setString(7, "Chưa giao");
                ps.setInt(8, voucherID);
                ps.setInt(9, customerID);
                ps.executeUpdate();
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
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
    
    public static void main(String[] args) {
        BookingDAO b = new BookingDAO();
        b.addBooing("BOOK000009", "2023-12-12", "2023-12-15", "2023-12-30", "21 Mộc Sơn 2, Hoà Hải", "105 Núi Thành, Hải Châu 2",1 , 1);
    }
}
