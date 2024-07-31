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
    <title>Daily Tasks/Hours Pie Chart</title>
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
        <h2>Daily Tasks/Hours Pie Chart for <%= username %></h2>
        <canvas id="dailyChart" width="400" height="400"></canvas>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
    <script>
        fetch('DailyChartServlet')
        .then(response => response.json())
        .then(data => {
            console.log('Data received:', data);
            const labels = Object.keys(data);
            const values = Object.values(data);
            if (labels.length === 0 || values.length === 0) {
                console.warn('No data available for the chart.');
                return;
            }
            const ctx = document.getElementById('dailyChart').getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Tasks/Hours',
                        data: values,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                }
            });
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
    </script>
</body>
</html>
