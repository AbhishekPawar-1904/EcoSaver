package com.ecosaver.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_connection.ConnectDB;

public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String userName = request.getParameter("name");
			String address = request.getParameter("address");
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("INSERT INTO user (user_name, address, contact, username, password) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, userName);
			ps.setString(2, address);
			ps.setString(3, contact);
			ps.setString(4, email);
			ps.setString(5, password);
			int rows = ps.executeUpdate();
			if (rows > 0) {
				response.sendRedirect("user_login.html");
			} else {
				response.sendRedirect("user_register.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("user_register.html");
		}
	}
}
