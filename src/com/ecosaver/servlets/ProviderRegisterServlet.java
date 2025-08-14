package com.ecosaver.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_connection.ConnectDB;

/**
 * Servlet implementation class ProviderRegisterServlet
 */
public class ProviderRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProviderRegisterServlet() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		

        try {
        	String providerId = request.getParameter("provider_id");
        	String providerName = request.getParameter("provider_name");
        	String zone = request.getParameter("zone");
        	String contact = request.getParameter("contact");
        	String email = request.getParameter("email");
        	String password = request.getParameter("password");
        	
        	Connection con = null;
        	PreparedStatement ps = null;
        	
            con = ConnectDB.getConnect();
            String query = "INSERT INTO provider (provider_id, provider_name, zone, contact, email, password) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, providerId);
            ps.setString(2, providerName);
            ps.setString(3, zone);
            ps.setString(4, contact);
            ps.setString(5, email);
            ps.setString(6, password);

            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("provider_login.html");
            } else {
                response.getWriter().println("<h3>Registration failed. Please try again.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

	}

}
