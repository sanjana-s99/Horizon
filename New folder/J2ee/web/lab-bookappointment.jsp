<%-- 
    Document   : lab-bookappointment
    Created on : Mar 9, 2021, 7:19:27 PM
    Author     : Jayani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
    <% 
    if(request.getParameter("submit") != null)
    {
        String type=request.getParameter("type");
        String date=request.getParameter("date");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        
        
        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/test11","root","");
        pst=con.prepareStatement("insert into user(type,date)values(?,?)");
        
        pst.setString(1, type);
        pst.setString(2, date);
        pst.executeUpdate();
        
        %>
        <script>
            alert("Record Added");
        </script> 
       
        <%
    }
%>
        


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment</title>
        <style type="text/css">
            .divA,.divD{
                padding: 5px;
                margin: 5px;
               
            }
            .main{
                padding: 5px;
                margin: 5px;
                border: solid 1px black;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <div class="divA">
                <h3>Select Appointment Type</h3>
                <label>Select Type:</label>
                <select name="type">
                    <option name="a">ECG</option>
                    <option name="b">Lab Test(blood or urine)</option>
                    <option name="c">Container Pick Up/Specimen Drop Off</option>
                    <option name="d">Lab Test & ECG</option>
                    <option name="e">Lab Test Pediatric</option>
                </select>
            </div>
            <div class="divD">
                <h3>Select Date:</h3>
                <label>Select Date:</label>
                <input type="date" name="date"/>
            </div>
            <input type="submit" name="submit" value="submit ">
            
        </div>
    
            
    </body>
</html>
