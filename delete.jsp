<%@ page import="java.sql.*" %>
<%
    String idParam = request.getParameter("id");

    // Only proceed if ID is present
    if (idParam != null) {
        // DB Settings
        String url = "jdbc:mysql://localhost:3306/attendance_system?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String dbUser = "root";
        String dbPass = "Yashika@12";

        Connection conn = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPass);

            String sql = "DELETE FROM users WHERE id = ?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(idParam));

            pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) try { pst.close(); } catch(Exception e){}
            if (conn != null) try { conn.close(); } catch(Exception e){}
        }
    }

    // After deleting, automatically go back to the list page
    response.sendRedirect("list.jsp");
%>