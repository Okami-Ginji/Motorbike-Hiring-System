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
import java.util.logging.Level;
import java.util.logging.Logger;

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
        String sql = "SELECT\n"
                + "    a.AccessoryID,\n"
                + "    a.AccessoryName,\n"
                + "    a.AccessoryImage,\n"
                + "    a.AccessoryImageIcon,\n"
                + "    a.AccessoryDescription,\n"
                + "    ad.Quantity,\n"
                + "    ad.TotalPrice\n"
                + "FROM\n"
                + "    [dbo].[AccessoryDetail] ad\n"
                + "JOIN\n"
                + "    [dbo].[Accessory] a ON ad.AccessoryID = a.AccessoryID\n"
                + "WHERE\n"
                + "    ad.BookingID = ?;";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.put(new Accessory(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getInt(7)), rs.getInt(6));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Lấy accessory theo id ==> xem detail
    public Accessory getAccessoryByid(int id) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "select * from Accessory where AccessoryID=?";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Accessory(rs.getInt("accessoryID"), rs.getString("accessoryName"), rs.getString("accessoryImage"), 
                        rs.getString("accessoryImageicon"), rs.getString("accessoryDescription"), rs.getInt("price"));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void addNewAccessory(Accessory accessory) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "INSERT INTO Accessory (AccessoryName, AccessoryImage, AccessoryImageIcon, AccessoryDescription, Price) VALUES (?, ?, ?, ?, ?);";
            stm = conn.prepareStatement(sql);
            stm.setString(1, accessory.getAccessoryName());
            stm.setString(2, accessory.getAccessoryImage());
            stm.setString(3, accessory.getAccessoryImageicon());
            stm.setString(4, accessory.getAccessoryDescription());
            stm.setDouble(5, accessory.getPrice());
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void updateAccessory(Accessory accessory) {
    PreparedStatement stm;
    try {
        String sql = "UPDATE Accessory SET AccessoryName = ?, AccessoryImage = ?, AccessoryImageIcon = ?, AccessoryDescription = ?, Price = ? WHERE AccessoryID = ?";
        stm = conn.prepareStatement(sql);
        stm.setString(1, accessory.getAccessoryName());
        stm.setString(2, accessory.getAccessoryImage());
        stm.setString(3, accessory.getAccessoryImageicon());
        stm.setString(4, accessory.getAccessoryDescription());
        stm.setDouble(5, accessory.getPrice());
        stm.setInt(6, accessory.getAccessoryId());
        
        int rowsUpdated = stm.executeUpdate();
        if (rowsUpdated > 0) {
            System.out.println("Accessory updated successfully");
        } else {
            System.out.println("Failed to update accessory");
        }
    } catch (SQLException ex) {
        Logger.getLogger(AccessoryDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
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
//        for (Accessory a : AccessoryDAO.getInstance().getAll()) {
//            System.out.println(a);
//        }
AccessoryDAO dao =new AccessoryDAO();
    for(Accessory x: dao.getAll()){
        System.out.println(x);
    }

        // Gọi phương thức addNewAccessory để thêm Accessory vào cơ sở dữ liệu
      
    }

}
