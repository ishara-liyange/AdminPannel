package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ManageAdminServlet")
public class ManageAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = DBConnection.getConnection();
        
        try {
            // Admin list query
            String adminQuery = "SELECT * FROM admin";
            PreparedStatement ps3 = conn.prepareStatement(adminQuery);
            ResultSet rs3 = ps3.executeQuery();

            // Convert ResultSet to List<Admin>
            List<Admin> adminList = new ArrayList<>();
            while (rs3.next()) {
                int a_id = rs3.getInt("a_id");
                String a_name = rs3.getString("a_name");
                String a_nic = rs3.getString("a_nic");
                String a_phone = rs3.getString("a_phone");
                String a_email = rs3.getString("a_email");
                String a_username = rs3.getString("a_username");
                String a_password = rs3.getString("a_password");

                Admin admin = new Admin(a_id, a_name, a_nic, a_phone, a_email, a_username, a_password);
                adminList.add(admin);
            }

            // Set the adminList as a request attribute
            request.setAttribute("adminList", adminList);

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("manage_admin.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
