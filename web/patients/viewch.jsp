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
    String type = (String)session.getAttribute("type");
    
    if(type != null){
        if(!type.equals("P")){
            response.sendRedirect("../index.jsp");
        }else{
        out.print("Welcome : " + name );
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
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
