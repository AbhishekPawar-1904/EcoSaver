<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.ConnectDB" %>
<!DOCTYPE html>
<html>
<head>
    <title>EcoSaver - Manage Providers</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Inter', sans-serif;
            background:
                linear-gradient(180deg, rgba(26,26,46,0.9) 0%, rgba(22,33,62,0.9) 100%),
                url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding: 30px;
            min-height: 100vh;
        }
        .container {
            max-width: 1100px;
            margin: auto;
            padding: 30px;
            background: rgba(255,255,255,0.05);
            border-radius: 16px;
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,0.1);
            box-shadow: 0 8px 32px rgba(0,0,0,0.2);
        }
        h1 {
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 30px;
            background: linear-gradient(90deg, #00ddeb, #00b4d8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .add-provider {
            display: inline-block;
            background: linear-gradient(135deg, #45b7d1, #96c93d);
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s ease;
        }
        .add-provider:hover {
            background: linear-gradient(135deg, #5ec3e0, #a8d04f);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: rgba(255,255,255,0.08);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            color: #e0e0e0;
            text-align: center;
        }
        th {
            background: rgba(0,0,0,0.3);
        }
        a.action-btn {
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            color: white;
            transition: 0.3s;
        }
        .delete-btn {
            background: #dc3545;
        }
        .delete-btn:hover {
            background: #c82333;
        }
        .footer {
            text-align: center;
            color: #aaa;
            margin-top: 30px;
            font-size: 0.9em;
        }
    </style>
</head>

<body>
<div class="container">
    <h1>Utility Providers Management</h1>

    <a href="provider_register_mp.html" class="add-provider">+ Add New Provider</a>

    <table>
        <tr>
            <th>Provider ID</th>
            <th>Name</th>
            <th>Zone</th>
            <th>Contact</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>

        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                con = ConnectDB.getConnect();
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM provider");

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("provider_id") %></td>
            <td><%= rs.getString("provider_name") %></td>
            <td><%= rs.getString("zone") %></td>
            <td><%= rs.getString("contact") %></td>
            <td><%= rs.getString("email") %></td>
            <td>
                <a href="DeleteProviderServlet?provider_id=<%= rs.getString("provider_id") %>" class="action-btn delete-btn">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e + "</td></tr>");
            } 
        %>
    </table>

    <div class="footer">© 2025 EcoSaver Management System</div>
</div>
</body>
</html>
