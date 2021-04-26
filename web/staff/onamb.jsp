<%-- 
    Document   : add_amb
    Created on : Mar 23, 2021, 10:29:03 AM
    Author     : SHATTER
--%>
<%
    session.setMaxInactiveInterval(3000);
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("S") && !type.equals("W")){
            response.sendRedirect("../index.jsp");
        }
    }else{
        response.sendRedirect("../login.jsp");
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
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("success")){
        %>
                    compleated
        <%
                }else if(stat.equals("error")){
        %>
                    error
        <%
                }
            }
        %>
        <h1>Ongoing</h1>
        <table>
            <tr>
                <th>Number</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Running Location</th>
                <th>Action</th>
            </tr>
            <%
                while(rs.next()){
                %>
                <tr>
                    <th><%=rs.getString("number")%></th>
                    <th><%=rs.getString("name")%></th>
                    <th><%=rs.getString("phone")%></th>
                    <th><a href="https://www.google.com/maps/@<%=rs.getString("lat")%>,<%=rs.getString("lan")%>,15z">Open Gmaps</a></th>
                    <th><a href="../add_amb?number=<%=rs.getString("number")%>">Complete</a></th>
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
