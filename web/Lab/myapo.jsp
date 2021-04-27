<%-- 
    Document   : myapo
    Created on : Apr 3, 2021, 10:44:50 AM
    Author     : Jayani
--%>

<%@page import="Model.user"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    session.setMaxInactiveInterval(3000);
    String uid = (String)session.getAttribute("id");
    String uname = (String)session.getAttribute("name");
    if(uid == null){
        response.sendRedirect("../login.jsp");
    }else{
        out.print("Welcome : " + uname );
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("success")){
        %>
                    <h1>Successfully Booked!</h1>
        <%
                }else if(stat.equals("error")){
        %>
                    <h1>Something Went Wrong!!</h1>
        <%
                }else if(stat.equals("delete")){
        %>
                    <h1>Delete Success!!</h1>
        <%
                }
            }
        %>
        <div>
            <h1>Appointment list</h1>
            <table border="1">
                <tr>
                    <th>Doctor Name</th>
                    <th>Appointment type</th>
                    <th>Appointment date</th>
                    <th>Appointment time</th>
                    
                    <th>Delete</th>
                        
                </tr>
                
                 <%
                     try{
                             
                              dbCon con = new dbCon();
                              String query="SELECT * FROM lab_apo WHERE pid = " + uid;
                              Statement st=con.createConnection().createStatement();
                              ResultSet rs=st.executeQuery(query);
                              
                              while(rs.next()){
                                  String id=rs.getString("id");
                              
                                  String  drname = null;
                                  
                                    user userdata = new user();
                                    
                                    try{
                                        ResultSet rs2 = userdata.udata(rs.getString("did"));
                                        rs2.next();
                                        drname = rs2.getString("name");
                                    }catch(Exception e){
                                        out.println("Error");
                                    }

                            %>
                            <tr>
                                <td><%=drname %></td>
                                <td><%=rs.getString("type") %></td>
                                <td><%=rs.getString("date") %></td>
                                <td><%=rs.getString("time") %></td>
                                
                                <td><a href="Delete.jsp?tar=u&id=<%=id%>" >Delete</a></td>
                            </tr>
                            <%
                               }  
                            }catch(Exception ex){
                                System.out.println(ex.getMessage());
                            }
                            %>
            </table>
        </div>
            
            <form action="index.jsp" method="post">
                <input type="submit" value="Back"/>
            </form>
            
    </body>
</html>
