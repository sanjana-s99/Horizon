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
    </head>
    <body>
        <h1>channelings</h1>
        <table>
            <tr>
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
                </tr>
            <%
                }else if("C".equals(rs.getString("status"))){
            %>
                <td><a href="../caction?pid=<%=id%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=com">Complete</a></td>
            </tr>
            <% }
                }
                }catch (Exception e){

                }
            %>
        </table>
    </body>
</html>
