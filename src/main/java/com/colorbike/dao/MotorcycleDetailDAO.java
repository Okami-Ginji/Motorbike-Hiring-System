/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.MotorcycleDetail;
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
public class MotorcycleDetailDAO implements Serializable, DAO<MotorcycleDetail>{
    private static MotorcycleDetailDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private MotorcycleDetailDAO() {
    }

    public static MotorcycleDetailDAO getInstance() {

        if (instance == null) {
            instance = new MotorcycleDetailDAO();
        }
        return instance;
    }
    
    public List<MotorcycleDetail> getAllMotorcycleDetail() {
        List<MotorcycleDetail> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "select * from [dbo].[Motorcycle Detail];";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new MotorcycleDetail(rs.getInt("motorcycleDetailId"),rs.getString("motorcycleId"),rs.getString("licensePlate")));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Integer> getListAvailableMotorcycleDetailIdByMotorcycleName(String motorcycleName) {
        List<Integer> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "WITH LatestStatus AS (\n" +
                        "    SELECT\n" +
                        "        ms.MotorcycleDetailID,\n" +
                        "        ms.Status,\n" +
                        "        ROW_NUMBER() OVER (PARTITION BY ms.MotorcycleDetailID ORDER BY ms.MotorcycleStatusID DESC) AS RowNum\n" +
                        "    FROM\n" +
                        "        [dbo].[Motorcycle Status] ms\n" +
                        ")\n" +
                        "SELECT\n" +
                        "    md.MotorcycleDetailID\n" +
                        "   \n" +
                        "FROM\n" +
                        "    [dbo].[Motorcycle Detail] md\n" +
                        "INNER JOIN\n" +
                        "    LatestStatus ls ON md.MotorcycleDetailID = ls.MotorcycleDetailID AND ls.RowNum = 1\n" +
                        "INNER JOIN\n" +
                        "    [dbo].[Motorcycle] m ON md.MotorcycleID = m.MotorcycleID\n" +
                        "WHERE\n" +
                        "    ls.Status like N'Có sẵn' and CONCAT(m.Model, ' ', m.Displacement) LIKE ?\n" +
                        "ORDER BY\n" +
                        "    md.MotorcycleID;\n" +
                        "\n" +
                        "";
            stm = conn.prepareStatement(sql);
            stm.setString(1, motorcycleName);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    @Override
    public List<MotorcycleDetail> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(MotorcycleDetail t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(MotorcycleDetail t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(MotorcycleDetail t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static void main(String[] args) {
        MotorcycleDetailDAO dao = getInstance();
        for(int x: dao.getListAvailableMotorcycleDetailIdByMotorcycleName("VinFast Klara S 62 kW")){
            System.out.println(x);
        }
    }

}
