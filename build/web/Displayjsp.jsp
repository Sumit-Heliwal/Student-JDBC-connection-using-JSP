<%-- 
    Document   : Displayjsp
    Created on : Feb 11, 2019, 5:37:01 PM
    Author     : Sumit
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%!
            Connection con;
	PreparedStatement pst;
	ResultSet rs;
        %>
            
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                 Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","sumit","1234");
        
            pst=con.prepareStatement("select * from student",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
             rs=pst.executeQuery();
             ResultSetMetaData rsmd=rs.getMetaData();
             out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DisplayServ</title>");            
            out.println("</head>");
            out.println("<body bgcolor='#dadaff'>");
            out.println("<marquee><table border=5px cellspacing=15px cellpadding=10px>");
            
             int cols=rsmd.getColumnCount();
            out.println("<tr>");
             String colname[]=new String[cols];
             for(int i=1;i<=cols;i++){
                 
                 out.println("<td>"+rsmd.getColumnName(i)+"</td>");
             }
             out.println("</tr>");
             while(rs.next()){
                 out.println("<tr>");
                 for(int i=1;i<=cols;i++)
                 {
                     out.println("<td>"+rs.getString(i)+"</td>");
                 }
                 out.println("</tr>");
                 
             }
             
            out.println("</table></marquee><br><br>");
            out.println("<marquee><h2><a href=http://localhost:8084/StudentJSP/HomePage.html>Back to home</a></h2></marquee>");
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        
            }
        %>
        <h1>Hello World!</h1>
    </body>
</html>
