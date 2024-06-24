/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Account;
import com.colorbike.dto.MotorcycleDetail;
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
public class MotorcycleDetailDAO implements Serializable, DAO<MotorcycleDetail> {

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
                list.add(new MotorcycleDetail(rs.getInt("motorcycleDetailId"), rs.getString("motorcycleId"), rs.getString("licensePlate")));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<MotorcycleDetail> getMotorcycleDetail(String motorcycleId) {
        List<MotorcycleDetail> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT m.Model, md.LicensePlate \n"
                    + "FROM Motorcycle m \n"
                    + "JOIN [Motorcycle Detail] md ON m.MotorcycleID = md.MotorcycleID \n"
                    + "WHERE m.MotorcycleID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, motorcycleId);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new MotorcycleDetail(rs.getInt("motorcycleDetailId"), rs.getString("motorcycleId"), rs.getString("licensePlate")));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addMotorDetail(MotorcycleDetail detail) {
        String sql = "INSERT INTO [dbo].[Motorcycle Detail]\n"
                + "           ([MotorcycleID]\n"
                + "           ,[LicensePlate])\n"
                + "     VALUES\n"
                + "           (?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, detail.getMotorcycleId());
            ps.setString(2, detail.getLicensePlate());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public MotorcycleDetail getDetailByLicensePlate(String licensePlate) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "select * \n"
                    + "from [Motorcycle Detail] \n"
                    + "where LicensePlate = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, licensePlate);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new MotorcycleDetail(rs.getInt("MotorcycleDetailID"), rs.getString("MotorcycleID"), licensePlate);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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
        MotorcycleDetailDAO mdd = MotorcycleDetailDAO.getInstance();
        MotorcycleDetail detail = new MotorcycleDetail();
//        detail.setMotorcycleId("M00021");
//        detail.setLicensePlate("43-B1-111111");
//        mdd.addMotorDetail(detail);

        System.out.println(mdd.getDetailByLicensePlate("43-B1 111111"));

    }
}
