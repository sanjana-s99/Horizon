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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
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
                }
            }
        %>
    <h1>Book Appointment by Admin</h1>
        
     <div class="main">
            <form method="post" action="../lab_add">   
                <input type ="hidden" name="btype" value="a">
            <table>
                <tr>
                    <td>Patient NIC:</td>
                    <td><input type="text" name="pid"></td>
                </tr>
                <tr>
                    <td>Doctor ID:</td>
                    <td><select name="did">

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
                    <td><select name="type">

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
                    <td><input type="submit" name="submit" value="Book"/></td>
                </tr>
                
                
            </table>
                
            </form>
            
        </div>
 
        
    
            
   
       
            
            
            
                
           
            
            
        
        <div>
            <h1>Appointment list</h1>
            <table border="1">
                <tr>
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
                                  String id=rs.getString("id");
                              
                                  String name = null, drname = null;
                                  
                                    user userdata = new user();
                                    try{
                                        ResultSet rs1 = userdata.udata(rs.getString("pid"));
                                        rs1.next();
                                        name = rs1.getString("name");
                                    }catch(Exception e){
                                        out.println("Error");
                                    }
                                    
                                    try{
                                        ResultSet rs2 = userdata.udata(rs.getString("did"));
                                        rs2.next();
                                        drname = rs2.getString("name");
                                    }catch(Exception e){
                                        out.println("Error");
                                    }

                            %>
                            <tr>
                                <td><%=name %></td>
                                <td><%=drname %></td>
                                <td><%=rs.getString("type") %></td>
                                <td><%=rs.getString("date") %></td>
                                <td><%=rs.getString("time") %></td>
                                
                                <td><a href="Delete.jsp?id=<%=id%>" >Delete</a></td>
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
