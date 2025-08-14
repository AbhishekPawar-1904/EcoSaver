package com.ecosaver.servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import database_connection.ConnectDB;

public class UserChangePasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // Added to remove warning

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("user_login.html");
            return;
        }

        String username = (String) session.getAttribute("userEmail"); 
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New password and confirm password do not match.");
            request.getRequestDispatcher("user_change_password.jsp").forward(request, response);
            return;
        }

        try (Connection conn = ConnectDB.getConnect()) {
            System.out.println("DEBUG: username=" + username + ", oldPassword=" + oldPassword);

            PreparedStatement checkStmt = conn.prepareStatement(
                    "SELECT * FROM `user` WHERE username = ? AND password = ?");
            checkStmt.setString(1, username);
            checkStmt.setString(2, oldPassword);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                PreparedStatement updateStmt = conn.prepareStatement(
                        "UPDATE `user` SET password = ? WHERE username = ?");
                updateStmt.setString(1, newPassword);
                updateStmt.setString(2, username);
                updateStmt.executeUpdate();

                response.sendRedirect("user_dashboard.html");
            } else {
                request.setAttribute("error", "Current password is incorrect.");
                request.getRequestDispatcher("user_change_password.jsp").forward(request, response);
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
