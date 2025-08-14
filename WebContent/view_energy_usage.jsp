<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="database_connection.ConnectDB"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Energy Usage Details</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
	background: linear-gradient(180deg, rgba(26, 26, 46, 0.9) 0%,
		rgba(22, 33, 62, 0.9) 100%),
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
	align-items: center;
	justify-content: center;
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
	padding: 40px 20px;
	flex: 1;
}

h2 {
	text-align: center;
	font-size: 2em;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: rgba(255, 255, 255, 0.1);
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	padding: 12px 15px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
	text-align: center;
	color: #ffffff;
}

th {
	background-color: rgba(255, 255, 255, 0.2);
}

.footer {
	text-align: center;
	padding: 20px;
	color: #a0aec0;
	font-size: 0.9em;
	border-top: 1px solid rgba(255, 255, 255, 0.1);
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="logo">EcoSaver</div>
	</nav>

	<div class="container">
		<h2>Energy Usage Details</h2>
		<table>
			<thead>
				<tr>
					<th>User Name</th>
					<th>Provider ID</th>
					<th>Units Consumed (kWh)</th>
					<th>Log Date</th>
				</tr>
			</thead>
			<tbody>
				<%
					try {
						String userName = (String) session.getAttribute("user_name");

						if (userName != null) {
							Connection conn = ConnectDB.getConnect();
							PreparedStatement ps = conn.prepareStatement(
									"SELECT username, provider_id, unitConsumed, logDate FROM consumption_log WHERE username = ?");
							ps.setString(1, userName);
							ResultSet rs = ps.executeQuery();

							while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("username")%></td>
					<td><%=rs.getInt("provider_id")%></td>
					<td><%=rs.getDouble("unitConsumed")%></td>
					<td><%=rs.getDate("logDate")%></td>
				</tr>
				<%
					}
							// ✅ Keeping the same no-close logic as requested
						} else {
				%>
				<tr>
					<td colspan="4">User not logged in. Please <a
						href="user_login.html" style="color: #00ddeb;">log in</a>.
					</td>
				</tr>
				<%
					}
					} catch (Exception e) {
						e.printStackTrace();
				%>
				<tr>
					<td colspan="4">Error fetching data. Please try again later.</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	<div class="footer">EcoSaver - Accurate energy usage records</div>
</body>
</html>
