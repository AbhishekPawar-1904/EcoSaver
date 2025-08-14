package com.ecosaver.servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_connection.ConnectDB;

/**
 * Servlet implementation class InsertTipServlet
 */
public class InsertTipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTipServlet() {
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
        	String providerIdStr = request.getParameter("provider_id");
        	String tipText = request.getParameter("tipText");
        	String publishDate = request.getParameter("publishDate");
            int providerId = Integer.parseInt(providerIdStr);
            Connection con = ConnectDB.getConnect();

 
            String query = "INSERT INTO tips (provider_id, tipText, publishDate) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, providerId);
            ps.setString(2, tipText);
            ps.setString(3, publishDate);

            int rows = ps.executeUpdate();

            if (rows > 0) {
          
                response.sendRedirect("provider_dashboard.html");
            } else {
                response.getWriter().println("Tip not inserted. Try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
	}

}
