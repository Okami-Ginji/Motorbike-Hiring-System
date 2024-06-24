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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huypd
 */
public class PaymentDAO {

    private static PaymentDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
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
    public static void main(String[] args) {
        System.out.println(getInstance().getPayMentbyBookingId("BOOK000002"));
    }
}