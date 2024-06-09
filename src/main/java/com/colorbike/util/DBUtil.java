/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBUtil {

    public static Connection makeConnection() {
        Connection conn = null;
        try {
     //       String dbURL = "jdbc:sqlserver://DESKTOP-JGD1LSU\\SQLEXPRESS;databaseName=ColorBike;encrypt=true;trustServerCertificate=true;";
//            String dbURL = "jdbc:sqlserver://DESKTOP-KHNR5UF\\SQLEXPRESS;databaseName=ColorBike;encrypt=true;trustServerCertificate=true;";
            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=ColorBikeWebsite;encrypt=false;trustServerCertificate=false;loginTimeout=30;";
            String user = "sa";
<<<<<<< HEAD
<<<<<<< HEAD
            String pass = "123123";
=======
            String pass = "123123qwe";
>>>>>>> 053042c54a2e42c6d0dcdd42783514868dc0b722
=======
            String pass = "123123";
>>>>>>> 44b5f94da651db2b9709adaebb50460e8c04453a
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(dbURL, user, pass);
            //System.out.println("Connect to DB successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }

    public static void closeConnection(Connection conn) {

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void main(String[] args) throws SQLException {

        System.out.println("This is to test if we can connect to SQLServer");
        Connection conn = makeConnection();
        DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();
        System.out.println("Driver name: " + dm.getDriverName());
        System.out.println("Driver version: " + dm.getDriverVersion());
        closeConnection(conn);
    }
}
