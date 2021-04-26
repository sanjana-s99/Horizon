<%-- 
    Document   : nav
    Created on : 26-Apr-2021, 15:32:12
    Author     : cmman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String type = (String)session.getAttribute("type");
%>

<div class="topnav" id="myTopnav">
    <div class="toptitle">Horizon Hospitals</div>
    <a href="index.jsp">Home</a>
    <a href="patients/channel.jsp">Channel</a>
    <a href="Lab/">Lab</a>
    <a href="#">Pharmacy</a>
    
    <%
        if(type!=null){
        if(type.equals("S") || type.equals("W")){
    %>
        <a href="staff/">Staff Dashboard</a>
    <%}}else{%>
        <a href="admin/main.jsp">Admin Dashboard</a>
    <%}%>
    
    <%
        if(id != null){
    %>
        <a style="float:right">Welcome <%=name%></a>
        <a href="logout" style="float:right">Logout</a>
    <%}else{%>
        <a href="register.jsp" style="float:right">Register</a>
        <a href="login.jsp" style="float:right">Login</a>
    <%}%>
    
    <a href="javascript:void(0);" class="icon" onclick="myFunction()">
       <i class="fa fa-bars"></i>
    </a>
</div>