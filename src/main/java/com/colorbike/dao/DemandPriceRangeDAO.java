/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Booking;
import com.colorbike.util.DBUtil;
import java.sql.Connection;
import com.colorbike.dto.SearchCriteria.PriceRange;
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
public class DemandPriceRangeDAO {
    private static DemandPriceRangeDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private DemandPriceRangeDAO() {
    }

    public static DemandPriceRangeDAO getInstance() {

        if (instance == null) {
            instance = new DemandPriceRangeDAO();
        }
        return instance;
    }
    public List<PriceRange> getListDemandPriceRanges() {
        List<PriceRange> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "select * from DemandPriceRange";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new PriceRange(rs.getDouble("MinPrice"), rs.getDouble("MaxPrice")));
            }
        } catch (Exception ex) {
            Logger.getLogger(DemandPriceRangeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static void main(String[] args) {
        DemandPriceRangeDAO dao = DemandPriceRangeDAO.getInstance();
        System.out.println(dao.getListDemandPriceRanges());
    }
}
