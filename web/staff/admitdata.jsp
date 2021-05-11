<%-- 
    Document   : admitdata
    Created on : Apr 21, 2021, 10:07:57 AM
    Author     : SHATTER
--%>

<%@page import="Model.user"%>
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
        <title>Staff - Discharge</title>
        <link rel="stylesheet" href="../styles/staffchannel.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="../scripts/nav.js"></script>
    </head>
    <body>
        
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("dis")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Done',text: 'Successfully Discharged'})</script>
        <%
                }else if(stat.equals("success")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Done',text: 'Successfully Admited'})</script>
        <%
                }else if(stat.equals("error")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Oops...',text: 'Somethong Went Wrong'})</script>
        <%
                }else if(stat.equals("sc")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Done',text: 'Room Changed'})</script>
        <%
                }
            }
        %>
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="index.jsp" class="active">Staff Dashboard</a>
            <%}else if(type.equals("W")){%>
            <a href="index.jsp" class="active">Staff Dashboard</a>
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
        <h1>Rooms</h1>
        <table class="w3-table-all">
            <tr class="tablehead">
                <th>Patient</th>
                <th>Doctor</th>
                <th>Guardians Name</th>
                <th>Guardians Telephone</th>
                <th>Admittion Time</th>
                <th>Room No</th>
                <th>Change Room</th>
                <th>action</th>
            </tr>
            <%    
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT * from admit where type = 'room'";
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    while(rs.next()){
                        user data = new user();
                        ResultSet rs1 = data.udata(rs.getString("did"));
                        rs1.next();
                        String doc = rs1.getString("name");
                        ResultSet rs2 = data.udatanic(rs.getString("nic"));
                        rs2.next();
                        String pat = rs2.getString("name");
                        
            %>
            <tr>
                 <td><%=pat%></td>
                <td><%=doc%></td>
                <td><%=rs.getString("gname")%></td>
                <td><%=rs.getString("gtp")%></td>
                <td><%=rs.getString("time")%></td>
                <td><%=rs.getString("bno")%></td>
                <td><form action="../changeroom" method="post"><input type="text" name="nbno" value="<%=rs.getInt("bno")%>"><input type="hidden" name="id" value="<%=rs.getInt("id")%>"><input type="hidden" name="bno" value="<%=rs.getInt("bno")%>"><input type="submit" value="Update" class="inputbutt"></form></td>
                <th><a class="inputbutt" href="discharge.jsp?type=room&id=<%=rs.getInt("id")%>">Discharge</a></th>
            </tr>
            <% 
                }
                }catch (Exception e){

                }
            %>
        </table>
        <hr/>
        <h1>Wards</h1>
        <table class="w3-table-all">
            <tr class="tablehead">
                <th>ward</th>
                <th>Bed No</th>
                <th>Patient</th>
                <th>Doctor</th>
                <th>Guardians Name</th>
                <th>Guardians Telephone</th>
                <th>Admission Time</th>
                <th>action</th>
            </tr>
            <%    
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT a.id, a.nic, a.did, a.gname, a.gtp, a.time, w.wtype, b.bno  FROM admit a JOIN beds b ON a.bno = b.bid JOIN ward_types w ON b.wid = w.wid WHERE a.type = 'ward'";
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    while(rs.next()){
                        user data = new user();
                        ResultSet rs1 = data.udata(rs.getString("did"));
                        rs1.next();
                        String doc = rs1.getString("name");
                        ResultSet rs2 = data.udatanic(rs.getString("nic"));
                        rs2.next();
                        String pat = rs2.getString("name");
                        
            %>
            <tr>
                <td><%=rs.getString("wtype")%></td>
                <td><%=rs.getInt("bno")%></td>
                <td><%=pat%></td>
                <td><%=doc%></td>
                <td><%=rs.getString("gname")%></td>
                <td><%=rs.getString("gtp")%></td>
                <td><%=rs.getString("time")%></td>
                <th><a class="inputbutt" href="discharge.jsp?type=ward&id=<%=rs.getInt("id")%>">Discharge</a></th>
            </tr>
            <% 
                }
                }catch (Exception e){

                }
            %>
        </table>
    </body>
</html>
