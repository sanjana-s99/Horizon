<%@page import="Model.dbCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
    session.setMaxInactiveInterval(30);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    if(id == null){
        response.sendRedirect("login.jsp");
    }else{
        out.print("Welcome : " + name );
    }
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="sym" method="post">
            Enter symptom one :
            <select name="symptom1">

                <%
                    dbCon con = new dbCon();
                    try {
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT symptom FROM symptoms ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("symptom")%>"><%=rs.getString("symptom")%></option>

                            <% }
                    }catch (Exception e){
System.out.println(e);
                    }
                %>
            </select>
            Enter symptom two : 
            <select name="symptom2">

                <%
                    try {
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT symptom FROM symptoms ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("symptom")%>"><%=rs.getString("symptom")%></option>

                            <% }
                    }catch (Exception e){
System.out.println(e);
                    }
                %>
            </select>
            Enter symptom three : 
            <select name="symptom3">

                <%try{
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT symptom FROM symptoms ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("symptom")%>"><%=rs.getString("symptom")%></option>

                            <% }
                    }catch (Exception e){
                        System.out.println(e);
                    }
                %>
            </select>
        <input type="submit" value="enter">
        </form>
    </body>
</html>
