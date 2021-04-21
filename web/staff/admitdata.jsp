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
                if(stat.equals("dis")){
        %>
                    <h1>Successfully Discharged!!</h1>
        <%
                }else if(stat.equals("success")){
        %>
                    <h1>Successfully Addmited!!</h1>
        <%
                }else if(stat.equals("error")){
        %>
                    <h1>Something Went Wrong!!</h1>
        <%
                }
            }
        %>
        
        <h1>Rooms</h1>
        <table border="1">
            <tr>
                <th>Room No</th>
                <th>Patient</th>
                <th>Doctor</th>
                <th>Guardians Name</th>
                <th>Guardians Telephone</th>
                <th>Admition Time</th>
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
                <td><%=rs.getInt("bno")%></td>
                <td><%=pat%></td>
                <td><%=doc%></td>
                <td><%=rs.getString("gname")%></td>
                <td><%=rs.getString("gtp")%></td>
                <td><%=rs.getString("time")%></td>
                <th><a href="discharge.jsp?type=room&id=<%=rs.getInt("id")%>">Discharge</a></th>
            </tr>
            <% 
                }
                }catch (Exception e){

                }
            %>
        </table>
        <hr/>
        <h1>Wards</h1>
        <table border="1">
            <tr>
                <th>ward</th>
                <th>Bed No</th>
                <th>Patient</th>
                <th>Doctor</th>
                <th>Guardians Name</th>
                <th>Guardians Telephone</th>
                <th>Admition Time</th>
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
                <th><a href="discharge.jsp?type=ward&id=<%=rs.getInt("id")%>">Discharge</a></th>
            </tr>
            <% 
                }
                }catch (Exception e){

                }
            %>
        </table>
    </body>
</html>
