<%-- 
    Document   : loginjsp
    Created on : Feb 11, 2019, 4:34:09 PM
    Author     : Sumit
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! Connection con;
	PreparedStatement pst;
	ResultSet rs;
%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    
        <h1>Login in process</h1>
        <%  
            
            try{
			  Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","sumit","1234");
       
	pst=con.prepareStatement("Select * from userdetail where username=? and password=?");
      
            }catch(ClassNotFoundException | SQLException e)
		{
			response.sendRedirect("http://localhost:8084/StudentJSP/LoginPage.html");
		}
            String u= request.getParameter("user");
            String p= request.getParameter("pass");
            pst.setString(1,u);
            pst.setString(2,p);
            rs=pst.executeQuery();
            if(rs.next())
                response.sendRedirect("http://localhost:8084/StudentJSP/HomePage.html");
            else
               // response.sendRedirect("http://localhost:8084/StudentJSP/LoginPage.html");
           
%>
    

