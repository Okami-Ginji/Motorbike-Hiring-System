/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Extension;
import com.colorbike.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author huypd
 */
public class ExtensionDAO {

    private static ExtensionDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private ExtensionDAO() {
    }

    public static ExtensionDAO getInstance() {

        if (instance == null) {
            instance = new ExtensionDAO();
        }
        return instance;
    }


    public boolean adđExtension(String previousEndDate, String newEndDate,
                        double extensionFee, String bookingId) {
        String sql = "INSERT INTO [dbo].[Extension]\n"
                + "           ([ExtensionDate]\n"
                + "           ,[PreviousEndDate]\n"
                + "           ,[NewEndDate]\n"
                + "           ,[ExtenstionFee]\n"
                + "           ,[BookingID]\n"
                + "           ,[StaffID])\n"
                + "     VALUES\n"
                + "           (GETĐATE(), ?, ?, ?, ?, null)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, previousEndDate);
            ps.setString(2, newEndDate);
            ps.setDouble(3, extensionFee);
            ps.setString(4, bookingId);
            ps.executeUpdate();
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

}
