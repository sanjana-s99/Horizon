<%-- 
    Document   : register
    Created on : Mar 30, 2021, 10:11:53 PM
    Author     : SHATTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    session.setMaxInactiveInterval(3000);
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("S") && !type.equals("W")){
            response.sendRedirect("../index.jsp");
        }
    }else{
        response.sendRedirect("../login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="./styles/register.css">
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
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("error")){
        %>
                    <h1>Something went wrong!!</h1>
        <%
                }else if(stat.equals("ue")){
        %>
                    <h1>User Exists!!</h1>
        <%
                }
            }
        %>
		<div class="wrapper" style="background-image: url('images/bg-registration-form-1.jpg');">
			<div class="inner">
				<div class="image-holder">
					<img src="images/registration-form-1.jpg" alt="">
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
