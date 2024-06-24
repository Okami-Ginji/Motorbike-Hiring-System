/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Motorcycle;
import com.colorbike.dto.PriceList;
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
public class PriceListDAO implements Serializable {

    private static PriceListDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private PriceListDAO() {
    }

    public static PriceListDAO getInstance() {

        if (instance == null) {
            instance = new PriceListDAO();
        }
        return instance;
    }

    public List<PriceList> getAllPriceList() {

        List<PriceList> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {

            String sql = "SELECT * FROM PriceList";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                //feedback.setContent(feedback.getContent()+ customerName);
                list.add(new PriceList(rs.getInt(1), rs.getDouble(2), rs.getDouble(3), rs.getDouble(4)));

            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return list;
    } 

    public PriceList getPricingByid(String id) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT * FROM PriceList WHERE priceListId = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                int priceListId = rs.getInt("priceListId");
                double pricePerDay = rs.getDouble("dailyPriceForDay");
                double pricePerWeek = rs.getDouble("dailyPriceForWeek");
                double pricePerMonth = rs.getDouble("dailyPriceForMonth");
                return new PriceList(priceListId, pricePerDay, pricePerWeek, pricePerMonth);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addPricing(PriceList price) {
        String sql = "INSERT INTO [dbo].[PriceList]\n"
                + "           ([DailyPriceForDay]\n"
                + "           ,[DailyPriceForWeek]\n"
                + "           ,[DailyPriceForMonth])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, price.getDailyPriceForDay());
            ps.setDouble(2, price.getDailyPriceForWeek());
            ps.setDouble(3, price.getDailyPriceForMonth());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updatePricing(double priceForDay, double priceForWeek, double priceForMonth, int ID) {
        String sql = "UPDATE [dbo].[PriceList]\n"
                + "   SET [DailyPriceForDay] = ?\n"
                + "      ,[DailyPriceForWeek] = ?\n"
                + "      ,[DailyPriceForMonth] = ?\n"
                + " WHERE PriceListID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, priceForDay);
            ps.setDouble(2, priceForWeek);
            ps.setDouble(3, priceForMonth);
            ps.setDouble(4, ID);           
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<PriceList> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void insert(PriceList t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void update(PriceList t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void delete(PriceList t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        PriceListDAO dao = getInstance();
//        List<PriceList> list = dao.getAllPriceList();
//        for (PriceList x : list) {
//            System.out.println(x);
//        }
        PriceList p = new PriceList();
        p.setDailyPriceForDay(230.00);
        p.setDailyPriceForWeek(230.00);
        p.setDailyPriceForMonth(230.00);
        dao.addPricing(p);
    }

}