/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Brand;
import com.colorbike.dto.PriceList;
import com.colorbike.util.DBUtil;

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

    public static void main(String[] args) {
        PriceListDAO bd = PriceListDAO.getInstance();
        System.out.println(bd.getAllPriceList());
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

}
