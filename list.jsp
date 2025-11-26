<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String url = "jdbc:mysql://localhost:3306/attendance_system?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    String dbUser = "root";
    String dbPass = "Yashika@12";

  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, dbUser, dbPass);

    stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT id, name, email, age FROM users ORDER BY id DESC");
%>

<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Users List</title></head>
<body>
  <h2>Users</h2>
  <table border="1" cellpadding="6" cellspacing="0">
    <tr><th>ID</th><th>Name</th><th>Email</th><th>Age</th><th>Options</th></tr>
    <%
      while (rs.next()) {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String email = rs.getString("email");
        int age = rs.getInt("age");
    %>
      <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= email %></td>
        <td><%= age %></td>
      <td>
          <a href="update.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
          <a href="delete.jsp?id=<%= rs.getInt("id") %>">Delete</a>
      </td>
      </tr>
    <%
      }
    %>
  </table>
  <p><a href="index.jsp">Add another user</a></p>
</body>
</html>

<%
  } catch (Exception e) {
%>
    <h3>Error: <%= e.getMessage() %></h3>
    <p><a href="index.jsp">Back to form</a></p>
<%
  } finally {
    try { if (rs != null) rs.close(); } catch(Exception ex) {}
    try { if (stmt != null) stmt.close(); } catch(Exception ex) {}
    try { if (conn != null) conn.close(); } catch(Exception ex) {}
  }
%>
