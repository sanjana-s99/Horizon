<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Slabo+27px|Yesteryear'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'><link rel="stylesheet" href="./style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="wrapper">

  <div class="header">
    <h1 class="header__title">Horizon </h1>
    <h2 class="header__subtitle">with Flexbox</h2>
  </div>
    
    
    
    
      <%   
                                
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/pharmacy", "root", "");

                                String query = "select * from records";
                                Statement st = con.createStatement();

                                rs = st.executeQuery(query);
                                while (rs.next()) {

                                    String id = rs.getString("id");
                                  

                                    String drugsname = rs.getString("drugsname");
                                    String price = rs.getString("price");
                                    String date = rs.getString("date");


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
  width: 40%;
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
