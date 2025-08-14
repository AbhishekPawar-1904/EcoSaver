package com.ecosaver.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_connection.ConnectDB;

import java.sql.*;

/**
 * Servlet implementation class ProviderLoginServlet
 */
public class ProviderLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProviderLoginServlet() {
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
	        	String email = request.getParameter("email");
	        	String password = request.getParameter("password");
	            Connection con = ConnectDB.getConnect();
	            PreparedStatement ps = con.prepareStatement("SELECT * FROM provider WHERE email = ? AND password = ?");
	            ps.setString(1, email);
	            ps.setString(2, password);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                response.sendRedirect("provider_dashboard.html");
	            } else {
	                response.sendRedirect("provider_login.html");
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
}
