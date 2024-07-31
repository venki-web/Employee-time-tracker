<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //HttpSession session = request.getSession(false);
    ResultSet task = (ResultSet) request.getAttribute("task");
    if (task != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #bfbfbf;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"], input[type="date"], input[type="time"], textarea {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
        }
        textarea {
            resize: vertical;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #1a73e8;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #1558b0;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #1a73e8;
            text-decoration: none;
            font-size: 16px;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Task</h2>
        <form action="EditTaskServlet" method="post">
            <input type="hidden" name="taskId" value="<%= task.getInt("task_id") %>">
            <label for="project">Project:</label>
            <input type="text" id="project" name="project" value="<%= task.getString("project") %>"><br><br>
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%= task.getDate("date") %>"><br><br>
            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" value="<%= task.getTime("start_time") %>"><br><br>
            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" value="<%= task.getTime("end_time") %>"><br><br>
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="<%= task.getString("category") %>"><br><br>
            <label for="description">Description:</label>
            <textarea id="description" name="description"><%= task.getString("description") %></textarea><br><br>
            <input type="submit" value="Update Task">
        </form>
        <a href="taskPage.jsp" class="back-link">Back to Task Management</a>
    </div>
</body>
</html>
<%
    }
%>
