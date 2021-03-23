<%-- 
    Document   : add_amb
    Created on : Mar 23, 2021, 10:29:03 AM
    Author     : SHATTER
--%>
<%
    session.setMaxInactiveInterval(30);
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("S") && !type.equals("W")){
            response.sendRedirect("../index.jsp");
        }
    }else{
        response.sendRedirect("../login.html");
    }
%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT * FROM provide_amb";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one

                %>
                
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Ongoing</h1>
        <table>
            <tr>
                <th>Number</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Lat</th>
                <th>Lan</th>
                <th>Action</th>
            </tr>
            <%
                while(rs.next()){
                %>
                <tr>
                    <th><%=rs.getString("number")%></th>
                    <th><%=rs.getString("name")%></th>
                    <th><%=rs.getString("phone")%></th>
                    <th><%=rs.getString("lat")%></th>
                    <th><%=rs.getString("lan")%></th>
                    <th><a href="add_amb?number=<%=rs.getString("number")%>">Complete</a></th>
                </tr>
                <%
                }
             %>
        </table>
        
             <%
                    }catch (Exception e){

                    }
                 %>
    </body>
</html>
