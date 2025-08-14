<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.ConnectDB" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EcoSaver - View Tips</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(180deg, rgba(26, 26, 46, 0.9) 0%, rgba(22, 33, 62, 0.9) 100%),
                        url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 900px;
        }

        .logo {
            font-size: 2.8em;
            font-weight: 800;
            color: #ffffff;
            text-align: center;
            margin-bottom: 20px;
            background: linear-gradient(90deg, #00ddeb, #00b4d8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .subtitle {
            text-align: center;
            font-size: 1.2em;
            color: #e0e0e0;
            margin-bottom: 30px;
            opacity: 0.85;
        }

        .tips-wrapper {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .tip-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 20px;
            color: #ffffff;
            box-shadow: 0 4px 16px rgba(0,0,0,0.2);
        }

        .tip-text {
            font-size: 1.05em;
            margin-bottom: 10px;
        }

        .tip-meta {
            font-size: 0.9em;
            color: #bbbbbb;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">EcoSaver</div>
        <div class="subtitle">Energy Saving Tips</div>

        <div class="tips-wrapper">
            <%
                try {
                    Connection con = ConnectDB.getConnect();
                    String query = "SELECT * FROM tips ORDER BY publishDate DESC";
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        int providerId = rs.getInt("provider_id");
                        String tipText = rs.getString("tipText");
                        String publishDate = rs.getString("publishDate");
            %>
                <div class="tip-card">
                    <div class="tip-text"><%= tipText %></div>
                    <div class="tip-meta">
                        Provided by: <strong>#<%= providerId %></strong> | Published on: <%= publishDate %>
                    </div>
                </div>
            <%
                    }

                } catch (Exception e) {
                    out.println("<p style='color: red;'>Error loading tips: " + e.getMessage() + "</p>");
                }
            %>
        </div>
    </div>
</body>
</html>
