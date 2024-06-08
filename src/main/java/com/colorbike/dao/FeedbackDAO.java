/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Account;
import com.colorbike.dto.Customer;
import com.colorbike.dto.Feedback;
import com.colorbike.dto.Motorcycle;
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
public class FeedbackDAO implements Serializable {

    private static FeedbackDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private FeedbackDAO() {

    }

    public static FeedbackDAO getInstance() {
        if (instance == null) {
            instance = new FeedbackDAO();
        }
        return instance;
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();

        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "SELECT f.feedbackID, f.content, f.rate, a.FirstName + ' ' + a.LastName AS CustomerName\n"
                    + "                     FROM Feedback f \n"
                    + "                     JOIN Customer c ON f.customerID = c.customerID\n"
                    + "                     JOIN  Account a ON C.AccountID = a.AccountID;";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {  
                list.add(new Feedback(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }


    public static void main(String[] args) {
        FeedbackDAO fd = FeedbackDAO.getInstance();
        System.out.println(fd.getAllFeedback());
    }
}
