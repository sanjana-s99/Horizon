<%-- 
    Document   : Doctor
    Created on : Mar 12, 2021, 10:52:04 AM
    Author     : Movini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if(request.getParameter("submit")!=null)
    {
        
        String comments=request.getParameter("comments");
        
        
        Connection conn;
        PreparedStatement pstt;
        ResultSet xxx;
        
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/doctor","root","");
        pstt = conn.prepareStatement("insert into doctor(comments)values(?)");
        pstt.setString(1, comments);
        pstt.executeUpdate();
       
        
        
 
%>
          <script>
              alert("Record Added");
    
          </script>
    
    
    
    
<% 
   
  }

%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Doctor</h1>

    <form action="#" method="post">
    <div>
    <textarea rows="10" cols="50" name="comments" id="comments"  style="font-family:sans-serif;font-size:1.2em;" type="text" >
     
    </textarea>
    
    </div><br>
    <input type="submit" value="submit" name="submit">
    </form>
     
       
  
        
        
        
        
        
    </body>
</html>
