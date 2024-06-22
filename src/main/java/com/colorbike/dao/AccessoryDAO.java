/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Accessory;
import com.colorbike.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author huypd
 */
public class AccessoryDAO implements Serializable, DAO<Accessory> {

    private static AccessoryDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private AccessoryDAO() {
    }

    public static AccessoryDAO getInstance() {

        if (instance == null) {
            instance = new AccessoryDAO();
        }
        return instance;
    }

    @Override
    public List<Accessory> getAll() {
        List<Accessory> list = new ArrayList<>();
        String sql = "SELECT * FROM [Accessory]";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Accessory(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public LinkedHashMap<Accessory, Integer> getListByBookingId(String id) {
        LinkedHashMap<Accessory, Integer> list = new LinkedHashMap<>();
        String sql = "SELECT\n" +
                "    a.AccessoryID,\n" +
                "    a.AccessoryName,\n" +
                "    a.AccessoryImage,\n" +
                "    a.AccessoryImageIcon,\n" +
                "    a.AccessoryDescription,\n" +
                "    ad.Quantity,\n" +
                "    ad.TotalPrice\n" +
                "FROM\n" +
                "    [dbo].[AccessoryDetail] ad\n" +
                "JOIN\n" +
                "    [dbo].[Accessory] a ON ad.AccessoryID = a.AccessoryID\n" +
                "WHERE\n" +
                "    ad.BookingID = ?;";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.put(new Accessory(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getInt(7)),rs.getInt(6));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public void insert(Accessory t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Accessory t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Accessory t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public static void main(String[] args) {
        for (Accessory a : AccessoryDAO.getInstance().getAll()) {
            System.out.println(a);
        }
    }

}
