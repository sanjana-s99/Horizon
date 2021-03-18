package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class text2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("    <title>Facility Screen</title>\n");
      out.write("    <script src=\"http://ajax.googleapis.com/ajax/libs/angularjs/1.0.2/angular.js\"></script>\n");
      out.write("    <script>\n");
      out.write("        var TDataCtrl = function ($scope) {\n");
      out.write("           \n");
      out.write("            $scope.tdata = [{'id': '0'}];\n");
      out.write("            $scope.addRow = function(){\n");
      out.write("                $scope.tdata[$scope.tdata.length]={'id':$scope.tdata.length};\n");
      out.write("            };\n");
      out.write("            $scope.removeRow = function(){\n");
      out.write("                $scope.tdata.pop();\n");
      out.write("            };\n");
      out.write("        };\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body data-ng-app>\n");
      out.write("\n");
      out.write("<div data-ng-controller=\"TDataCtrl\">\n");
      out.write("<table >\n");
      out.write("    <tbody data-ng-repeat=\"thisrow in tdata\">\n");
      out.write("    <tr>\n");
      out.write("\n");
      out.write("        <td> <label id=\"lblRange\" class=\"form-label\">Drug name</label></td>\n");
      out.write("        <td><input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"drug_name\" id=\"drug_name\" required aria-labelledby='lblRange'> </td>\n");
      out.write("        <td><label id=\"x\" class=\"form-label\">Price</label></td>\n");
      out.write("        <td><input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"price\" id=\"price\" required required aria-labelledby='x' > </td>\n");
      out.write("           \n");
      out.write("    </tr>\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
      out.write("<input type=\"button\" value=\"Add\" data-ng-click=\"addRow()\"/>\n");
      out.write("<input type=\"button\" value=\"Remove\" data-ng-click=\"removeRow()\"/>\n");
      out.write("</div>\n");
      out.write("</body>\n");
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
