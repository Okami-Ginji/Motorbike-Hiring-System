/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Booking;
import com.colorbike.dto.BookingDetail;
import com.colorbike.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
                Booking b = new Booking();
                List<BookingDetail> listBookingDetails = BookingDetailDAO.getInstance().getListBookingDetails(rs.getString(1));
                b.setBookingID(rs.getString(1));
                b.setBookingDate(rs.getString(2));
                b.setStartDate(rs.getString(3));
                b.setEndDate(rs.getString(4));
                b.setStatusBooking(rs.getString(5));
                b.setDeliveryLocation(rs.getString(6));
                b.setReturnedLocation(rs.getString(7));
                b.setDeliveryStatus(rs.getString(8));
                b.setVoucherID(rs.getInt(9));
                b.setCustomerID(rs.getInt(10));
                b.setListBookingDetails(listBookingDetails);
                return b;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //all, pending, confirmed, cancelled
    public List<Booking> getBookingWithDetails(String statusBooking, String deliveryStatus, int accountID) {
        PreparedStatement stm;
        ResultSet rs;
        List<Booking> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Booking\n"
                + "WHERE CustomerID = (\n"
                + "	SELECT CustomerID FROM Customer WHERE AccountID = ?)");
        if (!"all".equals(statusBooking)) {
            sql.append(" AND");
            if ("pending".equals(statusBooking)) {
                sql.append(" StatusBooking = N'Chờ xác nhận'");
            }
            if ("confirmed".equals(statusBooking)) {
                sql.append(" StatusBooking = N'Đã xác nhận'"); 
                if (!deliveryStatus.equals("all")) {
                    sql.append(" AND DeliveryStatus = ");
                    if (deliveryStatus.equals("notDelivered"))
                        sql.append("N'Chưa giao'");
                    if (deliveryStatus.equals("delivered"))
                        sql.append("N'Đã giao'");
                    if (deliveryStatus.equals("returned"))
                        sql.append("N'Đã trả'");
                }
            }
            if ("cancelled".equals(statusBooking)) {
                sql.append(" StatusBooking = N'Đã hủy'");
            }
        }
        try {
            stm = conn.prepareStatement(sql.toString());
            stm.setInt(1, accountID);
            rs = stm.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                List<BookingDetail> listBookingDetails = BookingDetailDAO.getInstance().getListBookingDetails(rs.getString(1));
                b.setBookingID(rs.getString(1));
                b.setBookingDate(rs.getString(2));
                b.setStartDate(rs.getString(3));
                b.setEndDate(rs.getString(4));
                b.setStatusBooking(rs.getString(5));
                b.setDeliveryLocation(rs.getString(6));
                b.setReturnedLocation(rs.getString(7));
                b.setDeliveryStatus(rs.getString(8));
                b.setVoucherID(rs.getInt(9));
                b.setCustomerID(rs.getInt(10));
                b.setListBookingDetails(listBookingDetails);
                list.add(b);
            }
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Map<String, Integer> getMotorcycleDetailsByBookingID(String bookingID) {
        PreparedStatement stm;
        ResultSet rs;
        Map<String, Integer> motorcycleDetails = new HashMap<>();
        String sql = "select m.Model, COUNT(m.MotorcycleID) Quantity\n"
                + "from Motorcycle m\n"
                + "	JOIN [Motorcycle Detail] md\n"
                + "	ON m.MotorcycleID = md.MotorcycleID\n"
                + "where md.MotorcycleDetailID IN (\n"
                + "	select MotorcycleDetailID from [Booking Detail]\n"
                + "	where BookingID = ?\n"
                + ")\n"
                + "GROUP BY m.MotorcycleID, m.Model";
        try { 
            stm = conn.prepareStatement(sql);
            stm.setString(1, bookingID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String model = rs.getString("Model");
                int quantity = rs.getInt("Quantity");
                motorcycleDetails.put(model, quantity);
            }
        }catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return motorcycleDetails;
    }

    public static void main(String[] args) {
        BookingDAO bookingDAO = BookingDAO.getInstance();
        System.out.println(bookingDAO.getMotorcycleDetailsByBookingID("BOOK000006"));
    }
}
