/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Payment;
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
public class PaymentDAO implements Serializable {

    private static PaymentDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private PaymentDAO() {
    }

    public static PaymentDAO getInstance() {

        if (instance == null) {
            instance = new PaymentDAO();
        }
        return instance;
    }

    public Payment getPayMentbyBookingId(String bookingId) {
        PreparedStatement stm;
        ResultSet rs;
        String sql = "Select * from Payment where BookingID = ?";
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, bookingId);
            rs = stm.executeQuery();
            if (rs.next()) {
                Payment payment = new Payment();
                payment.setPaymentId(rs.getInt(1));
                payment.setBookingId(rs.getString(2));
                payment.setPaymentMethod(rs.getString(3));
                payment.setPaymentDate(rs.getString(4));
                payment.setPaymentAmount(rs.getDouble(5));
                payment.setPaymentStatus(rs.getString(6));
                return payment;
            }
        } catch (SQLException e) {
            Logger.getLogger(ExtensionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void addPayment(String bookingId, String method, String paymentDate, int amount, String status) {
        String sql = "INSERT INTO [dbo].[Payment] \n"
                + "    ([BookingID], [PaymentMethod], [PaymentDate], [PaymentAmount], [PaymentStatus])\n"
                + "VALUES \n"
                + "    (?,?, ?, ?, ?);";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, bookingId);
            ps.setString(2, method);
            ps.setString(3, paymentDate);
            ps.setInt(4, amount);
            ps.setString(5, status);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Payment> getListByBookingId(String id) {
        List<Payment> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "Select * from Payment where BookingID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Payment(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getString(6)));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        PaymentDAO dao = getInstance();
        for (Payment x : dao.getListByBookingId("BOOK908040")) {
            System.out.println(x);
        }
    }
}
