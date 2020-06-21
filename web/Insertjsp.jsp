<%-- 
    Document   : Insertjjsp
    Created on : Feb 11, 2019, 4:48:21 PM
    Author     : Sumit
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
     Connection con;
	PreparedStatement pst;
	ResultSet rs;
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
            
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","sumit","1234");
        pst=con.prepareStatement("Insert into student values(?,?,?)");
        
                     int ro=Integer.parseInt(request.getParameter("roll"));
                         String use=request.getParameter("Name");
                         String pas=request.getParameter("address");
                         pst.setInt(1,ro);
                         pst.setString(2,use);
                         pst.setString(3,pas);
                           int r=pst.executeUpdate();
                      if(r>=1)
                      {      
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Insert Sucessfully</title>");            
            out.println("</head>");
            out.println("<body bgcolor=#945176>");
            out.println("<h1>Insert Sucessful</h1>");
            out.println("<a href=http://localhost:8084/StudentJSP/Insert.html>For more entry</a>");
            out.println("</body>");
            out.println("</html>");
                      }
            }catch (ClassNotFoundException | SQLException ex) {
            out.println("Error");
            ex.printStackTrace();
        }  %>
        <h1>Insert World!</h1>
    </body>
</html>
