<%-- 
    Document   : register
    Created on : Mar 30, 2021, 10:11:53 PM
    Author     : SHATTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    session.setMaxInactiveInterval(5000);
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("S") && !type.equals("W")){
            response.sendRedirect("../index.jsp");
        }
    }else{
        response.sendRedirect("../login.jsp");
    }
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="../styles/register.css">
        <style>
            /* Chrome, Safari, Edge, Opera */
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
            }

            /* Firefox */
            input[type=number] {
            -moz-appearance: textfield;
            }
		</style>
    </head>
    <body>
                <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="../staff/index.jsp">Staff Dashboard</a>
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
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("error")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Oops...',text: 'Something Went Wrong'})</script>
        <%
                }else if(stat.equals("ue")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Oops...',text: 'User Exists'})</script>
        <%
                }
            }
        %>
		<div class="wrapper" style="background-image: url('../images/bg-registration-form-1.jpg');">
			<div class="inner">
				<div class="image-holder">
					<img src="../images/registration-form-1.jpg" alt="">
				</div>
				<form method ="post" action="../addpat">
					<h3>Add NEw Patient</h3>
					<div class="form-wrapper">
						<input type="text" placeholder="First Name" class="form-control" name="name" id="name" required>
					</div>
					<div class="form-wrapper">
						<input type="email" placeholder="Email Address" class="form-control" name="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
						<i class="zmdi zmdi-email"></i>
					</div>
					<div class="form-wrapper">
						<input type="tel" placeholder="Telephone Number" class="form-control" name="tp" id="tp" pattern=".{10}" required>
						<i class="zmdi zmdi-phone"></i>
					</div>
					<div class="form-wrapper">
						<input type="text" placeholder="Residential Address" class="form-control" name="add" id="add" required>
						<i class="zmdi zmdi-home"></i>
					</div>
					<div class="form-wrapper">
						<input type="text" placeholder="NIC" class="form-control" name="nic" id="nic" pattern=".{10,12}" required>
						<i class="zmdi zmdi-account"></i>
					</div>
					<button type="submit">Add User
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
    </body>
</html>
