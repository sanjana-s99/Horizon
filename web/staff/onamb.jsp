<%-- 
    Document   : add_amb
    Created on : Mar 23, 2021, 10:29:03 AM
    Author     : Indula
--%>
<%
    session.setMaxInactiveInterval(5000);
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("S") && !type.equals("W")){
            response.sendRedirect("../index.jsp");
        }
    }else{
        response.sendRedirect("../login.jsp");
    }
%>
<%
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
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
        <link rel="stylesheet" href="../styles/staffchannel.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script src="../scripts/nav.js"></script>
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
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("success")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Completed'})</script>
        <%
                }else if(stat.equals("error")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Error'})</script>
        <%
                }
            }
        %>
        <h1>Ongoing</h1>
        <table class="w3-table-all">
            <tr class="tablehead">
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
