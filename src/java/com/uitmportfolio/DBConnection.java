package com.uitmportfolio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    private static final String URL = "jdbc:derby://localhost:1527/student_profiles";
    private static final String USER = "app";
    private static final String PASSWORD = "app";
    
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}