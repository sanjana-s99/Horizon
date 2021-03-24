package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.lang.String;
import java.io.PrintWriter;
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
      out.write("\n");
      out.write("\n");
      out.write("\n");

    if(request.getParameter("submit")!=null)
    {
        String doc_name=request.getParameter("doc_name");
        
        String pname=request.getParameter("pname");
        String drug_name=request.getParameter("drug_name");
       
        String tdate=request.getParameter("tdate");
        String totalprice=request.getParameter("totalprice");
        
      String  test =null;
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        
 
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
        
String[] a = request.getParameterValues("drug_name");
if(a!=null)
{
for(int i=0;i<a.length;i++){
//out.println(a[i]);

}}


if(a.length == 1)
    
{
    
  test  = (a[0]+","+a[1]);   
    
}
if(a.length == 2){
    
     test  = (a[0]+","+a[1]);   
 
    
}

if(a.length == 3){
    
     test  = (a[0]+","+a[1]+","+a[2]);  
    
}

if(a.length == 4){
    
     test  = (a[0]+","+a[1]+","+a[2]+","+a[3]);  
    
}














pst = con.prepareStatement("insert into prescription(doc_name,pname,drug_name,tdate,totalprice)values(?,?,?,?,?)");
        pst.setString(1, doc_name);
       
        pst.setString(2, pname);
        pst.setString(3,test);
       
        pst.setString(4,tdate);
        pst.setString(5,totalprice);
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
      out.write("<html >\n");
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
      out.write("        \n");
      out.write("        <script src=\"http://ajax.googleapis.com/ajax/libs/angularjs/1.0.2/angular.js\"></script>\n");
      out.write("        <script>\n");
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
      out.write("        </script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body data-ng-app>\n");
      out.write("        <h3>Prescription</h3>\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-4\">\n");
      out.write("                <form  method=\"post\" action=\"#\">\n");
      out.write("                    \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        \n");
      out.write("                         <label class=\"form-label\">Doctor name</label>\n");
      out.write("                       <select class=\"form-control\" aria-label=\"Default select example\" name=\"doc_name\">  \n");
      out.write("                        \n");
      out.write("                         ");

                        
                         Connection conn;
                         PreparedStatement pst1;
                         ResultSet rss;
       
                         Class.forName("com.mysql.jdbc.Driver");
                         conn=DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
                         
                           String query1 ="select * from doctor";
                           Statement st1 =conn.createStatement();
                           
                            rss =st1.executeQuery( query1);
                             while(rss.next())
                             {
                             

                                
                            
                            String name= rss.getString("name");
                        


                        
      out.write("\n");
      out.write("                         <tr>\n");
      out.write("                         <option selected  value=\"");
      out.print(name);
      out.write('"');
      out.write('>');
      out.print(name);
      out.write("</option>\n");
      out.write("                         \n");
      out.write("                          \n");
      out.write("                        </tr>\n");
      out.write("                        ");

                          
                          }
                        
                        
      out.write(" \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                       </select>  \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("            \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Patient name</label>\n");
      out.write("                \n");
      out.write("                          \n");
      out.write("                         <select class=\"form-control\" aria-label=\"Default select example\" name=\"pname\"> \n");
      out.write("                         ");

                        
                         Connection conn1;
                         PreparedStatement pst2;
                         ResultSet rss1;
       
                         Class.forName("com.mysql.jdbc.Driver");
                         conn=DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
                         
                           String query2 ="select * from users";
                           Statement st2 =conn.createStatement();
                           
                            rss1 =st2.executeQuery( query2);
                             while(rss1.next())
                             {
                             

                                
                            
                            String name= rss1.getString("name");
                        


                        
      out.write("\n");
      out.write("                        \n");
      out.write("                         <option selected  value=\"");
      out.print(name);
      out.write('"');
      out.write('>');
      out.print(name);
      out.write("</option>\n");
      out.write("                          \n");
      out.write("                         \n");
      out.write("                       \n");
      out.write("                        ");

                          
                          }
                        
                        
      out.write(" \n");
      out.write("                         </select>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                       \n");
      out.write("                   \n");
      out.write("                    \n");
      out.write("                  <!--  <div class=\"row\">\n");
      out.write("                   <div class=\"form-group col-md-6\">\n");
      out.write("                      <label id=\"lblRange\" class=\"form-label\">Drug name</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"drug_name\" id=\"drug_name\" required aria-labelledby='lblRange'> \n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"drug_name\" id=\"drug_name[]\" required aria-labelledby='lblRange'> \n");
      out.write("                    </div> \n");
      out.write("                                       \n");
      out.write("                    <div  class=\"form-group col-md-6\">\n");
      out.write("                        <label id=\"x\" class=\"form-label\">Price</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"price\" id=\"price\" required required aria-labelledby='x' > \n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"\" name=\"price\" id=\"price[]\" required required aria-labelledby='x' > \n");
      out.write("                    </div>\n");
      out.write("                    </div> -->\n");
      out.write("                  \n");
      out.write("                  <div data-ng-controller=\"TDataCtrl\">\n");
      out.write("                    <table >\n");
      out.write("                        <tbody data-ng-repeat=\"thisrow in tdata\">\n");
      out.write("                        <tr>\n");
      out.write("\n");
      out.write("                            <td>Drug name</td>\n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                  <td><select class=\"form-control\"  name=\"drug_name\"   size=\"\" multiple=\"multiple\" tabindex=\"1\"> \n");
      out.write("                         ");

                        
                         Connection conn11;
                         PreparedStatement pst21;
                         ResultSet rss11;
       
                         Class.forName("com.mysql.jdbc.Driver");
                         conn11=DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
                         
                           String query21 ="select * from records";
                           Statement st21 =conn.createStatement();
                           
                            rss11 =st21.executeQuery( query21);
                             while(rss11.next())
                             {
                             

                                
                            
                            String drugsname= rss11.getString("drugsname");
                            String price= rss11.getString("price");
                        


                        
      out.write("\n");
      out.write("                        \n");
      out.write("                         <option selected  value=\"");
      out.print(drugsname);
      out.write(" /-");
      out.print(price);
      out.write('"');
      out.write('>');
      out.print(drugsname);
      out.write(" </option>\n");
      out.write("                         \n");
      out.write("                         \n");
      out.write("                             \n");
      out.write("                              \n");
      out.write("                          \n");
      out.write("                         \n");
      out.write("                       \n");
      out.write("                        ");

                          
                          }
                        
                        
      out.write(" \n");
      out.write("                         </select></td>\n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                        </tr>\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                    \n");
      out.write("                    </div>\n");
      out.write("                  \n");
      out.write("\n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Total price</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"totalprice\" > \n");
      out.write("                    </div><br>\n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                    \n");
      out.write("                       \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Date & Time</label>\n");
      out.write("                        <input type=\"datetime-local\" class=\"form-control\" placeholder=\"\" name=\"tdate\" id=\"tdate\" required > \n");
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
      out.write("                    <table id=\"tbl-prescription\" class=\"table table-responsive table-bordered\" cellpadding=\"0\" width=\"50%\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr id=\"mac\">\n");
      out.write("                                <th >Doctor name</th>\n");
      out.write("                                \n");
      out.write("                                <th>Patient name</th>\n");
      out.write("                                <th>Drug name </th>\n");
      out.write("                                 <th>price </th>\n");
      out.write("                                \n");
      out.write("                                <th>Date & Time</th>\n");
      out.write("                                <th>Edit</th>\n");
      out.write("                                <th>Delete</th>\n");
      out.write("                                <th>Send Email</th>\n");
      out.write("                            </tr>\n");
      out.write("                       </thead>    \n");
      out.write("                     ");
 
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
        
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
                            
                            String query ="select * from prescription";
                            Statement st= con.createStatement();
                            rs=st.executeQuery(query);
                            
                           /** String strQuery = "SELECT SUM(price) FROM prescription";
                            ResultSet rss = st.executeQuery(strQuery);
                            Double t_price=null;

                           while(rs.next()){
                              while(rss.next()){
                               }

                            rss.getDouble(t_price);*/
                            
                            while(rs.next()){
                               String id=rs.getString("id");
                               String username =rs.getString("pname");
                               String doctorname =rs.getString("doc_name");
                               String drugs =rs.getString("drug_name");
                               String totalprice =rs.getString("totalprice");
                               String date=rs.getString("tdate");
                               
                               
                           
      out.write("\n");
      out.write("                               \n");
      out.write("                            \n");
      out.write("                         \n");
      out.write("                            <tr>\n");
      out.write("                              \n");
      out.write("                                <td>");
      out.print(rs.getString("doc_name"));
      out.write("</td>\n");
      out.write("                                \n");
      out.write("                                <td>");
      out.print(rs.getString("pname"));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(rs.getString("drug_name"));
      out.write("</td> \n");
      out.write("                               \n");
      out.write("                                  <td>");
      out.print(rs.getString("totalprice"));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(rs.getString("tdate"));
      out.write("</td>\n");
      out.write("                                <td><a href=\"update.jsp?id=");
      out.print(id);
      out.write("\">Edit</a></td>\n");
      out.write("                                <td><a href=\"delete.jsp?id=");
      out.print(id);
      out.write("\">Delete</a></td>\n");
      out.write("                                <td><a href=\"email.jsp?id=");
      out.print(id);
      out.write("&username=");
      out.print(username);
      out.write("&doctorname=");
      out.print(doctorname);
      out.write("&drugs=");
      out.print(drugs);
      out.write("&date=");
      out.print(date);
      out.write("&price=");
      out.print(totalprice);
      out.write(" \">Email</a></td>\n");
      out.write("                                \n");
      out.write("                            </tr>\n");
      out.write("                            \n");
      out.write("                           \n");
      out.write("                            \n");
      out.write("   \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                                                     \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            ");
 }
      out.write("\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                  \n");
      out.write("                        \n");
      out.write("                    </table> \n");
      out.write("                           \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                            <div>\n");
      out.write("                                 <form method=\"get\" action=\"doc\">\n");
      out.write("                                 <lable>Prescription list</lable>\n");
      out.write("                                 <input type=\"submit\" value=\"By Doctor\" name=\"submit\" >\n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                                   \n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                         \n");
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
