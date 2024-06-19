/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.dto.Event;
import com.colorbike.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author huypd
 */
public class EventDAO implements Serializable {

    private static EventDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private EventDAO() {
    }

    public static EventDAO getInstance() {

        if (instance == null) {
            instance = new EventDAO();
        }
        return instance;
    }

    public List<Event> getAllEvent() {
        List<Event> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "	EventID, EventTitle,\n"
                + "    FORMAT(createdDate, 'dd/MM/yyyy') AS createdDate,\n"
                + "    FORMAT(startDate, 'dd/MM/yyyy hh:mm tt') AS startDate,\n"
                + "    FORMAT(endDate, 'dd/MM/yyyy hh:mm tt') AS endDate,\n"
                + "	Content, EventImage, Discount, StaffID\n"
                + "FROM [event];";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int eventId = rs.getInt(1);
                String eventTitle = rs.getString(2);
                String createdDate = rs.getString(3);
                String startDate = rs.getString(4);
                String endDate = rs.getString(5);
                String content = rs.getString(6);
                String eventImg = rs.getString(7);
                double discount = rs.getDouble(8);
                String staffID = rs.getString(9);
                Event c = new Event(eventId, eventTitle, createdDate, startDate, endDate, content, eventImg, discount, staffID);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Event> searchCompanyByName(String textSearch) {
        List<Event> list = new ArrayList<>();
        String sql = "SELECT * FROM [Event]\n"
                + "WHERE [EventTitle] COLLATE Vietnamese_CI_AI "
                + "LIKE ?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + textSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int eventId = rs.getInt(1);
                String eventTitle = rs.getString(2);
                String createdDate = rs.getString(3);
                String startDate = rs.getString(4);
                String endDate = rs.getString(5);
                String content = rs.getString(6);
                String eventImg = rs.getString(7);
                double discount = rs.getDouble(8);
                String staffID = rs.getString(9);
                Event c = new Event(eventId, eventTitle, createdDate, startDate, endDate, content, eventImg, discount, staffID);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        for (Event e : EventDAO.getInstance().getAllEvent()) {
            System.out.println(e);
        }
//        for (Event e : EventDAO.getInstance().searchCompanyByName("Le")) {
//            System.out.println(e);
//        }
    }
}
