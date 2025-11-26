<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>User Form</title></head>
<body>
  <h2>Enter user details</h2>
  <form action="insert.jsp" method="post">
    <label>Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <label>Age:</label><br>
    <input type="number" name="age" min="0"><br><br>

    <input type="submit" value="Submit">
  </form>

  <p><a href="list.jsp">View all users</a></p>
</body>
</html>
