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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    </head>
    <body>
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
                        %>
                        <form action="reset" method="post">
                            Password:<input type="password" name="pass1"/>
                            Re-Password:<input type="password" name="pass2"/>
                            <input type="hidden" value="<%= email %>" name="email"/>
                            <input type="submit" value="reset"/>
                        </form>
                        <%
                    }else{
                        out.println("Link Expired or invalid link!!");
                    }

                }catch(Exception e){ 
                    out.println(e);
                }
                     
                
            } else {
                out.println("invalid link!!");
            }
        %>
    </body>
</html>

