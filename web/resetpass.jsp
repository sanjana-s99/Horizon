<%-- 
    Document   : resetpass
    Created on : Mar 16, 2021, 11:17:48 PM
    Author     : SHATTER
--%>

<%@page import="Model.SendMail"%>
<%@page import="Model.verifyu"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String type = (String)session.getAttribute("type");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="./styles/login.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
    </head>
    <body>
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
         <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("error")){
        %>
                    <h1>Passwords should be same!!</h1>
                
        <%
                }}
            if (request.getParameter("mail") != "null") {
                String email = request.getParameter("mail");
                String key = request.getParameter("key");
                
                dbCon con = new dbCon();
                ResultSet rs = null;
                
                try{
                    PreparedStatement ps = con.createConnection().prepareStatement("select * from verify where email =  ?");
                    ps.setString(1, email);
                    rs = ps.executeQuery();
                    rs.next();
                    LocalDate today;     //Today
                    today = LocalDate.now();
                    LocalDate expdate = LocalDate.parse(rs.getString("exp"));
                    String dbkey = rs.getString("key");
                    
                    if(today.compareTo(expdate)<=0 && key.equals(dbkey)){
                        %>
                <div class="wrapper" style="background-image: url('images/bg-reset-form-1.jpg');">
			<div class="inner">
				<form method ="post" action="reset">
					<h3>Reset Password</h3>
					<div class="form-wrapper">
						<input type="password" placeholder="Password:" class="form-control" name="pass1" id="email" required>
						<i class="zmdi zmdi-eye-off"></i>
					</div>
                                        <div class="form-wrapper">
						<input type="password" placeholder="Re-Password:" class="form-control" name="pass2" id="email" required>
						<i class="zmdi zmdi-eye-off"></i>
					</div>
                                        <input type="hidden" value="<%= key %>" name="key"/>
                                        <input type="hidden" value="<%= email %>" name="email"/>
					<button type="submit" value="reset">Reset
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
                       
                        
                        <%
                    }else{
%>
<h1>Link Expired or invalid link!!</h1>
<%
                    }

                }catch(Exception e){ 
                    %>
<h1>Something Went Wrong</h1>
<%
                }
                     
                
            } else {
%>
                <h1>invalid link!!</h1>
<%
            }
        %>
    </body>
</html>

