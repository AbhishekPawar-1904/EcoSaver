package com.ecosaver.servlets;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_connection.ConnectDB;

import java.sql.*;
/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			Connection con = ConnectDB.getConnect();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
			
				response.sendRedirect("admin_dashboard.html");
			} else {
		
				response.sendRedirect("admin_login.html");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("admin_login.html");
		}
		
	}

}
