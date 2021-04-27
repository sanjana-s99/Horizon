<%-- 
    Document   : index
    Created on : Mar 8, 2021, 3:38:33 PM
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
        <title>Horizon Hospitals</title>
        <link rel="stylesheet" href="styles/index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script src="scripts/nav.js"></script>
    </head>
    <body>
         <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("lo")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Successfully',text: 'Logged Out'})</script>
        <%
                }
            }
        %>
        <!--<marquee direction="left" scrollamount="4"></marquee>-->
        <h3 class="title">Horizon Hospitals</h3>
        <div class="topnav" id="myTopnav">
            <a href="index.jsp" class="active">Home</a>
            <a href="patients/">Channel</a>
            <a href="Lab/">Lab</a>
            <a href="phamacy/productsViews/">Pharmacy</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="staff/">Staff</a>
            <%}else if(type.equals("W")){%>
            <a href="staff/">Staff</a>
            <a href="admin/main.jsp">Admin Dashboard</a>
            <%}else if(type.equals("D")){%>
            <a href="doctor/">Doctor</a>
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
        
        <div class="headerforimg">
            <img src="images/header.jpg" class="headerimg">
        </div>
        
        <div class="ab">
            <button class="abbutt"><a href="ambulance.jsp" class="buttlink">Request Ambulance</a></button>
        </div>
            
         <div class="ab2">
            <button class="abbutt2"><a href="finddoc.jsp" class="buttlink">Help Me Find A Doctor</a></button>
        </div>
        
        <h2 style="text-align: center;">Our Services</h2>
        
        <div class="flex-container">
            <div class="flex-item-one">
                <img src="images/channelling.png">
                <div class="flex-text-head">Channelling</div>
                <div class="flex-text"></div>
            </div>
            <div class="flex-item-two">
                <img src="images/laboratory.png">
                <div class="flex-text-head">Laboratory</div>
                <div class="flex-text"></div>
            </div>
            <div class="flex-item-three">
                <img src="images/pharmacy.png">
                <div class="flex-text-head">Pharmacy</div>
                <div class="flex-text"></div>
            </div>
            <div class="flex-item-four">
                <img src="images/ambulance.png">
                <div class="flex-text-head">Ambulance</div>
                <div class="flex-text"></div>
            </div>
        </div>
        <h2 style="text-align: center;">Contact Us</h2>
        <div class="flex-container">
            <div class="flex-contact-one">
                <div class="flex-text-head">Call</div>
                <div class="flex-text">+94 81 999 8989</div>
            </div>
            <div class="flex-contact-two">
                <div class="flex-text-head">Email</div>
                <div class="flex-text">support@horizon.lk</div>
            </div>
        </div>
        <footer>
            <div>
                Made with <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" style="width:16px;overflow:visible">
              <path class="breathing" d="M24.85 10.126c2.018-4.783 6.628-8.125 11.99-8.125 7.223 0 12.425 6.179 13.079 13.543 0 0 .353 1.828-.424 5.119-1.058 4.482-3.545 8.464-6.898 11.503L24.85 48 7.402 32.165c-3.353-3.038-5.84-7.021-6.898-11.503-.777-3.291-.424-5.119-.424-5.119C.734 8.179 5.936 2 13.159 2c5.363 0 9.673 3.343 11.691 8.126z" fill="#d75a4a"></path>
            </svg> in <strong>Sri Lanka</strong>.
            </div>
        </footer>
    </body>
</html>
