<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.admin.Admin" %>
<%@ include file="sideBarAd.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Admin</title>
    <link rel="stylesheet" href="manage_admin.css">
</head>

<body>
    <!-- Sidebar and other includes -->

    <div class="main-content">


        <h2 style="text-align: center; margin: 30px auto; font-size: 30px ;color:#ffffff;">Manage Admins</h2>

        <div class="container">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>NIC</th>
                    <th>Phone</th>
                    <th>Email</th>                    
                    <th>Action</th>
                </tr>

                <%
                    List<Admin> adminList = (List<Admin>) request.getAttribute("adminList");
                    if (adminList != null && !adminList.isEmpty()) {
                        for (Admin admin : adminList) {
                %>
                            <tr>
                                <td><%= admin.getA_id() %></td>
                                <td><%= admin.getA_name() %></td>
                                <td><%= admin.getA_nic() %></td>
                                <td><%= admin.getA_phone() %></td>
                                <td><%= admin.getA_email() %></td>                                
                                <td>
                                    <div style="display: flex; justify-content: center;">
                                        <form method="post" action="DeleteAdminServlet">
                                            <input type="hidden" name="a_id" value="<%= admin.getA_id() %>">
                                            <button type="submit" class="delete-button">Delete</button>
                                        </form>
                                        <form method="get" action="UpdateAdminServlet">
                                            <input type="hidden" name="a_id" value="<%= admin.getA_id() %>">
                                            <button type="submit" class="edit-button">Edit</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6" style="text-align: center;">No admins found.</td>
                    </tr>
                <%
                    }
                %>
                
            </table>

            
        </div>
    </div>

</body>

</html>
