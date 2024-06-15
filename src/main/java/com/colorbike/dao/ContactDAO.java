/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author huypd
 */
public class ContactDAO implements Serializable {

    private static ContactDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private ContactDAO() {

    }

    public static ContactDAO getInstance() {
        if (instance == null) {
            instance = new ContactDAO();
        }
        return instance;
    }

    public void insertContact(String name, String phoneNumber, String email, String title, String message, Integer accountID) {
        String sql = "INSERT INTO [dbo].[Contact]\n"
                + "           ([Name]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[Email]\n"
                + "           ,[Title]\n"
                + "           ,[Message]\n"
                + "           ,[AccountID])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phoneNumber);
            ps.setString(3, email);
            ps.setString(4, title);
            ps.setString(5, message);
             if (accountID != null) {
                ps.setInt(6, accountID);
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);
            }
           
           
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        ContactDAO cd = ContactDAO.getInstance();
       
        cd.insertContact("Jessica", "0912345678", "jessica123@gmail.com", "Ask Question 1", "123 abc", null);
    }
}
