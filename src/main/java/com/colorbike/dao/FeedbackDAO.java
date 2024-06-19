/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Account;
import com.colorbike.dto.Customer;
import com.colorbike.dto.Feedback;
import com.colorbike.dto.Motorcycle;
import com.colorbike.util.DBUtil;
import java.io.Serializable;
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
public class FeedbackDAO implements Serializable {

    private static FeedbackDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private FeedbackDAO() {

    }

    public static FeedbackDAO getInstance() {
        if (instance == null) {
            instance = new FeedbackDAO();
        }
        return instance;
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();

        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT f.feedbackID, f.content, f.rate, a.FirstName + ' ' + a.LastName AS CustomerName, f.CustomerID\n"
                    + "                     FROM Feedback f \n"
                    + "                     JOIN Customer c ON f.customerID = c.customerID\n"
                    + "                     JOIN  Account a ON C.AccountID = a.AccountID;";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                //           list.add(new Feedback(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Feedback> getAllFeedbacks() {
        List<Feedback> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT f.*, a.firstName + ' ' + a.LastName, a.[Image]\n"
                    + "FROM Feedback f\n"
                    + "JOIN Customer c ON f.CustomerID = c.CustomerID\n"
                    + "JOIN Account a ON c.AccountID = a.AccountID";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int fbId = rs.getInt(1);
                String content = rs.getString(2);
                int productRate = rs.getInt(3);
                int serviceRate = rs.getInt(4);
                int deliveryRate = rs.getInt(5);
                int customerId = rs.getInt(6);
                String bookingId = rs.getString(7);
                String cusName = rs.getString(8);
                String cusImg = rs.getString(9);
                Feedback fb = new Feedback(fbId, content, productRate, serviceRate, deliveryRate, cusName, cusImg, customerId, bookingId);
                list.add(fb);
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean insertFeedback(String content, int productRate, int serviceRate, int deliveryRate, int customerId, String BookingID) {
        String sql = "INSERT INTO Feedback (Content, productRate, serviceRate, deliveryRate, CustomerID, BookingID) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, content);
            ps.setInt(2, productRate);
            ps.setInt(3, serviceRate);
            ps.setInt(4, deliveryRate);
            ps.setInt(5, customerId);
            ps.setString(6, BookingID);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public Feedback getFeedbackByBookingId(String bookingId) {
        String sql = "SELECT * FROM Feedback WHERE BookingID = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Feedback(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return null;
    }

    public boolean updateFeedback(String content, int productRate, int serviceRate, int deliveryRate, int customerId, String BookingID) {
        String sql = "UPDATE Feedback SET content = ?, productRate = ?, serviceRate = ?, deliveryRate = ?, customerId = ? "
                + "WHERE BookingID = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, content);
            ps.setInt(2, productRate);
            ps.setInt(3, serviceRate);
            ps.setInt(4, deliveryRate);
            ps.setInt(5, customerId);
            ps.setString(6, BookingID);
            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public static void main(String[] args) {
        FeedbackDAO fd = FeedbackDAO.getInstance();
//        System.out.println(fd.getAllFeedback());
//        System.out.println(fd.insertFeedback("Hihihahahuhu", 5, 2, 4, 6, "BOOK000006"));
        System.out.println(fd.insertFeedback("Hihihahahuhu", 5, 5, 5, 4, "BOOK000004"));
//        System.out.println(fd.getFeedbackByBookingId("BOOK000005"));
        System.out.println(fd.updateFeedback("OMG", 5, 3, 4, 6, "BOOK000005"));
        System.out.println(fd.getAllFeedbacks());
    }
}
