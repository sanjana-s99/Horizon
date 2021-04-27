<%-- 
    Document   : admit
    Created on : Apr 20, 2021, 7:26:33 PM
    Author     : SHATTER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                if(stat.equals("nouser")){
        %>
                    <h1>No user found!!</h1>
                    <p>User Different NIC or <a href="addpat.jsp">add user</a> </p>
        <%
                }else if(stat.equals("error")){
        %>
                    <h1>Something Went Wrong!!</h1>
        <%
                }
            }
        %>
        <%
            if(request.getParameter("type")!=null){
        %>
        Admition Type :  <%=request.getParameter("type")%>
        <br/>
        
        <%
                if(request.getParameter("type").equals("room")){
                    %>     
                    <form action="../radmit" method="post">
                        <select name="roomid">
                            <option>Select Room</option>

                            <%
                                try {
                                    dbCon con = new dbCon();
                                    Statement st = con.createConnection().createStatement();
                                    String query = "SELECT * FROM room WHERE status = 'F' ";
                                    //get table data
                                    ResultSet rs = st.executeQuery(query);
                                    //get data one by one
                                    while(rs.next()){
                                        %>
                                        <option value="<%=rs.getInt("id")%>">Room No : <%=rs.getString("id")%></option>

                                        <% }
                                }catch (Exception e){

                                }
                            %>
                        </select>
                        Petient NIC : <input type="text" name ="nic">
                        <select name="doc">
                            <option>Select Doctor</option>

                            <%
                                try {
                                    dbCon con = new dbCon();
                                    Statement st = con.createConnection().createStatement();
                                    String query = "SELECT * FROM users WHERE type = 'D' ";
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
                        
                        Guardian Details : 
                        <br/>
                        Name : <input type="text" name="gname">
                        telephone : <input type="text" name="gtp">
                        <input type="submit" value="admit">
                    </form>
                    <%
                }else if(request.getParameter("type").equals("ward")){
%>
                    <select name="ward" onchange="GetSelectedValue1()" id="wtype">
                        <option>Select Ward</option>

                        <%
                            try {
                                dbCon con = new dbCon();
                                Statement st = con.createConnection().createStatement();
                                String query = "SELECT * FROM ward_types ";
                                //get table data
                                ResultSet rs = st.executeQuery(query);
                                //get data one by one
                                while(rs.next()){
                                    %>
                                    <option value="<%=rs.getInt("wid")%>">Ward : <%=rs.getString("wtype")%></option>

                                    <% }
                            }catch (Exception e){

                            }
                        %>
                    </select>
<%
    }
            }else if(request.getParameter("ward")!=null){
%>
<%=request.getParameter("ward")%>
<br/>
    <form action="../wadmit" method="post">
        <select name="bid">
            <option>Select Bed</option>

            <%
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT * FROM beds WHERE status = 'F' AND wid ="+request.getParameter("wardid");
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    while(rs.next()){
                        %>
                        <option value="<%=rs.getInt("bid")%>">Bed No : <%=rs.getString("bno")%></option>

                        <% }
                }catch (Exception e){

                }
            %>
        </select>
            Petient NIC : <input type="text" name ="nic">
        <select name="doc">
            <option>Select Doctor</option>

            <%
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT * FROM users WHERE type = 'D' ";
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

        Guardian Details : 
        <br/>
        Name : <input type="text" name="gname">
        telephone : <input type="text" name="gtp">
        <input type="submit" value="admit">
    </form>
<%
}else{
        %>
        
        <select name="type" onchange="GetSelectedValue()" id="type">
            <option>Select Admition Type</option>
            <option value="ward">Ward</option>
            <option value="room">Room</option>
        </select>
        <%}%>
        <br/>
        <a href="admit.jsp">reset</a>
        
            
            <script>
            function GetSelectedValue(){
                var e = document.getElementById("type");
                var result = e.options[e.selectedIndex].value;
                window.location.replace("admit.jsp?type="+result);

            }

            function GetSelectedValue1(){
                var e = document.getElementById("wtype");
                var result = e.options[e.selectedIndex].value;
                var result1 = e.options[e.selectedIndex].text;
                window.location.replace("admit.jsp?wardid="+result+"&ward="+result1);
            }
        </script>
    </body>
</html>
