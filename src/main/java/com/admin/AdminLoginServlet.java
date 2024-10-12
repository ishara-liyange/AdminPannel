package com.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            // Validate credentials using the DBConnection class
            List<Admin> adminList = DBConnection.validate(username, password);
            
            if (!adminList.isEmpty()) {
                // Successful login, redirect to manage admin page
                response.sendRedirect("ManageAdminServlet");
            } else {
                // Login failed, redirect to login page with an error message
                request.setAttribute("errorMessage", "Invalid username or password.");
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp"); // Update to your actual login page
                dis.forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to login page with a generic error message
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        }
    }
}
