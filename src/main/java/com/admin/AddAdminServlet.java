package com.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("a_name");
        String nic = request.getParameter("a_nic");
        String phone = request.getParameter("a_phone");
        String email = request.getParameter("a_email");
        String username = request.getParameter("a_username");
        String password = request.getParameter("a_password");

        // Add admin query
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO admin (a_name, a_nic, a_phone, a_email, a_username, a_password) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, nic);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setString(5, username);
            ps.setString(6, password);

            ps.executeUpdate();
            ps.close();
            conn.close();

            // Redirect to manage admin page after successful addition
            response.sendRedirect("manage_admin.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("add_admin.jsp"); // Redirect back to form in case of error
        }
    }
}
