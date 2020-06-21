package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class Searchjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


        Connection con;
	PreparedStatement pst;
	ResultSet rs;
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    ");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

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
            
      out.write("\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
