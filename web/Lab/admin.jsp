<%-- 
    Document   : admin
    Created on : Mar 21, 2021, 3:10:08 PM
    Author     : Jayani
--%>
<%@page import="Model.user"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*" %>


<% 
    session.setMaxInactiveInterval(3000);
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("S") && !type.equals("W")){
            response.sendRedirect("../index.jsp");
        }
    }else{
        response.sendRedirect("../login.jsp");
    }
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
        <script src="../scripts/nav.js"></script>
        <link rel="stylesheet" href="../styles/staffchannel.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.js-example-basic-single').select2();
            });
        </script>
        <style type="text/css">
            
               
            
            .main{
                padding: 5px;
                margin: 5px;
                border: solid 1px black;
            }
        </style>
    </head>
    <body>
         <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("nu")){
        %>
                   <h1>No user found!!</h1>
                    <p>User Different NIC or <a href="../staff/addpat.jsp">add user</a> </p>
        <%
                }else if(stat.equals("success")){
        %>
                    <h1>Successfully Booked!</h1>
        <%
                }else if(stat.equals("error")){
        %>
                    <h1>Something Went Wrong!!</h1>
        <%
                }else if(stat.equals("time")){
        %>
                    <h1>Time Slot is not available.</h1>
        <%
                }else if(stat.equals("delete")){
        %>
                    <h1>Delete Success</h1>
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
    <h1>Book Appointment by Admin</h1>
        
     <div class="main">
            <form method="post" action="../lab_add">   
                <input type ="hidden" name="btype" value="a">
                <table class="w3-table-all" style="width:60% !important">
                <tr>
                    <td>Patient NIC:</td>
                    <td><input type="text" name="pid"></td>
                </tr>
                <tr>
                    <td>Doctor ID:</td>
                    <td><select name="did" class="js-example-basic-single" style="width: 50%" >

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT * FROM users WHERE type = 'D' ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("id")%>"><%=rs.getString("name")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select></td>
                </tr>
                <tr>
                    <td>Select Appointment Type:</td>
                    <td><select name="type"  class="js-example-basic-single" style="width: 50%" >

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT * FROM lab ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("Atype")%>"><%=rs.getString("Atype")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select></td>
                </tr>
                <tr>
                    <td>Select Date:</td>
                    <td><input type="date" name="date"/></td>
                </tr>
                <tr>
                    <td>Select Time:</td>
                    <td><input type="time"  name="time"></td>
                </tr>
               
                <tr>
                    <td></td>
                    <td><input type="submit" name="submit" value="Book" class="inputbutt"/></td>
                </tr>
                
                
            </table>
                
            </form>
            
        </div>
 
        
    
            
   
       
            
            
            
                
           
            
            
        
        <div>
            <h1>Appointment list</h1>
            <table class="w3-table-all">
                <tr class="tablehead">
                    <th>Patient Name</th>
                    <th>Doctor Name</th>
                    <th>Appointment type</th>
                    <th>Appointment date</th>
                    <th>Appointment time</th>
                    
                    <th>Delete</th>
                        
                </tr>
                
                 <%
                     try{
                             
                              dbCon con = new dbCon();
                              String query="SELECT * FROM lab_apo";
                              Statement st=con.createConnection().createStatement();
                              ResultSet rs=st.executeQuery(query);
                              
                              while(rs.next()){
                                  String aid=rs.getString("id");
                              
                                  String aname = null, adrname = null;
                                  
                                    user userdata = new user();
                                    try{
                                        ResultSet rs1 = userdata.udata(rs.getString("pid"));
                                        rs1.next();
                                        aname = rs1.getString("name");
                                    }catch(Exception e){
                                        out.println("Error");
                                    }
                                    
                                    try{
                                        ResultSet rs2 = userdata.udata(rs.getString("did"));
                                        rs2.next();
                                        adrname = rs2.getString("name");
                                    }catch(Exception e){
                                        out.println("Error");
                                    }

                            %>
                            <tr>
                                <td><%=aname %></td>
                                <td><%=adrname %></td>
                                <td><%=rs.getString("type") %></td>
                                <td><%=rs.getString("date") %></td>
                                <td><%=rs.getString("time") %></td>
                                
                                <td><a href="Delete.jsp?tar=s&id=<%=aid%>" >Delete</a></td>
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

