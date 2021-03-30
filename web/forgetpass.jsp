<%-- 
    Document   : forgetpass
    Created on : Mar 30, 2021, 10:30:54 PM
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
        <div class="wrapper" style="background-image: url('images/bg-registration-form-1.jpg');">
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
