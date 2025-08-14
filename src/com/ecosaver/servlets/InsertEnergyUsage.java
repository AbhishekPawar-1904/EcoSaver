package com.ecosaver.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_connection.ConnectDB;

public class InsertEnergyUsage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertEnergyUsage() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String userName = request.getParameter("user_name"); 
			int providerId = Integer.parseInt(request.getParameter("provider_id"));
			double unitsConsumed = Double.parseDouble(request.getParameter("unitConsumed"));
			String logDate = request.getParameter("logDate");

			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO consumption_log (username, provider_id, unitConsumed, logDate) VALUES (?, ?, ?, ?)");

			ps.setString(1, userName); // Set as string
			ps.setInt(2, providerId);
			ps.setDouble(3, unitsConsumed);
			ps.setString(4, logDate);

			int rs = ps.executeUpdate();

			if (rs > 0) {
				response.sendRedirect("provider_dashboard.html");
			} else {
				response.sendRedirect("provider_dashboard.html"); 
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
