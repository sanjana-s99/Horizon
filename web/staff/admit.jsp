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
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/finddoc.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="../scripts/nav.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.js-example-basic-single').select2();
            });
        </script>
    </head>
    <body>
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <a href="channel.jsp">Channel</a>
            <a href="../Lab/">Lab</a>
            <a href="../phamacy/index.jsp">Pharmacy</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="../staff/index.jsp">Staff Dashboard</a>
            <%}else if(type.equals("W")){%>
            <a href="../staff/index.jsp">Staff Dashboard</a>
            <a href="../admin/main.jsp">Admin Dashboard</a>
            <%}}%>
            <%if(id != null){
                %>
            <a style="float:right">Welcome <%=name%></a>
            <a href="../logout" style="float:right">Logout</a>
            <%
                }else{
        %>
            <a href="../register.jsp" style="float:right">Register</a>
            <a href="../login.jsp" style="float:right">Login</a>
            <%}%>

            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
               <i class="fa fa-bars"></i>
            </a>
        </div>
            <br/><br/><br/>
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
        <div class="flex-container">
            <h1>Admission Type :  <%=request.getParameter("type")%></h1>
        </div>
        <br/>
        
        <%
                if(request.getParameter("type").equals("room")){
                    %> 
                    <div class="flex-container">
                    <form action="../radmit" method="post">
                        <select name="roomid"  class="js-example-basic-single" style="width: 30%">
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
                        <select name="doc"  class="js-example-basic-single" style="width: 30%">
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
                        <br/>
                        Guardian Details : 
                        
                        Name : <input type="text" name="gname">
                        telephone : <input type="text" name="gtp">
                        <input type="submit" value="admit">
                    </form>
                    </div>
                    <%
                }else if(request.getParameter("type").equals("ward")){
%>
                        <div class="flex-container">
                            <select name="ward" onchange="GetSelectedValue1()" id="wtype"  class="js-example-basic-single" style="width: 30%">
                            <option>Select Ward</option>
                        </div>

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
<br/>
<br/>
<br/>
<div class="flex-container">
    <h1><%=request.getParameter("ward")%></h1>


    <form action="../wadmit" method="post">
        
        <select name="bid"  class="js-example-basic-single" style="width: 30%">
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
                        <div class="flex-container">
                        <option value="<%=rs.getInt("bid")%>">Bed No : <%=rs.getString("bno")%></option>
                        </div>
                        <% }
                }catch (Exception e){

                }
            %>
        </select>
            Petient NIC : <input type="text" name ="nic">
            <br/><br/>
        <select name="doc"  class="js-example-basic-single" style="width: 30%">
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
        <br/>
        Guardian Details : 
        
        Name : <input type="text" name="gname">
        telephone : <input type="text" name="gtp">
        <input type="submit" value="admit">
    </form>
</div>
<%
}else{
        %>
        <div class="flex-container">
            <h1>Select Admission Type</h1>
        <select name="type" onchange="GetSelectedValue()" id="type"  class="js-example-basic-single" style="width: 30%">
            <option>Select Admission Type</option>
            <option value="ward">Ward</option>
            <option value="room">Room</option>
        </select>
        <%}%>
        <br/>
        <a href="admit.jsp">reset</a>
        </div>
        
            
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
