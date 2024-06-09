/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.PriceList;
import com.colorbike.util.DBUtil;
import java.io.Serializable;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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


    public List<PriceList> getAllPricing() {

        List<PriceList> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {

            String sql = "Select * from PriceList;";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new PriceList(rs.getInt("priceListId"),rs.getDouble("dailyPriceForDay"),rs.getDouble("dailyPriceForWeek"),rs.getDouble("dailyPriceForMonth")));

            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        List<PriceList> list = dao.getAllPricing();
        for(PriceList x: list){
            System.out.println(x);
        }
    }

}
