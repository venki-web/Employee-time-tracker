<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View All Charts</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(90deg, #f0f4f8, #d9e2ec);
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        li {
            margin: 15px 0;
        }
        a {
            display: inline-block;
            padding: 12px 25px;
            color: #ffffff;
            text-decoration: none;
            font-size: 18px;
            background-color: #3498db;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }
        a:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
        
    </style>
</head>
<body>
    <div class="container">
        <h2>Charts Overview</h2>
        <ul>
            <li><a href="AllDailyChart.jsp">View Daily Chart</a></li>
            <li><a href="AllWeeklyChart.jsp">View Weekly Chart</a></li>
            <li><a href="AllMonthlyChart.jsp">View Monthly Chart</a></li>
        </ul>
        <a href="dashboard.jsp" class="back-link" style="background-color:#f53731">Back to Dashboard</a>
    </div>
</body>
</html>
