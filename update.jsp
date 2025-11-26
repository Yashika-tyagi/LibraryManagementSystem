<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    // DB Settings
    String url = "jdbc:mysql://localhost:3306/attendance_system?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    String dbUser = "root";
    String dbPass = "Yashika@12";

    String msg = "";
    String id = request.getParameter("id"); // Get ID from URL or Form

    // Variables to hold user data
    String name = "";
    String email = "";
    String age = "";

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // --- JOB 1: CHECK IF FORM WAS SUBMITTED (UPDATE DATA) ---
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String newName = request.getParameter("name");
            String newEmail = request.getParameter("email");
            String newAge = request.getParameter("age");

            String updateSql = "UPDATE users SET name=?, email=?, age=? WHERE id=?";
            pst = conn.prepareStatement(updateSql);
            pst.setString(1, newName);
            pst.setString(2, newEmail);
            pst.setInt(3, Integer.parseInt(newAge));
            pst.setInt(4, Integer.parseInt(id));

            int row = pst.executeUpdate();
            if(row > 0) {
                response.sendRedirect("list.jsp"); // Success: Go to list
                return; // Stop execution here
            } else {
                msg = "Update failed.";
            }
        }

        // --- JOB 2: FETCH EXISTING DATA TO FILL FORM ---
        // We only do this if we haven't redirected yet
        String selectSql = "SELECT * FROM users WHERE id=?";
        pst = conn.prepareStatement(selectSql);
        pst.setInt(1, Integer.parseInt(id));
        rs = pst.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            age = String.valueOf(rs.getInt("age"));
        }

    } catch (Exception e) {
        msg = "Error: " + e.getMessage();
    } finally {
        if (rs != null) try { rs.close(); } catch(Exception e){}
        if (pst != null) try { pst.close(); } catch(Exception e){}
        if (conn != null) try { conn.close(); } catch(Exception e){}
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
</head>
<body>
<h2>Update User Details</h2>
<p style="color:red"><%= msg %></p>

<form action="update.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    Name: <input type="text" name="name" value="<%= name %>"><br><br>
    Email: <input type="email" name="email" value="<%= email %>"><br><br>
    Age: <input type="number" name="age" value="<%= age %>"><br><br>

    <input type="submit" value="Update User">
</form>

<br>
<a href="list.jsp">Cancel</a>
</body>
</html>