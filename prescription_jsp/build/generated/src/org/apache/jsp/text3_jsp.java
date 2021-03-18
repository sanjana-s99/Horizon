package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class text3_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <html>\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("    <title>Facility Screen</title>\n");
      out.write("    <script src=\"http://ajax.googleapis.com/ajax/libs/angularjs/1.0.2/angular.js\"></script>\n");
      out.write("    <script>\n");
      out.write("        var TDataCtrl = function ($scope) {\n");
      out.write("            $scope.venues = [{name:'venue1',value:'venue1'},{name:'venue2', value:'venue2'}];\n");
      out.write("            $scope.facilities = [{name:'facility1',value:'facility1'},{name:'facility2',value:'facility2'}];\n");
      out.write("            $scope.vendors = [{name:'vendor1',value:'vendor1'},{name:'vendor2', value:'vendor2'}];\n");
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
      out.write("<form method=\"get\">\n");
      out.write("    <table>\n");
      out.write("        <tr>\n");
      out.write("            <td>Customer id</td>\n");
      out.write("            <td><input type=\"text\" id=\"customer_id\" name=\"customer_id\"></td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("    </table>\n");
      out.write("</form>\n");
      out.write("<div data-ng-controller=\"TDataCtrl\">\n");
      out.write("<table >\n");
      out.write("    <tbody data-ng-repeat=\"thisrow in tdata\">\n");
      out.write("    <tr>\n");
      out.write("        <td>VENUE ID</td>\n");
      out.write("        <td>\n");
      out.write("            <select id=\"select\">\n");
      out.write("                <option ng-repeat=\"option in venues\" value=\"{{option.value}}\">{{option.name}}</option>\n");
      out.write("            </select>\n");
      out.write("        </td>\n");
      out.write("        <td>FACILITY</td>\n");
      out.write("        <td>\n");
      out.write("            <select id=\"select1\">\n");
      out.write("                <option ng-repeat=\"option in facilities\" value=\"{{option.value}}\">{{option.name}}</option>\n");
      out.write("        </select>\n");
      out.write("        </td>\n");
      out.write("        <td>VEDNOR ID</td>\n");
      out.write("        <td>\n");
      out.write("            <select id=\"select2\">\n");
      out.write("                <option ng-repeat=\"option in vendors\" value=\"{{option.value}}\">{{option.name}}</option>\n");
      out.write("            </select>\n");
      out.write("        </td>\n");
      out.write("        <td>COST</td>\n");
      out.write("        <td><input type=\"text\" id=\"myDiv\"></td>\n");
      out.write("        <td>QUANTITY</td>\n");
      out.write("        <td><input type=\"text\" id=\"quantity\" name=\"quantity\"></td>\n");
      out.write("\n");
      out.write("    </tr>\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
      out.write("<input type=\"button\" value=\"Add\" data-ng-click=\"addRow()\"/>\n");
      out.write("<input type=\"button\" value=\"Remove\" data-ng-click=\"removeRow()\"/>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
