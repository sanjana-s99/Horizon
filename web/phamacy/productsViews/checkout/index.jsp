


<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
dbCon con = new dbCon();
    if (request.getParameter("submit") != null) {

        String name = request.getParameter("name");
        String CVC = request.getParameter("cvv");
        String Expires = request.getParameter("exp");
        String price = request.getParameter("price");
        String drugname = request.getParameter("drugname");
        
        


        //String pID = request.getParameter("pID");
        PreparedStatement pst;
        pst = con.createConnection().prepareStatement("insert into payment(name,CVC,Expires,price,drugname)values(?,?,?,?,?)");

        pst.setString(1, name);
        pst.setString(2, CVC);
        pst.setString(3, Expires);
         pst.setString(4, price);
         pst.setString(5, drugname);
          
         
         

        pst.executeUpdate();
        
 


%>

<script>
    alert("Thank you");
</script>






<%           }


%>


<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Daily UI #002 Credit Card Checkout </title>
  <meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="./style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class='container'>
  <div class='window'>
    <div class='order-info'>
      <div class='order-info-content'>
        <h2>Order Summary</h2>
                <div class='line'></div>
        <table class='order-table'>
          <tbody>
            <tr>
              <td><img src='../download.png' class='full-width'></img>
              </td>
              <td>
                <br> <span class='thin'> <%= request.getParameter("id") %></span>
                
                <br><%= request.getParameter("deugsname") %><br> <span class='thin small'><%= request.getParameter("exp") %>5<br><br></span>
              </td>

              
            </tr>
            <tr>
              <td>
                <div class='price'>Rs/- <%= request.getParameter("price") %></div>
              </td>
            </tr>
          </tbody>

        </table>
        <div class='line'></div>
        
        <div class='line'></div>
        <div class='total'>
          <span style='float:left;'>
            
            TOTAL
          </span>
          <span style='float:right; text-align:right;'>
           
            Rs =<%= request.getParameter("price") %>.00/-
          </span>
        </div>
</div>
</div>
        <div class='credit-info'>
          <div class='credit-info-content'>
            <table class='half-input-table'>
              <tr><td>Please select your card: </td><td><div class='dropdown' id='card-dropdown'><div class='dropdown-btn' id='current-card'>Visa</div>
                <div class='dropdown-select'>
                <ul>
                  <li>Master Card</li>
                  <li>American Express</li>
                  </ul></div>
                </div>
               </td></tr>
            </table>
            <img src='https://dl.dropboxusercontent.com/s/ubamyu6mzov5c80/visa_logo%20%281%29.png' height='80' class='credit-card-image' id='credit-card-image'></img>
            
            <form  method="POST" action="#">
            Card Number
            <input class='input-field' name="cardname"></input>
            Card Holder
            <input class='input-field' name="name"></input>
            <table class='half-input-table'  >
              <tr>
                <td> Expires
                  <input class='input-field'  name="exp"></input>
                </td>
                <td>CVC
                  <input class='input-field' name="cvv"></input>
                </td>
                
                 <td>
                     <input  class='input-field'  value="<%= request.getParameter("price") %>" name="price" style="display: none" ></input>
                </td>
                
                 <td>
                     <input  class='input-field'  value="<%= request.getParameter("deugsname") %>" name="drugname" style="display: none" ></input>
                </td>
                
                
                
                
                
              </tr>
            </table>
            <button class='pay-btn' id="submit" value="submit" name="submit">Checkout</button>

          </div>
</form>
        </div>
      </div>
    </div>
<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>
