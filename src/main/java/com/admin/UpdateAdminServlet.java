package com.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UpdateAdminServlet")
public class UpdateAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles GET requests to load the admin data into the form for editing
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("a_id"));

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM admin WHERE a_id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Admin admin = new Admin(
                    rs.getInt("a_id"),
                    rs.getString("a_name"),
                    rs.getString("a_nic"),
                    rs.getString("a_phone"),
                    rs.getString("a_email"),
                    rs.getString("a_username"),
                    rs.getString("a_password")
                );
                request.setAttribute("admin", admin);
            }

            rs.close();
            ps.close();
            conn.close();

            // Forward to the update_admin.jsp page to display the admin's current data
            request.getRequestDispatcher("update_admin.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_admin.jsp");  // Redirect if there is an error
        }
    }

    // Handles POST requests to update the admin in the database
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("a_id"));
        String name = request.getParameter("a_name");
        String nic = request.getParameter("a_nic");
        String phone = request.getParameter("a_phone");
        String email = request.getParameter("a_email");
        String username = request.getParameter("a_username");
        String password = request.getParameter("a_password");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE admin SET a_name = ?,  a_nic = ?, a_phone = ?,a_email = ?, a_username = ?, a_password = ? WHERE a_id = ?");
            ps.setString(1, name);
            ps.setString(2, nic);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setString(5, username);
            ps.setString(6, password);
            ps.setInt(7, id);

            ps.executeUpdate();

            ps.close();
            conn.close();

            // After updating, redirect back to the manage admin page
            response.sendRedirect("ManageAdminServlet");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("update_admin.jsp?a_id=" + id);  // Redirect back in case of error
        }
    }
}
