/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Account;
import com.colorbike.dto.Motorcycle;
import com.colorbike.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huypd
 */
public class MotorcycleDAO implements Serializable {

    private static MotorcycleDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private MotorcycleDAO() {
    }

    public static MotorcycleDAO getInstance() {

        if (instance == null) {
            instance = new MotorcycleDAO();
        }
        return instance;
    }

    public List<Motorcycle> getListMotorcycle() {
        List<Motorcycle> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT \n" +
                        "    MotorcycleID,\n" +
                        "    Model,\n" +
                        "    Image,\n" +
                        "    Description,\n" +
                        "    [Min Age],\n" +
                        "    BrandID,\n" +
                        "    CategoryID,\n" +
                        "    PriceListID\n" +
                        "FROM \n" +
                        "    dbo.Motorcycle;";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add( new Motorcycle(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public Account login(String username, String password) {
        Account account = null;
        String sql = "SELECT * FROM [dbo].[Account] WHERE [Username] = ? AND [Password] = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int accountId = rs.getInt("AccountID");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String gender = rs.getString("Gender");
                String dob = rs.getString("DayOfBirth");
                String address = rs.getString("Address");
                String phoneNumber = rs.getString("PhoneNumber");
                String image = rs.getString("Image");
                String email = rs.getString("Email");
                int roleId = rs.getInt("RoleID");

                account = new Account(accountId, firstName, lastName, gender, dob, address, phoneNumber, image, email, username, password, roleId);
            }
            rs.close();
        } catch (Exception e) {
            System.out.println("Login failed: " + e.getMessage());
        }

        return account;
    }


   public void createANewAccount(String firstName, String lastName, String gender, String dob, String address, String phone, String image, String email, String userName, String password) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([FirstName]\n"
                + "           ,[LastName]\n"
                + "           ,[Gender]\n"
                + "           ,[DayOfBirth]\n"
                + "           ,[Address]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[Image]\n"
                + "           ,[Email]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[RoleID])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?, ? , ?, 1)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, gender);
            ps.setString(4, dob);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.setString(7, image);
            ps.setString(8, email);
            ps.setString(9, userName);
            ps.setString(10, password);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public Account getAccountByEmail(String email) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT * FROM Account WHERE Email =  ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    


    public String getToken(String token) {
        ResultSet rs;
        String sql = "Select user_email from Password_Reset_Tokens where token = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, token);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void resetPassword(String email, String password){
        String sql = "UPDATE Account SET Password = ? WHERE Email = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        MotorcycleDAO dao = getInstance();
        List<Motorcycle> list = dao.getListMotorcycle();
        for(Motorcycle x: list){
            System.out.println(x);
        }
    }

}
