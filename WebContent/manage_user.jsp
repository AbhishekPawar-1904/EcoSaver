<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.ConnectDB" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background:
                linear-gradient(180deg, rgba(26, 26, 46, 0.9) 0%, rgba(22, 33, 62, 0.9) 100%),
                url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            color: #ffffff;
            padding: 30px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
        }
        .back-btn {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            margin-bottom: 20px;
        }
        .table-container {
            max-width: 1000px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.06);
            border-radius: 16px;
            padding: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
        }
        table {
            width: 100%;
            margin-top: 10px;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.03);
        }
        th, td {
            padding: 14px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
        }
        th {
            background: rgba(0, 221, 235, 0.2);
            color: #fff;
        }
        td {
            color: #e0e0e0;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9em;
            color: #a0aec0;
        }
    </style>
</head>
<body>

<h1>Manage Registered Users</h1>

<div class="table-container">
    <a href="admin_dashboard.html" class="back-btn">← Back to Dashboard</a>

    <table>
        <tr>
       
            <th>Name</th>
            <th>Address</th>
            <th>Contact</th>
            <th>Email</th>
        </tr>

        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                con = ConnectDB.getConnect();
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM user");

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("user_name") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("contact") %></td>
            <td><%= rs.getString("username") %></td>
        </tr>
        <%
            }
        } catch(Exception e) {
            out.println("Error: " + e);
        }
        %>
    </table>
</div>

<div class="footer">
    EcoSaver Admin Panel - Secure User Management
</div>

</body>
</html>-