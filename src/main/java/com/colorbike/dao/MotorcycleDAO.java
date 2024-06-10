/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Account;
import com.colorbike.dto.Motorcycle;
import com.colorbike.dto.PriceList;
import com.colorbike.dto.SearchCriteria;
import com.colorbike.dto.SearchCriteria.PriceRange;
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
public class MotorcycleDAO implements Serializable, DAO<Motorcycle> {

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

    @Override
    public List<Motorcycle> getAll() {
        List<Motorcycle> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT \n"
                    + "    MotorcycleID,\n"
                    + "    Model,\n"
                    + "    Image,\n"
                    + "    Displacement,\n"
                    + "    Description,\n"
                    + "    [MinAge],\n"
                    + "    BrandID,\n"
                    + "    CategoryID,\n"
                    + "    PriceListID\n"
                    + "FROM \n"
                    + "    dbo.Motorcycle;";
    //why không * đi
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Motorcycle(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8),
                        rs.getInt(9)));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //Lấy xe máy theo id ==> xem detail
    public Motorcycle getMotorcycleByid(String id) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT \n"
                    + "    MotorcycleID,\n"
                    + "    Model,\n"
                    + "    Image,\n"
                    + "    Displacement,\n"
                    + "    Description,\n"
                    + "    [MinAge],\n"
                    + "    BrandID,\n"
                    + "    CategoryID,\n"
                    + "    PriceListID\n"
                    + "FROM \n"
                    + "    dbo.Motorcycle WHERE MotorcycleID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Motorcycle(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8),
                        rs.getInt(9));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //đếm số lượn motorcycles trong database
    public int getTotalMotorcycles() {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "select COUNT(*) from Motorcycle;";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<String> getListDisplacements() {
        List<String> listS = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT DISTINCT Displacement FROM Motorcycle";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                listS.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return listS;
    }

    public List<Motorcycle> pagingMotorcycles(int index) {
        PreparedStatement stm;
        ResultSet rs;
        List<Motorcycle> list = new ArrayList<>();
        try {
            String sql = "Select * from [Motorcycle]\n"
                    + "ORDER BY MotorcycleID\n"
                    + " OFFSET ? ROWS FETCH NEXT 9 ROW ONLY;";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 9);

            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Motorcycle(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8),
                        rs.getInt(9)));
            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return list;
    }

    //Tìm kiếm xe theo tên
    public List<Motorcycle> searchAndPagingMotorcyclesByName(String key, int index) {
        List<Motorcycle> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "Select * from [Motorcycle] WHERE Model LIKE ?\n"
                    + "ORDER BY MotorcycleID\n"
                    + "                    OFFSET ? ROWS FETCH NEXT 9 ROW ONLY;";

            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + key + "%");
            stm.setInt(2, (index - 1) * 9);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Motorcycle(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8),
                        rs.getInt(9)));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //Thanh lọc (giá, hãng, loại, phân khối, nhu cầu) 
    public List<Motorcycle> searchMotorcycleByCriteria(SearchCriteria criteria) {
        List<Motorcycle> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        StringBuilder sql = new StringBuilder("SELECT m.*\n"
                + "FROM Motorcycle m\n"
                + "	JOIN Demand_Detail d\n"
                + "	ON m.MotorcycleID = d.MotorcycleID\n"
                + "WHERE 1=1");
        //lấy theo giá
        if (!criteria.getPriceRanges().isEmpty()) {
            sql.append(" AND PriceListID IN (SELECT PriceListID\n"
                    + "	FROM PriceList\n"
                    + "	WHERE ");
            for (int i = 0; i < criteria.getPriceRanges().size(); i++) {
                if (i > 0) {
                    sql.append(" OR ");
                }
                sql.append("DailyPriceForDay BETWEEN ? AND ?");
            }
            sql.append(")");
        }
        //lấy theo hãng

        if (!criteria.getBrandIDs().isEmpty()) {
            sql.append(" AND BrandID IN (")
                    .append(generateParameterPlaceholders(criteria.getBrandIDs().size()))
                    .append(")");
        }
        //lấy theo loại

        if (!criteria.getCategoryIDs().isEmpty()) {
            sql.append(" AND CategoryID IN (")
                    .append(generateParameterPlaceholders(criteria.getCategoryIDs().size()))
                    .append(")");
        }
        //lấy theo phân khối
        if (!criteria.getDisplacements().isEmpty()) {
            sql.append(" AND Displacement IN (")
                    .append(generateParameterPlaceholders(criteria.getDisplacements().size()))
                    .append(")");
        }
        //lấy theo nhu cầu

        if (!criteria.getDemandIDs().isEmpty()) {
            sql.append(" AND d.DemandId IN (")
                    .append(generateParameterPlaceholders(criteria.getDemandIDs().size()))
                    .append(")");
        }
        try {
            stm = conn.prepareStatement(sql.toString());
            int parameterIndex = 1;
            //lấy theo giá
            for (PriceRange p : criteria.getPriceRanges()) {
                stm.setDouble(parameterIndex++, p.getMinPrice());
                stm.setDouble(parameterIndex++, p.getMaxPrice());
            }
            //lấy theo hãng
            for (int brandID : criteria.getBrandIDs()) {
                stm.setInt(parameterIndex++, brandID);
            }
            //lấy theo loại
            for (int categoryID : criteria.getCategoryIDs()) {
                stm.setInt(parameterIndex++, categoryID);
            }
            //lấy theo phân khối
            for (String displacement : criteria.getDisplacements()) {
                stm.setString(parameterIndex++, displacement);
            }
            //lấy theo nhu cầu
            for (int demandID : criteria.getDemandIDs()) {
                stm.setInt(parameterIndex++, demandID);
            }
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Motorcycle(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8),
                        rs.getInt(9)));
            }
        } catch (Exception ex) {
            Logger.getLogger(MotorcycleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    private String generateParameterPlaceholders(int count) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < count; i++) {
            if (i > 0) {
                builder.append(",");
            }
            builder.append("?");
        }
        return builder.toString();
    }

    public List<Motorcycle> getTop5MotorcycleTheMostRental() {
        List<Motorcycle> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {

            String sql = "SELECT TOP 5\n"
                    + "    m.MotorcycleID,\n"
                    + "    m.Model,m.Image,\n"
                    + " m.Description, m.MinAge, m.BrandID, m.CategoryID, m.PriceListID,\n"
                    + "    COUNT(bd.BookingDetailID) AS RentalCount,\n"
                    + "    MONTH(b.BookingDate) AS RentalMonth,\n"
                    + "    YEAR(b.BookingDate) AS RentalYear\n"
                    + "FROM \n"
                    + "    [dbo].[Motorcycle] m\n"
                    + "INNER JOIN \n"
                    + "    [dbo].[Motorcycle Detail] md ON m.MotorcycleID = md.MotorcycleID\n"
                    + "INNER JOIN \n"
                    + "    [dbo].[Booking Detail] bd ON md.MotorcycleDetailID = bd.MotorcycleDetailID\n"
                    + "INNER JOIN \n"
                    + "    [dbo].[Booking] b ON bd.BookingID = b.BookingID\n"
                    + "GROUP BY \n"
                    + "    m.MotorcycleID, m.Model,m.Image, m.Description, m.MinAge, m.BrandID, m.CategoryID, m.PriceListID, MONTH(b.BookingDate), YEAR(b.BookingDate)\n"
                    + "ORDER BY \n"
                    + "    RentalCount DESC";

            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Motorcycle(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8),
                        rs.getInt(9)));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void insert(Motorcycle t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Motorcycle t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Motorcycle t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        MotorcycleDAO dao = getInstance();
//        List<Motorcycle> list = dao.getTop5MotorcycleTheMostRental();
//
//        for (Motorcycle x : list) {
//            System.out.println(x);
//        }
        System.out.println(dao.getListDisplacements());
    }
}
