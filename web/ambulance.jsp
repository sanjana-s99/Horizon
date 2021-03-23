<%-- 
    Document   : ambulance
    Created on : Mar 23, 2021, 9:48:38 AM
    Author     : SHATTER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT COUNT(number) FROM ambulance WHERE status='N' ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by 
                        rs.next();
        %>
        <h1>Available Ambulance: <%=rs.getString("COUNT(number)")%></h1>
        <%
                    }catch(Exception e){
                    }
         %>
        <form action="amb" method="post">
            <select name="number">
                <option>Select Ambulance</option>

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT number FROM ambulance WHERE status='N' ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("number")%>"><%=rs.getString("number")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select>
            Name : <input type="text" name="name">
            Phone : <input type="text" name="phone">
            <input type ="hidden" name="lan" value="10.0">
            <input type="hidden" name="lat" value="22.0">
            <input type="submit" value="request">
        </form>
    </body>
</html>
