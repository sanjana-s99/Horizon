<%-- 
    Document   : index
    Created on : Mar 8, 2021, 3:38:33 PM
    Author     : SHATTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setMaxInactiveInterval(100);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String type = (String)session.getAttribute("type");
    if(id != null){
        out.print("Welcome : " + name + "(" + type + ")" );
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Horizen</h1>
        <a href="login.html">login</a>
        <br/>
        <a href="patients/channel.jsp">channel</a>
        <br/>
        <a href="patients/viewch.jsp">View channel</a>
        <br/>
        <a href="staff/staffchannel.jsp">Staff Channel</a>
        <br/>
        <a href="register.html">register</a>
        <br/>
        <a href="admin/adduser.jsp">Admin</a>
        <br/>
        <a href="forgetpass.html">Forget Password</a>
        <br/>
        <a href="staff/add_amb.jsp">Add Ambulance</a>
        <br/>
        <a href="ambulance.jsp">Ongoing Ambulances</a>
        <br/>
        <a href="Lab/labApo.jsp">Lab</a>
        <br/>
        <a href="logout">Logout</a>
    </body>
</html>
