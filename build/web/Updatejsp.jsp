<%-- 
    Document   : Updatejsp
    Created on : Feb 11, 2019, 5:15:33 PM
    Author     : Sumit
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

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
            try
            {
                       	  Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","sumit","1234");
        pst=con.prepareStatement("update student set name=? , address=? where roll=?");
        
                     String ro=request.getParameter("roll");
                         String use=request.getParameter("Name");
                         String pas=request.getParameter("address");
                         
                         pst.setString(1,use);
                         pst.setString(2,pas);
                         pst.setString(3,ro);
                           int r=pst.executeUpdate();
                      if(r>=1)
                      {      
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Update Sucessfully</title>");            
            out.println("</head>");
            out.println("<body bgcolor=#945176>");
            out.println("<h1>Update Sucessful</h1>");
            out.println("<a href=http://localhost:8084/StudentJSP/Search.html>For more entry</a>");
            out.println("</body>");
            out.println("</html>");
                      }
                      
        } catch (ClassNotFoundException | SQLException ex) {
                ex.printStackTrace();
        }  
 
            
            %>
            
        <h1>Hello World!</h1>
    </body>
</html>
