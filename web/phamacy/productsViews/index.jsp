<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 

<% 
    session.setMaxInactiveInterval(3000);
    String type = (String)session.getAttribute("type");
    String uid = (String)session.getAttribute("id");
    String uname = (String)session.getAttribute("name");
    if(type != null){
%>

<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Slabo+27px|Yesteryear'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'><link rel="stylesheet" href="./style.css">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../../styles/staffchannel.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script src="../../scripts/nav.js"></script>
</head>
<body>
<div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <a href="../patients/">Channel</a>
            <a href="../Lab/">Lab</a>
            <a href="../phamacy/productsViews/">Pharmacy</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="index.jsp" class="active">Staff Dashboard</a>
            <%}else if(type.equals("W")){%>
            <a href="../staff/index.jsp">Staff Dashboard</a>
            <a href="../admin/main.jsp">Admin Dashboard</a>
            <%}}%>
            <%if(uid != null){
                %>
            <a style="float:right">Welcome <%=uname%></a>
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
<div class="wrapper">
    <h1 style="padding: 2px 16px;">Product List</h1>
      <%   
          dbCon con = new dbCon();
                                
            ResultSet rs;

            String query = "select * from drugs";
            Statement st = con.createConnection().createStatement();

            rs = st.executeQuery(query);
            while (rs.next()) {



         %>

                    
                            <div class="card">
 
  <div class="container">
      <img src="download.png"  style="width:100%">
                                      <h1> drugsName - <%=rs.getString("drugsname")%></h1>
                                      <h4>Price -<%=rs.getString("price")%></h4>
                                      <h4>ExpireDate -<%=rs.getString("expdate")%></h4>
                                      <h4>BrandsName -<%=rs.getString("brands")%></h4>
                                       <h4>ManufactureCountry -<%=rs.getString("country")%></h4>
                                        <h4>ManufactureDate -<%=rs.getString("Mdate")%></h4>
                                        
                                        
                                        <a href="checkout/index.jsp?id=<%=rs.getString("id")%>&deugsname=<%=rs.getString("drugsname")%>&exp=<%=rs.getString("expdate")%>&price=<%=rs.getString("price")%>" class="myButton">BUY</a>

    
  </div>
</div>
 
                           
                            <%

                                }

                            %>

    

</div>
                            
                            
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>

</body>
</html>

<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 30%;
  float: left;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}

.myButton {
	box-shadow:inset 0px 1px 0px 0px #f29c93;
	background:linear-gradient(to bottom, #fe1a00 5%, #ce0100 100%);
	background-color:#fe1a00;
	border-radius:6px;
	border:1px solid #d83526;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.myButton:hover {
	background:linear-gradient(to bottom, #ce0100 5%, #fe1a00 100%);
	background-color:#ce0100;
}
.myButton:active {
	position:relative;
	top:1px;
}



</style>

<%
    }else{
        response.sendRedirect("../../login.jsp");
    }
%>