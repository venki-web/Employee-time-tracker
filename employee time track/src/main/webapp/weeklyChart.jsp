<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Weekly Tasks/Hours Bar Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #c8d3e3;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        canvas {
            display: block;
            margin: 0 auto;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #1a73e8;
            text-decoration: none;
            font-size: 16px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Weekly Tasks/Hours Bar Chart for <%= username %></h2>
        <canvas id="weeklyChart" width="400" height="400"></canvas>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
    <script>
        fetch('WeeklyChartServlet')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('weeklyChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.labels,
                    datasets: [{
                        label: 'Tasks/Hours',
                        data: data.data,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
    </script>
</body>
</html>
