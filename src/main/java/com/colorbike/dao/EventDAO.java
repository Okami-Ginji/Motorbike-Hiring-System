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
import java.util.logging.Level;
import java.util.logging.Logger;

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
                + "    FORMAT(createdDate, 'dd-MM-yyyy') AS createdDate,\n"
                + "    FORMAT(startDate, 'dd-MM-yyyy') AS startDate,\n"
                + "    FORMAT(endDate, 'dd-MM-yyyy') AS endDate,\n"
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
    
    public Event getEventbyID(int id) {
        String sql = "SELECT * FROM [Event] WHERE [EventID] = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Event touristLocation = new Event();
                touristLocation.setEventID(rs.getInt(1));
                touristLocation.setEventTitle(rs.getString(2));
                touristLocation.setCreatedDate(rs.getString(3));
                touristLocation.setStartDate(rs.getString(4));
                touristLocation.setEndDate(rs.getString(5));
                touristLocation.setContent(rs.getString(6));
                touristLocation.setEventImage(rs.getString(7));
                touristLocation.setDiscount(rs.getDouble(8));
                touristLocation.setStaffID(rs.getString(9));

                return touristLocation;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Event> searchEventByName(String textSearch) {
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

    public void addNewEvent(Event event) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "INSERT INTO [dbo].[Event] "
                    + "([EventTitle], [CreatedDate], [StartDate], [EndDate], [Content], [EventImage], [Discount], [StaffID]) "
                    + "VALUES (?, GETDATE(), ?, ?, ?, ?, ?, ?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, event.getEventTitle());
//            stm.setString(2, event.getCreatedDate());
            stm.setString(2, event.getStartDate());
            stm.setString(3, event.getEndDate());
            stm.setString(4, event.getContent());
            stm.setString(5, event.getEventImage());
            stm.setDouble(6, event.getDiscount());
            stm.setString(7, event.getStaffID());

            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Event inserted successfully.");
            } else {
                System.out.println("Failed to insert event.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close resources in finally block
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void deleteEvent(String id) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String sql = "DELETE FROM [dbo].[Event]\n"
                    + "WHERE [EventID] = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateEvent(Event event) {
        PreparedStatement stm;
        try {
            String sql = "UPDATE [dbo].[Event]\n"
                    + "    SET \n"
                    + "        [EventTitle] = ?,\n"
                    + "        [CreatedDate] = ?,\n"
                    + "        [StartDate] = ?,\n"
                    + "        [EndDate] = ?,\n"
                    + "        [Content] = ?,\n"
                    + "        [EventImage] = ?,\n"
                    + "        [Discount] = ?,\n"
                    + "        [StaffID] = ?\n"
                    + "    WHERE\n"
                    + "        [EventID] = ?;";
            stm = conn.prepareStatement(sql);
            stm.setInt(9, event.getEventID());
            stm.setString(1, event.getEventTitle());
            stm.setString(2, event.getCreatedDate());
            stm.setString(3, event.getStartDate());
            stm.setString(4, event.getEndDate());
            stm.setString(5, event.getContent());
            stm.setString(6, event.getEventImage());
            stm.setDouble(7, event.getDiscount());
            stm.setString(8, event.getStaffID());
            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Event updated successfully.");
            } else {
                System.out.println("No Event updated.");
            }
        } catch (Exception e) {
            System.out.println("Error updating Event: " + e.getMessage());
        }
    }
}
