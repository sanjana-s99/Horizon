<%-- 
    Document   : labApo
    Created on : Mar 20, 2021, 10:04:16 PM
    Author     : Jayani
--%>

<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Model.user"%>
<% 
    session.setMaxInactiveInterval(3000);
    String id = (String)session.getAttribute("id");
    String nic = null;
    user userdata = new user();
        try{
            ResultSet rs = userdata.udata(id);
            rs.next();
            nic = rs.getString("nic");
        }catch(Exception e){
            out.println("Error");
    }
        System.out.println(nic);
    String name = (String)session.getAttribute("name");
    if(id == null){
        response.sendRedirect("../login.jsp");
    }else{
        out.print("Welcome : " + name );
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment</title>
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
                if(stat.equals("success")){
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
        <h1>Book Appointment</h1>
        <div class="main">
            <form method="post" action="../lab_add"> 
                <input type ="hidden" name="btype" value="u">
            <table>
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
                    <td><input type="hidden" name="pid" value="<%=nic%>"></td>
                    <td><input type="submit" name="submit" value="Book"/></td>
                </tr>
                
                
            </table>
                
            </form>
            
            
            
            
                
           
            
            
        </div>
 
        
    
            
    </body>
</html>

