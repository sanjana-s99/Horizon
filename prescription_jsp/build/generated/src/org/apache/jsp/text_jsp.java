package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class text_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <title>Bootstrap Jquery Add More Field Example</title>\n");
      out.write("  <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js\"></script>\n");
      out.write(" <!-- <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\"> -->\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        \n");
      out.write("\n");
      out.write("\n");
      out.write("      \t<div class=\"input-group control-group after-add-more\">\n");
      out.write("          <input type=\"text\" name=\"addmore[]\" class=\"form-control\" placeholder=\"Enter Name Here\">\n");
      out.write("          <div class=\"input-group-btn\"> \n");
      out.write("            <button class=\"btn btn-success add-more\" type=\"button\"><i class=\"glyphicon glyphicon-plus\"></i> Add</button>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("      \n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Copy Fields -->\n");
      out.write("        <div class=\"copy hide\">\n");
      out.write("          <div class=\"control-group input-group\" style=\"margin-top:10px\">\n");
      out.write("            <input type=\"text\" name=\"addmore[]\" class=\"form-control\" placeholder=\"Enter Name Here\">\n");
      out.write("            <div class=\"input-group-btn\"> \n");
      out.write("              <button class=\"btn btn-danger remove\" type=\"button\"><i class=\"glyphicon glyphicon-remove\"></i> Remove</button>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    $(document).ready(function() {\n");
      out.write("\n");
      out.write("\n");
      out.write("      $(\".add-more\").click(function(){ \n");
      out.write("          var html = $(\".copy\").html();\n");
      out.write("          $(\".after-add-more\").after(html);\n");
      out.write("      });\n");
      out.write("\n");
      out.write("\n");
      out.write("      $(\"body\").on(\"click\",\".remove\",function(){ \n");
      out.write("          $(this).parents(\".control-group\").remove();\n");
      out.write("      });\n");
      out.write("\n");
      out.write("\n");
      out.write("    });\n");
      out.write("\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
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
