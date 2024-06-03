/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Account;
import com.colorbike.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huypd
 */
public class AccountDAO implements Serializable {

    private static AccountDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private AccountDAO() {
    }

    public static AccountDAO getInstance() {

        if (instance == null) {
            instance = new AccountDAO();
        }
        return instance;
    }

    public Account checkLogin(String userName, String passWord) {

        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT * FROM Account WHERE Username = ? AND Password = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, passWord);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void createANewAccount(String firstName, String lastName, String gender, String dob, String address, String phone, String image, String email, String userName, String password) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([FirstName]\n"
                + "           ,[LastName]\n"
                + "           ,[Gender]\n"
                + "           ,[DayOfBirth]\n"
                + "           ,[Address]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[Image]\n"
                + "           ,[Email]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[RoleID])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, gender);
            ps.setString(4, dob);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.setString(7, image);
            ps.setString(8, email);
            ps.setString(9, userName);
            ps.setString(10, password);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account getAccountByEmail(String email) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT * FROM Account WHERE Email =  ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(12));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean createToken(String token, String email) {
        Timestamp expiration = new Timestamp(System.currentTimeMillis() + 1 * 60 * 1000); // 1 phút
        String checkEmailSql = "SELECT COUNT(*) FROM Account WHERE Email = ?";
        String insertTokenSql = "INSERT INTO Password_Reset_Tokens (user_email, token, expiration) "
                + "SELECT Email, ?, ? FROM Account WHERE Email = ?";
        try {
            // Kiểm tra xem email có tồn tại không
            PreparedStatement checkEmailStmt = conn.prepareStatement(checkEmailSql);
            checkEmailStmt.setString(1, email);
            ResultSet rs = checkEmailStmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            if (count == 0) {
                // Email không tồn tại
                return false;
            }

            // Email tồn tại, tiếp tục chèn token
            PreparedStatement insertTokenStmt = conn.prepareStatement(insertTokenSql);
            insertTokenStmt.setString(1, token);
            insertTokenStmt.setTimestamp(2, expiration);
            insertTokenStmt.setString(3, email);
            insertTokenStmt.executeUpdate();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public String getToken(String token) {
        ResultSet rs;
        String sql = "Select user_email from Password_Reset_Tokens where token = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, token);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void resetPassword(String email, String password) {
        String sql = "UPDATE Account SET Password = ? WHERE Email = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account getAccountbyID(int id) {
        String sql = " SELECT * FROM Account\n"
                + " WHERE AccountID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account acc = new Account();
                acc.setAccountId(rs.getInt(1));
                acc.setFirstName(rs.getString(2));
                acc.setLastName(rs.getString(3));
                acc.setGender(rs.getString(4));
                acc.setDob(rs.getString(5));
                acc.setAddress(rs.getString(6));
                acc.setPhoneNumber(rs.getString(7));
                acc.setImage(rs.getString(8));
                acc.setEmail(rs.getString(9));
                acc.setUserName(rs.getString(10));
                acc.setPassWord(rs.getString(11));
                acc.setRoleID(rs.getInt(12));
                return acc;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public boolean update(String firstName, String lastName, String gender, String dob, String address, String phoneNumber,
            String email, String username, int accountid) {
        String sql = "UPDATE Account SET FirstName = ?, LastName = ?, Gender = ?, DayofBirth = ?, Address = ?,"
                + "PhoneNumber = ?, Email = ?, Username = ? WHERE AccountID = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, firstName);
            st.setString(2, lastName);
            st.setString(3, gender);
            st.setString(4, dob);
            st.setString(5, address);
            st.setString(6, phoneNumber);
            st.setString(7, email);
            st.setString(8, username);
            st.setInt(9, accountid);

            int rowAffect = st.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean changePassword(int AccountID, String password) {
        String sql = "UPDATE Account SET password = ? WHERE AccountID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, getAccountbyID(AccountID).getAccountId());
            int rowAffect = st.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        AccountDAO dao = getInstance();
//        System.out.println(dao.getAccountByEmail("huy@gmail.com"));
//        dao.createANewAccount("huy", "huy", "male", "06/07/2003", "QN", "0123456789", "no", "huyyy@gmail.com", "nh", "123");

//        System.out.println(dao.update("Nguyen Minh", "Tunnnn", "Male", "2003-11-23 20:10:11.000", "21 Moc Son, Da Nang", "0941673660",
//                "minh.tun@gmail.com", "minh.tun@gmail.com", 17));
    }

}
