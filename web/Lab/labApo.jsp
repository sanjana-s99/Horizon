<%-- 
    Document   : labApo
    Created on : Mar 20, 2021, 10:04:16 PM
    Author     : Jayani
--%>

<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Model.user"%>
<% 
    session.setMaxInactiveInterval(3000);
    String id = (String)session.getAttribute("id");
    String nic = null;
    user userdata = new user();
        try{
            ResultSet rs = userdata.udata(id);
            rs.next();
            nic = rs.getString("nic");
        }catch(Exception e){
            out.println("Error");
    }
        System.out.println(nic);
    String name = (String)session.getAttribute("name");
    if(id == null){
        response.sendRedirect("../login.jsp");
    }else{
        //out.print("Welcome : " + name );
    }
%>
<%
    session.setMaxInactiveInterval(5000);
    String type = (String)session.getAttribute("type");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment</title>
        <link rel="stylesheet" href="../styles/staffchannel.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="../scripts/nav.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.js-example-basic-single').select2();
            });
        </script>

    </head>
    <body>
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("success")){
        %>
                    <h1>Successfully Booked!</h1>
        <%
                }else if(stat.equals("error")){
        %>
                    <h1>Something Went Wrong!!</h1>
        <%
                }else if(stat.equals("time")){
        %>
                    <h1>Time Slot is not available.</h1>
        <%
                }
            }
        %>
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
            <div class="flex-container">
        <h1>Book Appointment</h1>
            <form method="post" action="../lab_add"> 
                <input type ="hidden" name="btype" value="u">
                <table class="w3-table-all" style="width:100% !important">
                <tr>
                    <td>Doctor ID:</td>
                    <td><select name="did"  class="js-example-basic-single" style="width: 100%" >

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
                            <option value="<%=rs.getString("id")%>"><%=rs.getString("name")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select></td>
                </tr>
                <tr>
                    <td>Select Appointment Type:</td>
                    <td><select name="type"  class="js-example-basic-single" style="width: 100%" >

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT * FROM lab ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("Atype")%>"><%=rs.getString("Atype")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select></td>
                </tr>
                <tr>
                    <td>Select Date:</td>
                    <td><input type="date" name="date"/></td>
                </tr>
                <tr>
                    <td>Select Time:</td>
                    <td><input type="time"  name="time"></td>
                </tr>
                
                <tr>
                    <td><input type="hidden" name="pid" value="<%=nic%>"></td>
                    <td><input type="submit" name="submit" value="Book" class="inputbutt"/></td>
                </tr>
                
                
            </table>
                
            </form>      
        </div>            
    </body>
</html>

