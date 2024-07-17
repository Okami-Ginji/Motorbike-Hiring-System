/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Brand;
import com.colorbike.util.DBUtil;
import java.io.Serializable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huypd
 */
public class BrandDAO implements Serializable {

    private static BrandDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private BrandDAO() {
    }

    public static BrandDAO getInstance() {

        if (instance == null) {
            instance = new BrandDAO();
        }
        return instance;
    }

    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT * FROM Brand";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                //feedback.setContent(feedback.getContent()+ customerName);
                list.add(new Brand(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
     public LinkedHashMap<String, Integer> getTotalPriceBrand() {
        LinkedHashMap<String, Integer> list = new LinkedHashMap<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT\n" +
                        "	B.BrandID,\n" +
                        "    B.BrandName,\n" +
                        "    ISNULL(SUM(CASE \n" +
                        "                WHEN BD.BookingID IS NOT NULL THEN P.DailyPriceForDay\n" +
                        "                ELSE 0\n" +
                        "               END), 0) AS TotalPrice\n" +
                        "FROM\n" +
                        "    [dbo].[Brand] B\n" +
                        "    LEFT JOIN [dbo].[Motorcycle] M ON B.BrandID = M.BrandID\n" +
                        "    LEFT JOIN [dbo].[Motorcycle Detail] MD ON M.MotorcycleID = MD.MotorcycleID\n" +
                        "    LEFT JOIN [dbo].[Booking Detail] BD ON MD.MotorcycleDetailID = BD.MotorcycleDetailID\n" +
                        "    LEFT JOIN [dbo].[PriceList] P ON M.PriceListID = P.PriceListID\n" +
                        "GROUP BY\n" +
                        "    B.BrandID,B.BrandName\n" +
                        "ORDER BY\n" +
                        "    B.BrandID";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.put(rs.getString("BrandName"),rs.getInt("TotalPrice"));
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        BrandDAO bd = BrandDAO.getInstance();
        
        for (Map.Entry<String, Integer> entry : bd.getTotalPriceBrand().entrySet()) {
            System.out.println("Motorcycle: " + entry.getKey() + ", Quantity: " + entry.getValue());
        }
    }

}
