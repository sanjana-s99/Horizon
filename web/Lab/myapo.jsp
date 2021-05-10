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
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("P")){
            response.sendRedirect("../index.jsp");
        }
    }else{
        response.sendRedirect("../login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/staffchannel.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="../scripts/nav.js"></script>
    </head>
    <body>
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("success")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Success',text: 'Appoinment Making Successfull'})</script>
        <%
                }else if(stat.equals("error")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Oops...',text: 'Something Went Wrong'})</script>
        <%
                }else if(stat.equals("delete")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Success',text: 'Deletion Successfull'})</script>
        <%
                }
            }
        %>
        
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <a href="channel.jsp">Channel</a>
            <a href="../Lab/" class="active">Lab</a>
            <a href="../phamacy/index.jsp">Pharmacy</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="../staff/index.jsp">Staff Dashboard</a>
            <%}else if(type.equals("W")){%>
            <a href="../staff/index.jsp">Staff Dashboard</a>
            <a href="../admin/main.jsp">Admin Dashboard</a>
            <%}}%>
            <%if(id != null){
                %>
            <a style="float:right">Welcome <%=name%></a>
            <a href="../logout" style="float:right">Logout</a>
            <%
                }else{
        %>
            <a href="../register.jsp" style="float:right">Register</a>
            <a href="../login.jsp" style="float:right">Login</a>
            <%}%>

            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
               <i class="fa fa-bars"></i>
            </a>
        </div>
        
        <div>
            <h1>Appointment list</h1>
            <table class="w3-table-all">
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
                              String query="SELECT * FROM lab_apo WHERE pid = " + id;
                              Statement st=con.createConnection().createStatement();
                              ResultSet rs=st.executeQuery(query);
                              
                              while(rs.next()){
                                  String uid=rs.getString("id");
                              
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
                                
                                <td><a href="Delete.jsp?tar=u&id=<%=uid%>" >Delete</a></td>
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
                <br/>
                <input type="submit" value="Back" class="inputbutt"/>
            </form>
            
    </body>
</html>
