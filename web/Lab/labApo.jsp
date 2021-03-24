<%-- 
    Document   : labApo
    Created on : Mar 20, 2021, 10:04:16 PM
    Author     : Jayani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Model.user"%>
<% 
    session.setMaxInactiveInterval(30);
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
        response.sendRedirect("../login.html");
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
        <h1>Book Appointment</h1>
        <div class="main">
            <form method="post" action="../lab_add">   
            <table>
                <tr>
                    <td>Doctor ID:</td>
                    <td><input type="text" name="did"></td>
                </tr>
                <tr>
                    <td>Select Appointment Type:</td>
                    <td><select name="type">
                    <option name="a">ECG</option>
                    <option name="b">Lab Test(blood or urine)</option>
                    <option name="c">Container Pick Up/Specimen Drop Off</option>
                    <option name="d">Lab Test & ECG</option>
                    <option name="e">Lab Test Pediatric</option>
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

