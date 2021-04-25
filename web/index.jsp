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
    if(id != null){
        out.print("Welcome : " + name + "(" + type + ")" );
    }
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
        <!--<marquee direction="left" scrollamount="4"></marquee>-->
        <h3 class="title">Horizon Hospitals</h3>
        <div class="topnav" id="myTopnav">
            <a href="index.jsp" class="active">Home</a>
            <a href="patients/channel.jsp">Channel</a>
            <a href="Lab/">Lab</a>
            <a href="#">Pharmacy</a>
            <a href="register.jsp" style="float:right">Register</a>
            <a href="login.jsp" style="float:right">Login</a>
            <a href="logout" style="float:right">Logout</a>
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
                <div class="flex-text">+94 77 999 8989</div>
            </div>
            <div class="flex-contact-two">
                <div class="flex-text-head">Email</div>
                <div class="flex-text">support@horizon.lk</div>
            </div>
        </div>
        <footer>
            <div id="staffadmin" style="cursor: pointer;">2021</div>
        </footer>
        <script>
            document.addEventListener("DOMContentLoaded", function(event) {
                var staffadmin = document.getElementById('staffadmin');
                var count = 0;

                staffadmin.addEventListener('click', function(e) {
                    e.preventDefault();
                    count++;

                    if(count == 5){
                        Swal.fire({
                            title: '<h3>Access Dashboards</h3>',
                            html:
                              '<a href="staff/" class="poplink">Staff Dashboard</a><br>' +
                              '<a href="admin/main.jsp" class="poplink">Admin Dashboard</a>',
                            showConfirmButton: false,
                            showCloseButton: true,
                          })
                    }
                 }, false); 
             });
        </script>
    </body>
</html>
