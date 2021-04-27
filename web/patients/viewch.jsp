<%-- 
    Document   : viewchannellinigs
    Created on : Mar 8, 2021, 10:48:32 PM
    Author     : SHATTER
--%>
<%@page import="Model.user"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;" %>
 <%
    session.setMaxInactiveInterval(3000);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String type = (String)session.getAttribute("type");
    
    if(type != null){
        if(!type.equals("P")){
            response.sendRedirect("../index.jsp");
        }else{
        //out.print("Welcome : " + name );
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
        <link rel="stylesheet" href="../styles/staffchannel.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="../scripts/nav.js"></script>
    </head>
    <body>
                <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <a href="../patients/channel.jsp" class="active">Channel</a>
            <a href="../Lab/index.jsp">Lab</a>
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
        <h1>channelings</h1>
        <table class="w3-table-all">
            <tr class="tablehead">
                <th>Doctor</th>
                <th>number</th>
                <th>status</th>
                <th>action</th>
            </tr>
            <%    
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT * from channeling where p_id = " + id;
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    while(rs.next()){
                        user data = new user();
                        ResultSet rs1 = data.udata(rs.getString("d_id"));
                        rs1.next();
                        String doc = rs1.getString("name");
                        String status = rs.getString("status");
                        if("R".equals(rs.getString("status"))){
                            status = "Reserved";
                        }else if("C".equals(rs.getString("status"))){
                            status = "Checked In";
                        }
                        
            %>
            <tr>
                <td><%=doc%></td>
                <td><%=rs.getInt("number")%></td>
                <td><%=status%></td>
            <%
                if("R".equals(rs.getString("status"))){
            %>
                <td><a href="../caction?pid=<%=id%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=in">Checked In</a></td>
                <td><a href="../cact?pid=<%=id%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=can">Cancel</a></td>
                </tr>
            <%
                }else if("C".equals(rs.getString("status"))){
            %>
                <td><a href="../caction?pid=<%=id%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=com">Complete</a></td>
                <td><a href="../cact?pid=<%=id%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=can">Cancel</a></td>
            </tr>
            <% }
                }
                }catch (Exception e){

                }
            %>
        </table>
    </body>
</html>
