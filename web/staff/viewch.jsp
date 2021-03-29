<%-- 
    Document   : viewch
    Created on : Mar 25, 2021, 7:24:19 PM
    Author     : SHATTER
--%>

<%@page import="Model.user"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <h1>Channelings</h1>
            <table border="1">
                <tr>
                    <th>Patient Name</th>
                    <th>Doctor Name</th>
                    <th>Number</th>
                    <th>Status</th>
                    
                    <th>Action</th>
                        
                </tr>
                
                 <%
                     try{
                             
                              dbCon con = new dbCon();
                              String query="SELECT * FROM channeling";
                              Statement st=con.createConnection().createStatement();
                              ResultSet rs=st.executeQuery(query);
                              rs.next();
                              
                              while(rs.next()){
                                  String pid=rs.getString("p_id");
                              
                                  String name = null, drname = null;
                                  
                                    user userdata = new user();
                                    try{
                                        ResultSet rs1 = userdata.udata(rs.getString("p_id"));
                                        rs1.next();
                                        name = rs1.getString("name");
                                    }catch(Exception e){
                                        out.println("Error");
                                    }
                                    
                                    try{
                                        ResultSet rs2 = userdata.udata(rs.getString("d_id"));
                                        rs2.next();
                                        drname = rs2.getString("name");
                                    }catch(Exception e){
                                        out.println("Error");
                                    }

                            %>
                            <tr>
                                <td><%=name %></td>
                                <td><%=drname %></td>
                                <td><%=rs.getString("number") %></td>
                                <td><%=rs.getString("status") %></td>
                                
                                <td><a href="Delete.jsp?id=<%=pid%>" >Delete</a></td>
                            </tr>
                            <%
                               }  
                            }catch(Exception ex){
                                System.out.println(ex.getMessage());
                            }
                            %>
            </table>
    </body>
</html>
