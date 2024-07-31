<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    } else if (!"Associate".equals(session.getAttribute("role"))) {
        response.sendRedirect("dashboard.jsp");
        return; // Redirect to dashboard if the user is not an associate
    }
-->
<!DOCTYPE html>
<html>
<head>
    <title>Associate Page</title>
    <style>
        /* Add some basic styling to the page */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        
        .container {
            max-width: 400px;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            color: #00698f;
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
        <h2>Associate Page</h2>
        <ul>
            <li><a href="viewMyCharts.jsp">View My Charts</a></li>
        </ul>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>