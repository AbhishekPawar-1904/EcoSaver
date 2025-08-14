<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - EcoSaver</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: 
                linear-gradient(180deg, rgba(26, 26, 46, 0.9) 0%, rgba(22, 33, 62, 0.9) 100%),
                url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            color: #ffffff;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .logo {
            font-size: 1.8em;
            font-weight: 800;
            background: linear-gradient(90deg, #00ddeb, #00b4d8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        form {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            padding: 30px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 1.8em;
            color: #ffffff;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #e0e0e0;
        }

        input {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            background: rgba(0, 0, 0, 0.1);
            color: #ffffff;
            font-size: 1em;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            background-color: #00b4d8;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #009ec2;
        }

        .error {
            color: #ff6b6b;
            text-align: center;
            margin-bottom: 20px;
        }

        .footer {
            text-align: center;
            padding: 20px;
            color: #a0aec0;
            font-size: 0.9em;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        @media (max-width: 600px) {
            form {
                padding: 20px;
            }

            h2 {
                font-size: 1.5em;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">EcoSaver</div>
        <div class="nav-links">
            <a href="user_dashboard.html">Dashboard</a>
            <a href="user_login.html">Logout</a>
        </div>
    </nav>

    <div class="container">
        <form action="UserChangePasswordServlet" method="post">
            <h2>Change Password</h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="error"><%= request.getAttribute("error") %></div>
            <% } %>

            <div class="form-group">
                <label for="oldPassword">Current Password</label>
                <input type="password" id="oldPassword" name="oldPassword" required>
            </div>

            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>

            <button type="submit">Change Password</button>
        </form>
    </div>

    <div class="footer">
        EcoSaver - Secure Password Change
    </div>
</body>
</html>