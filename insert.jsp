<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");

  String name  = request.getParameter("name");
  String email = request.getParameter("email");
  String ageParam = request.getParameter("age");

  int age = 0;
  if (ageParam != null && ageParam.trim().length() > 0) {
    try { age = Integer.parseInt(ageParam); } catch(Exception e) { age = 0; }
  }

  // DB settings 
  String url = "jdbc:mysql://localhost:3306/attendance_system?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
  String dbUser = "root";
  String dbPass = "Yashika@12";

  Connection conn = null;
  PreparedStatement pst = null;
  String msg = "";

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, dbUser, dbPass);

    String sql = "INSERT INTO users (name, email, age) VALUES (?, ?, ?)";
    pst = conn.prepareStatement(sql);
    pst.setString(1, name);
    pst.setString(2, email);
    pst.setInt(3, age);

    int cnt = pst.executeUpdate();
    if (cnt > 0) {
      msg = "User inserted successfully.";
    } else {
      msg = "Insert failed.";
    }
  } catch (Exception e) {
    msg = "Error: " + e.getMessage();
  } finally {
    try { if (pst != null) pst.close(); } catch(Exception ex) {}
    try { if (conn != null) conn.close(); } catch(Exception ex) {}
  }
%>

<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Insert Result</title></head>
<body>
  <h3><%= msg %></h3>
  <p><a href="index.jsp">Back to form</a></p>
  <p><a href="list.jsp">View all users</a></p>
</body>
</html>
