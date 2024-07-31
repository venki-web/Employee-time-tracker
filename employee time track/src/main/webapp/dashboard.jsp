<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        a {
            color: #1a73e8;
            text-decoration: none;
            margin: 5px 0;
            display: inline-block;
        }
        a:hover {
            text-decoration: underline;
        }
        .logout {
            margin-top: 20px;
            display: inline-block;
            background-color: #d9534f;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
        }
        .logout:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= session.getAttribute("username") %></h2>
        <%
            if ("Admin".equals(role)) {
        %>
        <a href="adminPage.jsp">Admin Page</a><br>
        <%
            } else {
        %>
        <a href="taskPage.jsp">Task Management</a><br>
        <a href="associaterPage.jsp">View Associater</a><br>
        <%
            }
        %>
        <a href="LogoutServlet" class="logout">Logout</a>
    </div>
</body>
</html>
<%
    }
%>
