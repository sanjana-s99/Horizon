<%-- 
    Document   : channel
    Created on : Mar 6, 2021, 8:35:45 PM
    Author     : SHATTER
--%>

<%
    session.setMaxInactiveInterval(30);
    String type = (String)session.getAttribute("type");
    if(type == null){
        response.sendRedirect("../login.html");
    }
%>

<%@page import="Model.user"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;" %>
<% 
    session.setMaxInactiveInterval(30);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    if(id == null){
        response.sendRedirect("../login.html");
    }else{
        out.print("Welcome : " + name );
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
            <% if(request.getParameter("spe")==null && request.getParameter("doc")==null){ %>
            <select name="doc" onchange="GetSelectedValue()" id="doc">
                <option>Select Doctor</option>

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT id, name FROM specelist ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select>
            <a href="channel.jsp">reset</a>
            <% }if(request.getParameter("spe")!=null){ %>
            <%
                String sid = request.getParameter("spe");
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT id, name FROM specelist where id =  " + sid;
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    rs.next();
            %>            
            <h4>Selected : <%=rs.getString("name")%>  <a href="channel.jsp">reset</a> <h4>
            <%
                }catch (Exception e){

                }
            %>
            <select name="doc1" onchange="GetSelectedValue1()" id="doc1">
                <option>Select Doctor</option>

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT id, name FROM users where s_id = " + sid + " AND type = 'D'";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select>
            <% } if(request.getParameter("doc")!=null){
                String doc = request.getParameter("doc");
                int no = 0;
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT MAX(number) as number FROM channeling WHERE d_id = " + doc;
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    rs.next();
                    if(rs.getInt("number")>0){
                        no=rs.getInt("number");
                    }
                    
                    user dname = new user();
                    ResultSet rs1 = dname.udata(doc);
                    //get data one by one
                    rs1.next();

            %>
        <h4>Selected : <%=rs1.getString("name")%>   <a href="channel.jsp">reset</a> <h4>
        <form action="../book" method="post">
            <input type="hidden" name="doctor" value="<%=doc %>">
            <input type="hidden" name="patient" value="<%=id %>">
            <h5>Ongoing Number : <%=no+1%> </h5>
            <br/>
            <input type="hidden" value="<%=no+1%>" name="no">
            <input type="submit" value="channel">
            <br/>
            
        </form>
            <%  }catch (Exception e){
                    System.out.println(e);
                }
            } %>
        
        
        <script>
            function GetSelectedValue(){
                var e = document.getElementById("doc");
                var result = e.options[e.selectedIndex].value;
                window.location.replace("channel.jsp?spe="+result);

            }

            function GetSelectedValue1(){
                var e = document.getElementById("doc1");
                var result = e.options[e.selectedIndex].value;
                window.location.replace("channel.jsp?doc="+result);
            }
        </script>
            
            
    </body>
</html>
