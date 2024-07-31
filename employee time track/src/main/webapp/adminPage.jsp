<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f2f2f2;
        }
        
        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            color: #337ab7;
            margin-top: 0;
        }
        
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        li {
            margin-bottom: 10px;
        }
        
        a {
            text-decoration: none;
            color: #337ab7;
        }
        
        a:hover {
            color: #23527c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Page</h2>
        <ul>
            <li><a href="viewAllTasks.jsp">View All Tasks</a></li>
            <li><a href="viewAllCharts.jsp">View All Charts</a></li>
        </ul>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>