package com.ecosaver.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_connection.ConnectDB;

/**
 * Servlet implementation class UserLoginServlet
 */
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;

			con = ConnectDB.getConnect();

			String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if (rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("user_name", username);

				response.sendRedirect("user_dashboard.html");
			} else {
				response.sendRedirect("user_login.html");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}