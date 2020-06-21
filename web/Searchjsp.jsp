<%-- 
    Document   : Searchjsp
    Created on : Feb 11, 2019, 5:11:05 PM
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
            try
            {
              Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","sumit","1234");
        pst=con.prepareStatement("Select * from student where roll=?");
        
      
                              int r=Integer.parseInt(request.getParameter("roll"));
                             pst.setInt(1,r);
                         
                           rs=pst.executeQuery();
                        if(rs.next())
                        {
                            int r0= rs.getInt(1);
                             String n=rs.getString(2);
                             String ad=rs.getString(3);
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Search</title>");            
            out.println("</head>");
           
                       out.println("<body bgcolor='#aa22ff'>");
        out.println("<form name='update' action='http://localhost:8084/StudentJSP/Updatejsp.jsp'>");
        out.println("<table align='center' cellpadding='10px'>");
            out.println("<tr><td>Roll</td><td><input type='text' name='roll' value="+r0+" ></td></tr>");
            out.println("<tr><td>Name</td><td><input type='text' name='Name' value="+n+"></td></tr>");
            out.println("<tr><td>Address</td><td><input type='text' name='address' value="+ad+"></td></tr>");
            out.println("<tr><td colspan='2' align='center'></td></tr>");
                  out.println("<tr><td colspan=2 align='center'><input type='Submit' value='Update'></td></tr>");
             out.println("</table>");
         out.println("</form>");
       
        out.println("<form name='home' action='http://localhost:8084/StudentJSP/HomePage.html'>");
            out.println("<table align='center' cellpadding='10px'>");
                out.println("<tr><td><input type='Submit' value='Home'></td></tr>");
            out.println("</table>");
            out.println("</form>");
            out.println("</body>");
            
            out.println("<body>");
            out.println("<h1 align='Center'>||Search Sucessful|| </h1>");
            out.println("</body>");
                        out.println("</html>");
                        }
     else
                        {out.println("<html>");
            out.println("<head>");
            out.println("<title>Search</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Search Failed</h1>");
            out.println("<a href=http://localhost:8084/StudentJSP/Search.html>Try Again</a>");
            out.println("</body>");
            out.println("</html>");
                        }
        } catch (SQLException | ClassNotFoundException ex) { 
         ex.printStackTrace();
     }
            %>
        <h1>Hello World!</h1>
    </body>
</html>
