<%-- 
    Document   : login
    Created on : Mar 30, 2021, 9:52:47 PM
    Author     : SHATTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="./styles/login.css">
    </head>
    <body>
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("error")){
        %>
                    <h1>Email Or/And Password is Wrong!!</h1>
        <%
                }else if(stat.equals("nv")){
        %>
                    <h1>Email Not Verified!!</h1>
        <%
                }else if(stat.equals("sv")){
        %>
                    <h1>Successfully Verified!!</h1>
        <%
                }else if(stat.equals("rp")){
        %>
                    <h1>Password Reset Done!!</h1>
        <%
                }
            }
        %>
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
					<button type="submit">Login
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
    </body>
</html>
