/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author huypd
 */
public class CancellationDAO {

    private static CancellationDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private CancellationDAO() {
    }

    public static CancellationDAO getInstance() {

        if (instance == null) {
            instance = new CancellationDAO();
        }
        return instance;
    }

    public boolean insertCancellation(String note, String bookingId) {  //sẽ update thêm staff từ từ đã, hiện tại staff đang null
        String sql = "INSERT INTO Cancellation (CancellationDate, Note, BookingID) VALUES (CURRENT_TIMESTAMP, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, note);
            ps.setString(2, bookingId);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(CancellationDAO.getInstance().insertCancellation("Hahahihihuhu", "BOOK00000")); 
    }
}
