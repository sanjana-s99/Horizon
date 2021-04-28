<%-- 
    Document   : verify
    Created on : Mar 16, 2021, 7:02:18 PM
    Author     : SHATTER
--%>

<%@page import="Model.SendMail"%>
<%@page import="Model.verifyu"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Model.dbCon"%>
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="./styles/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script src="scripts/nav.js"></script>
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
                        
                        
                        verifyu v = new verifyu();
                        if(v.vuser(email)){
                            SendMail m = new SendMail();
                            m.send(email, "Succesfully Verified!!", "Your Horizen Hospital User Account Is Successfully Verified!!");
                            response.sendRedirect("login.jsp?status=sv"); 
                        }else{
                            %>
                            <script>Swal.fire({icon: 'error',title: 'Error',text: 'Verification Failed'})</script>
                            
                            <%
                        }
                    }else{
                        %>
                        <script>Swal.fire({icon: 'error',title: 'Error',text: 'Link expired OR Invalid'})</script>
                       
                        <%
                    }

                }catch(Exception e){ 
                    %>
                    <script>Swal.fire({icon: 'error',title: 'Error',text: 'Link expired OR Invalid'})</script>
                    
                    <%
                }
                     
                
            } else {
%>
                <script>Swal.fire({icon: 'error',title: 'Error',text: 'Invalid Link'})</script>
                <%
            }
        %>
    </body>
</html>
