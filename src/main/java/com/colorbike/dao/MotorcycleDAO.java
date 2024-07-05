/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Account;
import com.colorbike.dto.Motorcycle;
import com.colorbike.dto.MotorcycleDetail;
import com.colorbike.dto.PriceList;
import com.colorbike.dto.SearchCriteria;
import com.colorbike.dto.SearchCriteria.PriceRange;
import com.colorbike.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
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
                Motorcycle motorcycle = new Motorcycle();
                motorcycle.setMotorcycleId(rs.getString(1));
                motorcycle.setModel(rs.getString(2));
                motorcycle.setImage(rs.getString(3));
                motorcycle.setDisplacement(rs.getString(4));
                motorcycle.setDescription(rs.getString(5));
                motorcycle.setMinAge(rs.getInt(6));
                motorcycle.setBrandID(rs.getInt(7));
                motorcycle.setCategoryID(rs.getInt(8));
                motorcycle.setPriceListID(rs.getInt(9));
                List<MotorcycleDetail> listMotorcycleDetails = MotorcycleDetailDAO.getInstance().getMotorcycleDetail(rs.getString(1));
                motorcycle.setListMotorcycleDetails(listMotorcycleDetails);
                list.add(motorcycle);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public LinkedHashMap<String, String> getAllAvailableMotorCycle() {
        PreparedStatement stm;
        ResultSet rs;
        LinkedHashMap<String, String> list = new LinkedHashMap<>();
        try {
            String sql = "WITH LatestStatus AS (\n"
                    + "    SELECT\n"
                    + "        ms.MotorcycleDetailID,\n"
                    + "        ms.StatusAction,\n"
                    + "        ROW_NUMBER() OVER (PARTITION BY ms.MotorcycleDetailID ORDER BY ms.MotorcycleStatusID DESC) AS RowNum\n"
                    + "    FROM\n"
                    + "        [dbo].[Motorcycle Status] ms\n"
                    + ")\n"
                    + "SELECT\n"
                    + "    m.MotorcycleID,\n"
                    + "    COUNT(md.MotorcycleDetailID) AS AvailableCount\n"
                    + "FROM\n"
                    + "    [dbo].[Motorcycle] m\n"
                    + "INNER JOIN\n"
                    + "    [dbo].[Motorcycle Detail] md ON m.MotorcycleID = md.MotorcycleID\n"
                    + "INNER JOIN\n"
                    + "    LatestStatus ls ON md.MotorcycleDetailID = ls.MotorcycleDetailID AND ls.RowNum = 1\n"
                    + "WHERE\n"
                    + "    ls.StatusAction like N'Có sẵn'\n"
                    + "GROUP BY\n"
                    + "    m.MotorcycleID\n"
                    + "ORDER BY\n"
                    + "    m.MotorcycleID;";

            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String motorcycleID = rs.getString("MotorcycleID");
                String availableCount = rs.getString("AvailableCount");
                list.put(motorcycleID, availableCount);
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

    public LinkedHashMap<Motorcycle, Integer> getListMotorcycleByBookingId(String id) {
        PreparedStatement stm;
        ResultSet rs;
        LinkedHashMap<Motorcycle, Integer> list = new LinkedHashMap<>();
        try {
            String sql = "SELECT\n"
                    + "    m.MotorcycleID,\n"
                    + "    m.Model,\n"
                    + "    m.Image,\n"
                    + "    m.Displacement,\n"
                    + "    m.Description,\n"
                    + "    m.MinAge,\n"
                    + "    m.BrandID,\n"
                    + "    m.CategoryID,\n"
                    + "    m.PriceListID,\n"
                    + "    COUNT(bd.BookingDetailID) AS Quantity\n"
                    + "FROM\n"
                    + "    [dbo].[Booking Detail] bd\n"
                    + "JOIN\n"
                    + "    [dbo].[Motorcycle Detail] md ON bd.MotorcycleDetailID = md.MotorcycleDetailID\n"
                    + "JOIN\n"
                    + "    [dbo].[Motorcycle] m ON md.MotorcycleID = m.MotorcycleID\n"
                    + "WHERE\n"
                    + "    bd.BookingID = ?\n"
                    + "GROUP BY\n"
                    + "    m.MotorcycleID,\n"
                    + "    m.Model,\n"
                    + "    m.Image,\n"
                    + "    m.Displacement,\n"
                    + "    m.Description,\n"
                    + "    m.MinAge,\n"
                    + "    m.BrandID,\n"
                    + "    m.CategoryID,\n"
                    + "    m.PriceListID;";
            stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.put(new Motorcycle(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9)),
                        rs.getInt(10));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addMotorcycle(Motorcycle motor) {
        String sql = "INSERT INTO [dbo].[Motorcycle]\n"
                + "           ([MotorcycleID]\n"
                + "           ,[Model]\n"
                + "           ,[Image]\n"
                + "           ,[Displacement]\n"
                + "           ,[Description]\n"
                + "           ,[MinAge]\n"
                + "           ,[BrandID]\n"
                + "           ,[CategoryID]\n"
                + "           ,[PriceListID])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, motor.getMotorcycleId());
            ps.setString(2, motor.getModel());
            ps.setString(3, motor.getImage());
            ps.setString(4, motor.getDisplacement());
            ps.setString(5, motor.getDescription());
            ps.setInt(6, motor.getMinAge());
            ps.setInt(7, motor.getBrandID());
            ps.setInt(8, motor.getCategoryID());
            ps.setInt(9, motor.getPriceListID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateMotorcycle(Motorcycle motorbike) {
        PreparedStatement stm;
        try {
            String sql = "UPDATE [dbo].[Motorcycle]\n"
                    + "   SET [Model] = ?\n"
                    + "      ,[Image] = ?\n"
                    + "      ,[Displacement] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[MinAge] = ?\n"
                    + "      ,[BrandID] = ?\n"
                    + "      ,[CategoryID] = ?\n"
                    + "      ,[PriceListID] = ?\n"
                    + " WHERE [MotorcycleID] = ?";
            stm = conn.prepareStatement(sql);

            stm.setString(1, motorbike.getModel());
            stm.setString(2, motorbike.getImage());
            stm.setString(3, motorbike.getDisplacement());
            stm.setString(4, motorbike.getDescription());
            stm.setInt(5, motorbike.getMinAge());
            stm.setInt(6, motorbike.getBrandID());
            stm.setInt(7, motorbike.getCategoryID());
            stm.setInt(8, motorbike.getPriceListID());
            stm.setString(9, motorbike.getMotorcycleId());

            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Motorcycle updated successfully.");
            } else {
                System.out.println("No Motorcycle updated.");
            }
        } catch (Exception e) {
            System.out.println("Error updating Motorcycle: " + e.getMessage());
        }
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
    public List<Motorcycle> searchMotorcyclesByName(String key) {
        List<Motorcycle> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "Select * from [Motorcycle] WHERE Model LIKE ?\n"
                    + "ORDER BY MotorcycleID";

            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + key + "%");
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

    public List<Motorcycle> pagingListMotorcycles(List<Motorcycle> list, int start, int end) {
        List<Motorcycle> pagingList = new ArrayList();
        for (int i = start; i < end; i++) {
            pagingList.add(list.get(i));
        }
        return pagingList;
    }

    //Thanh lọc (giá, hãng, loại, phân khối, nhu cầu) 
    public List<Motorcycle> searchMotorcycleByCriteria(SearchCriteria criteria) {
        List<Motorcycle> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        StringBuilder sql = new StringBuilder("SELECT DISTINCT m.* FROM Motorcycle m JOIN Demand_Detail d ON m.MotorcycleID = d.MotorcycleID WHERE 1=1");

        if (criteria.getPriceRanges() != null && !criteria.getPriceRanges().isEmpty()) {
            sql.append(" AND PriceListID IN (SELECT PriceListID FROM PriceList WHERE ");
            for (int i = 0; i < criteria.getPriceRanges().size(); i++) {
                if (i > 0) {
                    sql.append(" OR ");
                }
                sql.append("DailyPriceForDay BETWEEN ? AND ?");
            }
            sql.append(")");
        }

        if (criteria.getBrandIDs() != null && !criteria.getBrandIDs().isEmpty()) {
            sql.append(" AND BrandID IN (")
                    .append(generateParameterPlaceholders(criteria.getBrandIDs().size()))
                    .append(")");
        }

        if (criteria.getCategoryIDs() != null && !criteria.getCategoryIDs().isEmpty()) {
            sql.append(" AND CategoryID IN (")
                    .append(generateParameterPlaceholders(criteria.getCategoryIDs().size()))
                    .append(")");
        }

        if (criteria.getDisplacements() != null && !criteria.getDisplacements().isEmpty()) {
            sql.append(" AND Displacement IN (")
                    .append(generateParameterPlaceholders(criteria.getDisplacements().size()))
                    .append(")");
        }

        if (criteria.getDemandIDs() != null && !criteria.getDemandIDs().isEmpty()) {
            sql.append(" AND d.DemandId IN (")
                    .append(generateParameterPlaceholders(criteria.getDemandIDs().size()))
                    .append(")");
        }

        sql.append("\nORDER BY MotorcycleID");

        try {
            stm = conn.prepareStatement(sql.toString());
            int parameterIndex = 1;

            if (criteria.getPriceRanges() != null) {
                for (PriceRange p : criteria.getPriceRanges()) {
                    stm.setDouble(parameterIndex++, p.getMinPrice());
                    stm.setDouble(parameterIndex++, p.getMaxPrice());
                }
            }

            if (criteria.getBrandIDs() != null) {
                for (int brandID : criteria.getBrandIDs()) {
                    stm.setInt(parameterIndex++, brandID);
                }
            }

            if (criteria.getCategoryIDs() != null) {
                for (int categoryID : criteria.getCategoryIDs()) {
                    stm.setInt(parameterIndex++, categoryID);
                }
            }

            if (criteria.getDisplacements() != null) {
                for (String displacement : criteria.getDisplacements()) {
                    stm.setString(parameterIndex++, displacement);
                }
            }

            if (criteria.getDemandIDs() != null) {
                for (int demandID : criteria.getDemandIDs()) {
                    stm.setInt(parameterIndex++, demandID);
                }
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
        for (Motorcycle x : dao.getAll()) {
            System.out.println(x);
        }
//        SearchCriteria searchCriteria = new SearchCriteria();
//        searchCriteria.addPriceRange(200, 230);
//        searchCriteria.addPriceRange(270, 230);
//        System.out.println(dao.getListDisplacements());
        //System.out.println(dao.searchMotorcycleByCriteria(searchCriteria));
//        System.out.println(dao.getListDisplacements());
    }
}
