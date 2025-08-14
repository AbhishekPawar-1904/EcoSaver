package com.ecosaver.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_connection.ConnectDB;

public class DeleteProviderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String providerId = request.getParameter("provider_id");

            Connection con = ConnectDB.getConnect();
            PreparedStatement ps = con.prepareStatement("DELETE FROM provider WHERE provider_id = ?");
            ps.setString(1, providerId);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("manage_provider.jsp?success=Provider deleted successfully");
            } else {
                response.sendRedirect("manage_provider.jsp?error=Provider not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_provider.jsp?error=Error deleting provider: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}