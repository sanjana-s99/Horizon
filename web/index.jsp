<%-- 
    Document   : index
    Created on : Mar 8, 2021, 3:38:33 PM
    Author     : SHATTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setMaxInactiveInterval(30);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    if(id != null){
        out.print("Welcome : " + name );
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Horizen</h1>
        <a href="login.html">login</a>
        <br/>
        <a href="channel.jsp">channel</a>
        <br/>
        <a href="register.html">register</a>
        <br/>
        <a href="logout">Logout</a>
    </body>
</html>