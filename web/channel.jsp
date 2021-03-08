<%-- 
    Document   : channel
    Created on : Mar 6, 2021, 8:35:45 PM
    Author     : SHATTER
--%>

<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;" %>
<% 
    session.setMaxInactiveInterval(30);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    if(id == null){
        response.sendRedirect("login.html");
    }else{
        out.print("Welcome : " + name );
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        String query = "SELECT id, name FROM doctor where s_id = " + sid ;
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

                    Statement st1 = con.createConnection().createStatement();
                    String query1 = "SELECT name FROM doctor where id =  " + doc;
                    //get table data
                    ResultSet rs1 = st.executeQuery(query1);
                    //get data one by one
                    rs1.next();

            %>
        <h4>Selected : <%=rs1.getString("name")%>   <a href="channel.jsp">reset</a> <h4>
        <form action="book" method="post">
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
