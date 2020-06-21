<%-- 
    Document   : DELETEjsp
    Created on : Feb 11, 2019, 5:32:58 PM
    Author     : Sumit
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%!
        Connection con;
    PreparedStatement pst;
    ResultSet rs;
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","sumit","1234");
        pst=con.prepareStatement("Delete from student where roll=?");
               int r=Integer.parseInt(request.getParameter("roll"));
              pst.setInt(1,r);
              rs=pst.executeQuery();
              if(rs.next())
                        {
        
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Delete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Delete at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
                        }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
         ex.printStackTrace();
        }
            
        %>
            
            
        <h1>Hello World!</h1>
    </body>
</html>
