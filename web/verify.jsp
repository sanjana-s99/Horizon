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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        
                        
                        verifyu v = new verifyu();
                        if(v.vuser(email)){
                            SendMail m = new SendMail();
                            m.send(email, "Succesfully Verified!!", "Your Horizen Hospital User Account Is Successfully Verified!!");
                            response.sendRedirect("login.jsp?status=sv"); 
                        }else{
                            out.println("error in verifing!!");
                        }
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
