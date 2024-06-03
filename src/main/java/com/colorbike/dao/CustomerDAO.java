/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dao;

import com.colorbike.util.DBUtil;
import java.sql.Connection;

/**
 *
 * @author huypd
 */
public class CustomerDAO {
    private static CustomerDAO instance;
    private Connection conn = DBUtil.makeConnection();

    // Cấm new trực tiếp DAO
    //Chỉ new DAO qua hàm static getInstance() để quản lí được số object/instance đã new - SINGLETON DESIGN PATTERN
    private CustomerDAO() {
    }

    public static CustomerDAO getInstance() {

        if (instance == null) {
            instance = new CustomerDAO();
        }
        return instance;
    }
}
