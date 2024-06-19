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
    
    public void addBooking(String bookingID, String bookingDate, String startDate, String endDate, String deliveryLocation, String returnedLocation, Integer voucherID, int customerID) {
        String sql = " INSERT INTO [dbo].[Booking] (\n"
                + "    [BookingID], \n"
                + "    [BookingDate], \n"
                + "    [StartDate], \n"
                + "    [EndDate], \n"
                + "    [StatusBooking], \n"
                + "    [DeliveryLocation], \n"
                + "    [ReturnedLocation], \n"
                + "    [DeliveryStatus], \n"
                + "    [VoucherID], \n"
                + "    [CustomerID]\n"
                + ") VALUES"
                + " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlNoVoucher = " INSERT INTO [dbo].[Booking] (\n"
                + "    [BookingID], \n"
                + "    [BookingDate], \n"
                + "    [StartDate], \n"
                + "    [EndDate], \n"
                + "    [StatusBooking], \n"
                + "    [DeliveryLocation], \n"
                + "    [ReturnedLocation], \n"
                + "    [DeliveryStatus], \n"
                + "    [CustomerID]\n"
                + ") VALUES"
                + " (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            if (voucherID == 0) {
                PreparedStatement ps = conn.prepareStatement(sqlNoVoucher);
                ps.setString(1, bookingID);
                ps.setString(2, bookingDate);
                ps.setString(3, startDate);
                ps.setString(4, endDate);
                ps.setString(5, "Chờ xác nhận");
                ps.setString(6, deliveryLocation);
                ps.setString(7, returnedLocation);
                ps.setString(8, "Chưa giao");
                ps.setInt(9, customerID);
                ps.executeUpdate();
            } else {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, bookingID);
                ps.setString(2, bookingDate);
                ps.setString(3, startDate);
                ps.setString(4, endDate);
                ps.setString(5, "Chờ xác nhận");
                ps.setString(6, deliveryLocation);
                ps.setString(7, returnedLocation);
                ps.setString(8, "Chưa giao");
                ps.setInt(9, voucherID);
                ps.setInt(10, customerID);
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Map<String, Object>> getMotorcyclesByBookingID(String bookingID) {
        PreparedStatement stm;
        ResultSet rs;
        List<Map<String, Object>> motorcycleList = new ArrayList<>();
        String sql = "SELECT m.Model, COUNT(m.MotorcycleID) AS Quantity, m.Image, c.CategoryName "
                + "FROM Motorcycle m "
                + "JOIN [Motorcycle Detail] md ON m.MotorcycleID = md.MotorcycleID "
                + "JOIN Category c ON c.CategoryID = m.CategoryID "
                + "WHERE md.MotorcycleDetailID IN (SELECT MotorcycleDetailID FROM [Booking Detail] WHERE BookingID = ?) "
                + "GROUP BY m.Model, m.Image, c.CategoryName";
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, bookingID);
            rs = stm.executeQuery();
            while (rs.next()) {
                Map<String, Object> motorcycleInfo = new HashMap<>();
                motorcycleInfo.put("Model", rs.getString("Model"));
                motorcycleInfo.put("Quantity", rs.getInt("Quantity"));
                motorcycleInfo.put("Image", rs.getString("Image"));
                motorcycleInfo.put("CategoryName", rs.getString("CategoryName"));

                motorcycleList.add(motorcycleInfo);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return motorcycleList;
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
                    if (deliveryStatus.equals("notDelivered")) {
                        sql.append("N'Chưa giao'");
                    }
                    if (deliveryStatus.equals("delivered")) {
                        sql.append("N'Đã giao'");
                    }
                    if (deliveryStatus.equals("returned")) {
                        sql.append("N'Đã trả'");
                    }
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
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return motorcycleDetails;
    }

    public boolean updateBookingStatus(String bookingID, String status) {
        PreparedStatement stm;
        String sql = "UPDATE Booking SET StatusBooking = ? WHERE BookingID = ?";
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, bookingID);
            int rowAffect = stm.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Booking getLastestBooking(int accountId) {
        PreparedStatement stm;
        ResultSet rs;
        String sql = "SELECT TOP 1 *\n"
                + "FROM Booking\n"
                + "WHERE CustomerID = (SELECT CustomerID FROM Customer WHERE AccountID = ?)\n"
                + "ORDER BY BookingDate DESC;";
        try {
            stm = conn.prepareStatement(sql);
            stm.setInt(1, accountId);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Booking(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
   
    public static void main(String[] args) {
        BookingDAO bookingDAO = BookingDAO.getInstance();
//        System.out.println(bookingDAO.getMotorcycleDetailsByBookingID("BOOK000006"));
//        System.out.println(bookingDAO.updateBookingStatus("BOOK000006", "Đã hủy"));
        System.out.println(bookingDAO.getLastestBooking(10));
    }
}
