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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
                return new Account(rs.getInt("AccountID"), rs.getString("FirstName"), rs.getString("LastName"),
                        rs.getString("Gender"), rs.getString("DayOfBirth"), rs.getString("Address"), rs.getString("PhoneNumber"),
                        rs.getString("Image"), rs.getString("Email"), rs.getString("Username"), rs.getString("Password"), rs.getInt("RoleID"));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void createANewAccountForLoginGoogle(String email, String password) {
        String sql = "INSERT INTO Account(Email, Username, Password, RoleID)\n"
                + "VALUES (?, ?, ?, 1)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void createANewAccount(String firstName, String lastName, String gender, String phone, String email, String userName, String password) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([FirstName]\n"
                + "           ,[LastName]\n"
                + "           ,[Gender]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[Email]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[RoleID])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, 1)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, gender);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, userName);
            ps.setString(7, password);
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
                return new Account(rs.getInt("AccountID"), rs.getString("FirstName"), rs.getString("LastName"),
                        rs.getString("Gender"), rs.getString("DayOfBirth"), rs.getString("Address"), rs.getString("PhoneNumber"),
                        rs.getString("Image"), rs.getString("Email"), rs.getString("Username"), rs.getString("Password"), rs.getInt("RoleID"));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean createToken(String token, String email) {
        Timestamp expiration = new Timestamp(System.currentTimeMillis() + 1 * 60 * 1000); // 1 phút
        String checkEmailSql = "SELECT COUNT(*) FROM Account WHERE Email = ?";
        String insertTokenSql = "INSERT INTO PasswordResetToken (Email, Token, Expiration, AccountID) "
                + "SELECT Email, ?, ?, AccountID FROM Account WHERE Email = ?";
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

    public int getAccountIdByToken(String token) {
        ResultSet rs;
        String sql = "Select AccountID from PasswordResetToken where Token = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, token);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -9999;
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
            st.setInt(2, AccountID);
            int rowAffect = st.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
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

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();

        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "select * from Account";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt("AccountID"), rs.getString("FirstName"), rs.getString("LastName"),
                        rs.getString("Gender"), rs.getString("DayOfBirth"), rs.getString("Address"), rs.getString("PhoneNumber"),
                        rs.getString("Image"), rs.getString("Email"), rs.getString("Username"), rs.getString("Password"), rs.getInt("RoleID")));
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Account> getListAccountByRole(int role) {
        List<Account> listA = new ArrayList<>();
        String sql = "SELECT \n"
                + "    AccountID,\n"
                + "    FirstName,\n"
                + "    LastName,\n"
                + "    Gender,\n"
                + "    FORMAT(DayOfBirth, 'dd-MM-yyyy') AS DayOfBirth,\n"
                + "    Address,\n"
                + "    PhoneNumber,\n"
                + "    Image,\n"
                + "    Email,\n"
                + "    Username,\n"
                + "    Password,\n"
                + "    RoleID FROM Account WHERE [RoleID] = 1 or [RoleID] = 4";
        PreparedStatement st;
        ResultSet rs;
        try {
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                listA.add(new Account(
                        rs.getInt("AccountID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Gender"),
                        rs.getString("DayOfBirth"),
                        rs.getString("Address"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Image"),
                        rs.getString("Email"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        rs.getInt("RoleID")
                ));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listA;
    }

    public List<Account> getAllCustomerAccount() {
        List<Account> listA = new ArrayList<>();
        String sql = "SELECT \n"
                + "    AccountID,\n"
                + "    FirstName,\n"
                + "    LastName,\n"
                + "    Gender,\n"
                + "    FORMAT(DayOfBirth, 'dd-MM-yyyy') AS DayOfBirth,\n"
                + "    Address,\n"
                + "    PhoneNumber,\n"
                + "    Image,\n"
                + "    Email,\n"
                + "    Username,\n"
                + "    Password,\n"
                + "    RoleID FROM Account WHERE [RoleID] = 1 or [RoleID] = 4";
        PreparedStatement st;
        ResultSet rs;
        try {
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                listA.add(new Account(
                        rs.getInt("AccountID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Gender"),
                        rs.getString("DayOfBirth"),
                        rs.getString("Address"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Image"),
                        rs.getString("Email"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        rs.getInt("RoleID")
                ));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listA;
    }

    public Map<Integer, Integer> getBookingCountbyAccount() {
        Map<Integer, Integer> counts = new HashMap<>();
        PreparedStatement st;
        ResultSet rs;
        String sql = "SELECT a.AccountID, COUNT(b.BookingID) AS Quality\n"
                + "FROM Account a\n"
                + "LEFT JOIN Customer c ON c.AccountID = a.AccountID\n"
                + "LEFT JOIN Booking b ON b.CustomerID = c.CustomerID\n"
                + "GROUP BY a.AccountID;";
        try {
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int AccountID = rs.getInt("AccountID");
                int Quality = rs.getInt("Quality");
                counts.put(AccountID, Quality);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return counts;
    }

    public Map<Integer, Integer> updateRoleAndGetStatuses(int accountId, boolean isActive) {
        String sql = "UPDATE Account SET RoleID = ? WHERE AccountID = ?";
        int newRoleId = isActive ? 1 : 4;  // 1 for active, 4 for disable
        PreparedStatement st;
        ResultSet rs;

        try {
            st = conn.prepareStatement(sql);
            st.setInt(1, newRoleId);
            st.setInt(2, accountId);
            st.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }

        Map<Integer, Integer> roleStatuses = new HashMap<>();
        String query = "SELECT AccountID, RoleID FROM Account";
        try {
            st = conn.prepareStatement(query);
            rs = st.executeQuery();

            while (rs.next()) {
                int accId = rs.getInt("AccountID");
                int roleId = rs.getInt("RoleID");
                roleStatuses.put(accId, roleId);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return roleStatuses;
    }

    public List<Account> searchAccountsbyUserNameandName(String username, String name) {
        List<Account> list = new ArrayList<>();
        PreparedStatement st;
        ResultSet rs;

        try {
            StringBuilder sql = new StringBuilder("SELECT * FROM Account WHERE 1=1");
            if (!username.isEmpty() && !name.isEmpty()) {
                // Nếu cả hai điều kiện không rỗng, sử dụng OR
                sql.append(" AND (UserName LIKE ? OR CONCAT(FirstName, ' ', LastName) LIKE ?)");
            } else if (!username.isEmpty() || !name.isEmpty()) {
                // Nếu một trong hai điều kiện không rỗng, sử dụng AND
                if (!username.isEmpty()) {
                    sql.append(" AND UserName LIKE ?");
                } else if (!name.isEmpty()) {
                    sql.append(" AND CONCAT(FirstName, ' ', LastName) LIKE ?");
                }
            }
            sql.append(" AND (RoleID = 1 OR RoleID = 4)");

            st = conn.prepareStatement(sql.toString());
            int index = 1;

            if (!username.isEmpty() && !name.isEmpty()) {
                st.setString(index++, "%" + username + "%");
                st.setString(index++, "%" + name + "%");
            } else if (!username.isEmpty()) {
                st.setString(index++, "%" + username + "%");
            } else if (!name.isEmpty()) {
                st.setString(index++, "%" + name + "%");
            }

            rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Account(
                        rs.getInt("AccountID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Gender"),
                        rs.getString("DayOfBirth"),
                        rs.getString("Address"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Image"),
                        rs.getString("Email"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        rs.getInt("RoleID")
                ));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Account getAccountbyBookingID(String bookingId) {
        PreparedStatement st;
        ResultSet rs;
        String sql = "Select * from Account a\n"
                + "JOIN Customer c ON a.AccountID = c.AccountID\n"
                + "JOIN Booking b ON b.CustomerID = c.CustomerID\n"
                + "where b.BookingID = ?";
        try {
            st = conn.prepareStatement(sql);
            st.setString(1, bookingId);
            rs = st.executeQuery();
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

    public List<Account> getAccountbyCustomerID(int customerID) {
        List<Account> list = new ArrayList<>();

        PreparedStatement st;
        ResultSet rs;
        String sql = "Select * from Account\n"
                + "JOIN Customer on Account.AccountID = Customer.AccountID\n"
                + "Where CustomerID = ?";
        try {
            st = conn.prepareStatement(sql);
            st.setInt(1, customerID);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getInt("AccountID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Gender"),
                        rs.getString("DayOfBirth"),
                        rs.getString("Address"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Image"),
                        rs.getString("Email"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        rs.getInt("RoleID")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Account getAccountbyCustomerId(int customerID) {

        PreparedStatement st;
        ResultSet rs;
        String sql = "Select * from Account\n"
                + "JOIN Customer on Account.AccountID = Customer.AccountID\n"
                + "Where CustomerID = ?";
        try {
            st = conn.prepareStatement(sql);
            st.setInt(1, customerID);
            rs = st.executeQuery();
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
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateProfileImage(int AccountID, String filePath) {
        PreparedStatement st;
        ResultSet rs;
        String sql = "UPDATE Account SET Image = ? WHERE AccountID = ?";
        try {
            st = conn.prepareStatement(sql);
            st.setString(1, filePath);
            st.setInt(2, AccountID);
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkEmailExists(String email, String currentEmail) {
        PreparedStatement st;
        ResultSet rs;
        String sql = "SELECT COUNT(*) FROM Account WHERE email = ? AND email <> ?";
        try {
            st = conn.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, currentEmail);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkPhoneNumExists(String phoneNumber, String currentPhoneNumber) {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM Account WHERE phoneNumber = ? AND phoneNumber <> ?";
        try {
            st = conn.prepareStatement(sql);
            st.setString(1, phoneNumber);
            st.setString(2, currentPhoneNumber);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        AccountDAO dao = getInstance();
//        System.out.println(dao.changePassword(7, "asdf"));
        System.out.println(dao.checkLogin("huynhat132", "huynhat132"));
//        dao.createANewAccount("huy", "huy", "male", "06/07/2003", "QN", "0123456789", "no", "huyyy@gmail.com", "nh", "123");
        System.out.println(dao.getAllCustomerAccount());
//        System.out.println(dao.getBookingCountbyAccount());
//        Map<Integer, Integer> roleStatuses = dao.updateRoleAndGetStatuses(6, false);
//        System.out.println(roleStatuses);
//        System.out.println(dao.searchCustomersbyUserNameandName("myphan", "Trần"));
//        System.out.println(dao.getAccountbyBookingID("BOOK000001"));
//        System.out.println(dao.getAccountbyCustomerID(6));
//        System.out.println(dao.getBookingCountbyAccount());
//        for(Account x: dao.getListAccountByRole(1)){
//            System.out.println(x);
//        }
//        System.out.println(dao.updateProfileImage(2, "hahaAc1.jpg"));
        System.out.println(dao.getAccountbyCustomerId(4));
    }
}
