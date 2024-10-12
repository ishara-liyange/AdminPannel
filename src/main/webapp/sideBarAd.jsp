<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.admin.DBConnection" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Side bar</title>
    <link rel="stylesheet" href="sideBarAd.css">
    
</head>

<body>
    <nav class="nav">
        <ul>
            <li class="nav-option option1"><a href="ManageAdminServlet">Manage Admin</a></li>
            <li class="nav-option option1"><a href="add_admin.jsp">Add Admin</a></li>
            <li class="nav-option option1"><a href="">Generate Reports</a></li>
            <li class="nav-option option1"><a href="">Blog</a></li>
            <li class="nav-option option1"><a href="">Home</a></li>
            <!-- Add a navigation option to show the date and time -->
            <li class="nav-option option1">
                <a   id="dateTime"> <!-- This will display the current date and time -->
            </a></li>
        </ul>
    </nav>

    <script>
        function updateDateTime() {
            const now = new Date();
            const formattedDateTime = now.toLocaleDateString() + ' ' + now.toLocaleTimeString();
            document.getElementById('dateTime').textContent = formattedDateTime;
        }

        // Update the date and time every second
        setInterval(updateDateTime, 1000);

        // Initialize the date and time on page load
        updateDateTime();
    </script>
</body>

</html>
