/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Cancellation;
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

    public boolean insertCancellation(String note, String bookingId, String staffID) {  //sẽ update thêm staff từ từ đã, hiện tại staff đang null
        String sql = "INSERT INTO Cancellation (CancellationDate, Note, BookingID, StaffID) VALUES (CURRENT_TIMESTAMP, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, note);
            ps.setString(2, bookingId);
            ps.setString(3, staffID);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public List<Cancellation> getAllCancellation() {
        PreparedStatement stm;
        ResultSet rs;
        List<Cancellation> list = new ArrayList<>();
        String sql = "Select CancellationID, FORMAT(CancellationDate, 'dd-MM-yyyy HH:mm:ss') AS CancellationDate, Note, BookingID, StaffID\n"
                + "from Cancellation";
        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Cancellation c = new Cancellation();
                c.setCancellationID(rs.getInt(1));
                c.setCancellationDate(rs.getString(2));
                c.setNote(rs.getString(3));
                c.setBookingID(rs.getString(4));
                c.setStaffID(rs.getString(5));
                list.add(c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean updateCancellationByStaff(String staffId, String bookingId) {
        PreparedStatement stm;
        String sql = "Update Cancellation SET StaffID = ? where BookingID = ?";
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, staffId);
            stm.setString(2, bookingId);

            int rowAffect = stm.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String[] args) {
//        System.out.println(CancellationDAO.getInstance().insertCancellation("Hahahihihuhu", "BOOK00000")); 
//        System.out.println(getInstance().getAllCancellation());
        System.out.println(getInstance().updateCancellationByStaff("STAFF00003", "BOOK000003"));
    }
}
