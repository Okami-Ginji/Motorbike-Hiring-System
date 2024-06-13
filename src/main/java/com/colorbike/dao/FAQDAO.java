package com.colorbike.dao;

import com.colorbike.dto.FAQ;
import com.colorbike.util.DBUtil;
import com.oracle.wls.shaded.org.apache.xml.dtm.DTM;
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
public class FAQDAO implements Serializable, DAO<FAQDAO> {

    private static FAQDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private FAQDAO() {
    }

    public static FAQDAO getInstance() {

        if (instance == null) {
            instance = new FAQDAO();
        }
        return instance;
    }

    public List<FAQ> getAllFAQ() {
        List<FAQ> list = new ArrayList<>();
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "select * from FAQ;";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new FAQ(rs.getInt("questionID"), rs.getString("question"), rs.getString("answer")));
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addNewFAQs(FAQ faq) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "INSERT INTO FAQ (Question, Answer)\n"
                    + "VALUES(?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, faq.getQuestion());
            stm.setString(2, faq.getAnswer());
            rs = stm.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteFAQs(String id) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "Delete from FAQ where QuestionID= ?;";
            stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    @Override
    public List<FAQDAO> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(FAQDAO t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(FAQDAO t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(FAQDAO t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
//        FAQ newFAQ = new FAQ();
//        newFAQ.setQuestion("What is Java?");
//        newFAQ.setAnswer("Java is a programming language.");

        // Tạo đối tượng DAO và gọi phương thức addNewFAQs
        FAQDAO faqDAO = new FAQDAO();
//        faqDAO.addNewFAQs(newFAQ);
        System.out.println(faqDAO.getAllFAQ());
    }
}
