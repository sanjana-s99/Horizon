<%-- 
    Document   : forgetpass
    Created on : Mar 30, 2021, 10:30:54 PM
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
        <title>Forgot Password</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="./styles/login.css">
    </head>
    <body>
         <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("done")){
        %>
                    <h1>Check Your Email!!</h1>
        <%
                }else if(stat.equals("nu")){
        %>
                    <h1>No User Found!!</h1>
        <%
                }else if(stat.equals("error")){
        %>
                    <h1>Something went wrong!!</h1>
        <%
                }
            }
        %>
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="index.jsp">Home</a>
            <a href="patients/">Channel</a>
            <a href="Lab/">Lab</a>
            <a href="phamacy/productsViews/">Pharmacy</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="staff/">Staff Dashboard</a>
            <%}else if(type.equals("W")){%>
            <a href="staff/">Staff Dashboard</a>
            <a href="admin/main.jsp">Admin Dashboard</a>
            <%}}%>
            <%if(id != null){
                %>
            <a style="float:right">Welcome <%=name%></a>
            <a href="logout" style="float:right">Logout</a>
            <%
                }else{
        %>
            <a href="register.jsp" style="float:right">Register</a>
            <a href="login.jsp" style="float:right">Login</a>
            <%}%>

            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
               <i class="fa fa-bars"></i>
            </a>
        </div>
        <div class="wrapper" style="background-image: url('images/bg-reset-form-1.jpg');">
			<div class="inner">
				<form method ="post" action="forget">
					<h3>Forgot Password?</h3>
					<div class="form-wrapper">
						<input type="email" placeholder="Email Address" class="form-control" name="email" id="email" required>
						<i class="zmdi zmdi-email"></i>
					</div>
					<button type="submit">Reset
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
    </body>
</html>
