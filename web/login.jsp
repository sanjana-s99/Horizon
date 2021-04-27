<%-- 
    Document   : login
    Created on : Mar 30, 2021, 9:52:47 PM
    Author     : SHATTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    if(name!=null){
        name = name.substring(0, name.indexOf(' '));
    }
    String type = (String)session.getAttribute("type");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="./styles/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script src="scripts/nav.js"></script>
    </head>
    <body>
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("error")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Oops...',text: 'Email Or/And Password is Wrong'})</script>
        <%
                }else if(stat.equals("nv")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Oops...',text: 'Email Not Verified'})</script>
        <%
                }else if(stat.equals("sv")){
        %>
                    <script>Swal.fire({icon: 'success',text: 'Successfully Verified!'})</script>
        <%
                }else if(stat.equals("rp")){
        %>
                    <script>Swal.fire({icon: 'success',text: 'Password Rest Complete!'})</script>
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
        
        <div class="wrapper" style="background-image: url('images/bg-registration-form-1.jpg');">
			<div class="inner">
				<div class="image-holder">
					<img src="images/login-form-1.jpg" alt="">
				</div>
				<form method ="post" action="login">
					<h3>Welcome back</h3>
					<div class="form-wrapper">
						<input type="email" placeholder="Email Address" class="form-control" name="email" id="email" required>
						<i class="zmdi zmdi-email"></i>
					</div>
					<div class="form-wrapper">
						<input type="password" placeholder="Password" class="form-control" name="psw" id="psw" required>
						<i class="zmdi zmdi-lock"></i>
					</div>
                                        <a href="forgetpass.jsp">Forgot Password?</a>
					<button type="submit">Login
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
                                        
				</form>
			</div>
		</div>
    </body>
</html>
