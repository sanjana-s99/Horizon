<%-- 
    Document   : index
    Created on : Apr 21, 2021, 4:31:26 PM
    Author     : SHATTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String type = (String)session.getAttribute("type");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
        <script src="../scripts/nav.js"></script>
        <link rel="stylesheet" href="../styles/finddoc.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <a href="../patients/">Channel</a>
            <a href="../Lab/">Lab</a>
            <a href="../phamacy/index.jsp">Pharmacy</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="../staff/index.jsp" class="active">Staff Dashboard</a>
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
        <h1 class="txtcent">Staff Dashboard</h1>
        <div class="flex-container">
        <a href="admit.jsp" class="inputbutt">Admit</a>
        <br/>
        <a href="admitdata.jsp" class="inputbutt">View Admit</a>
        <br/>
        <a href="staffchannel.jsp" class="inputbutt">Staff Channel</a>
        <br/>
        <a href="addpat.jsp" class="inputbutt">Add Patient</a>
        <br/>
        <a href="lab/admin.jsp" class="inputbutt">Lab</a>
        <br/>
        <a href="onamb.jsp" class="inputbutt">Active Ambulances</a>
        </div>
    </body>
</html>
