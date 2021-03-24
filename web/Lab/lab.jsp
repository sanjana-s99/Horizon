<%-- 
    Document   : lab
    Created on : Mar 20, 2021, 10:04:30 PM
    Author     : Jayani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Online Hospital Laboratory System</h1>
        <form class="card" method="post" action="labApo.jsp">
            <input type="submit" value="Book Appointment" name="submit"/> 
        </form>
         <form class="card" method="post" action="admin.jsp">
            <input type="submit" value="Admin" name="submit"/> 
        </form>
    </body>
</html>
