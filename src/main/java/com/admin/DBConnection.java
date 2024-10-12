package com.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBConnection {
    
    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/laundry_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "08040804";
    
    // Load the MySQL driver once when the class is loaded
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Updated to newer driver class
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to establish a database connection
    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    // Method to validate admin credentials using PreparedStatement (prevents SQL injection)
    public static List<Admin> validate(String username, String password) {
        List<Admin> adminList = new ArrayList<>();
        
        String sql = "SELECT * FROM admin WHERE a_username = ? AND a_password = ?";

        try (Connection con = getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    int a_id = resultSet.getInt("a_id");
                    String a_name = resultSet.getString("a_name");
                    String a_nic = resultSet.getString("a_nic");
                    String a_phone = resultSet.getString("a_phone");
                    String a_email = resultSet.getString("a_email");
                    String a_username = resultSet.getString("a_username");
                    String a_password = resultSet.getString("a_password");

                    Admin admin = new Admin(a_id, a_name, a_nic, a_phone, a_email, a_username, a_password);
                    adminList.add(admin);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return adminList;
    }
}
 	
        	
        	
        	