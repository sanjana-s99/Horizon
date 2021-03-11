package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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

    if(request.getParameter("submit")!=null)
    {
        int doc_id=Integer.parseInt(request.getParameter("doc_id"));
        int pid=Integer.parseInt(request.getParameter("pid"));
        String pname=request.getParameter("pname");
        String drug_name=request.getParameter("drug_name");
        double price=Double.parseDouble(request.getParameter("price"));
        String tdate=request.getParameter("tdate");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
        pst = con.prepareStatement("insert into prescription(doc_id,pid,pname,drug_name,price,tdate)values(?,?,?,?,?,?)");
        pst.setInt(1, doc_id);
        pst.setInt(2, pid);
        pst.setString(3, pname);
        pst.setString(4,drug_name );
        pst.setDouble(5, price );
        pst.setString(6, tdate );
        pst.executeUpdate();
        
        
 

      out.write("\n");
      out.write("          <script>\n");
      out.write("              alert(\"Record Added\");\n");
      out.write("    \n");
      out.write("          </script>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
 
   
  }


      out.write("\n");
      out.write("\n");
      out.write("\n");
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
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-grid.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-grid.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-grid.rtl.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-grid.rtl.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-utilities.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-utilities.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-utilities.rtl.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap-utilities.rtl.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.rtl.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.rtl.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h3>Prescription</h3>\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-4\">\n");
      out.write("                <form  method=\"post\" action=\"#\">\n");
      out.write("                    \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Doctor ID</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"doc_id\" id=\"doc_id\" required > \n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("            \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Patient ID</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"pid\" id=\"pid\" required > \n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                       \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Patient name</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"pname\" id=\"pname\" required > \n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("            \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Drug name</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"drug_name\" id=\"drug_name\" required > \n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                     \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Price</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"price\" id=\"price\" required > \n");
      out.write("                    </div>\n");
      out.write("                  \n");
      out.write("                    \n");
      out.write("                       \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Date</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"tdate\" id=\"tdate\" required > \n");
      out.write("                    </div><br>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                  \n");
      out.write("                    <div alight=\"right\">\n");
      out.write("                        <input type=\"submit\" value=\"submit\" name=\"submit\" class=\"btn btn-info\" >\n");
      out.write("                        <input type=\"reset\" value=\"reset\" name=\"reset\" class=\"btn btn-warning\" >\n");
      out.write("                         \n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                </form>\n");
      out.write("                \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <div class=\"col-sm-8\">\n");
      out.write("                \n");
      out.write("                <div class=\"panel-body\">\n");
      out.write("                    <table id=\"tbl-prescription\" class=\" table table-responsive table-borderd\" cellpadding=\"0\" width=\"100%\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>Doctor ID</th>\n");
      out.write("                                <th>Patient ID</th>\n");
      out.write("                                <th>Drug name</th>\n");
      out.write("                                <th>Price</th>\n");
      out.write("                                <th>Date</th>\n");
      out.write("                                <th>Edit</th>\n");
      out.write("                                <th>Delete</th> \n");
      out.write("                            </tr>\n");
      out.write("                            \n");
      out.write("                            <tr>\n");
      out.write("                                <td></td>\n");
      out.write("                                <td></td>\n");
      out.write("                                <td></td>\n");
      out.write("                                <td></td>\n");
      out.write("                                <td></td>\n");
      out.write("                                <td></td>\n");
      out.write("                                <td></td>\n");
      out.write("                            </tr>\n");
      out.write("                        \n");
      out.write("                        </thead>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                    </table> \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
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