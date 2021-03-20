<%-- 
    Document   : adduser
    Created on : Mar 8, 2021, 8:57:56 PM
    Author     : SHATTER
--%>

<%
    session.setMaxInactiveInterval(30);
    String type = (String)session.getAttribute("type");
    if(type != "W"){
        response.sendRedirect("index.jsp");
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    </head>
    <body>
        <div>
             <form method ="post" action="adduser">
                <h1>Add User</h1>
                <p>Please fill in this form to create an account.</p>
                <hr>

                <label for="name"><b>Name</b></label>
                <input type="text" placeholder="Enter Name" name="name" id="name" required>

                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" id="email" required>
                
                <label for="tp"><b>telephone</b></label>
                <input type="text" placeholder="Enter number" name="tp" id="tp" required>
                
                <label for="add"><b>address</b></label>
                <input type="text" placeholder="Enter address" name="add" id="add" required>
                
                <label for="nic"><b>nic</b></label>
                <input type="text" placeholder="Enter nic" name="nic" id="nic" required>
                
                <label for="type"><b>Account Type</b></label>
                <select name="type">
                    <option value="S">Staff</option>
                    <option value="D">Doctor</option>
                </select>

                <hr>
                <button type="submit">Add User</button>
              </form>
        </div>
    </body>
</html>
