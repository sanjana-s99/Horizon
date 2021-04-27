<%-- 
    Document   : mychanneling
    Created on : Apr 1, 2021, 8:44:04 PM
    Author     : SHATTER
--%>

<%@page import="Model.user"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    session.setMaxInactiveInterval(3000);
    String did = (String)session.getAttribute("id");
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("D")){
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
                if(stat.equals("success")){
        %>
                    Pres Sent!!
        <%
                }else if(stat.equals("error")){
        %>
                    ERROR!
        <%
            }}
        %>
        <div>
                    <hr/>
                    <h1>Channelings</h1>
                    <select name="doc" onchange="GetSelectedValue()" id="doc">
                <option>Select Petient</option>

                <%
                    String pid = null;
                    String cid = null;
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "select * from channeling WHERE d_id = " + did;
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                                user data = new user();
                                ResultSet rs6 = data.udata(rs.getString("p_id"));
                                rs6.next();
                            %>
                            <option value="<%=rs.getInt("number")%>"><%=rs6.getString("name")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select>
            <%
                 if( request.getParameter("no")!=null){ 
            %>
        <table>
                        <tr>
                            <td>Patient</td>
                            <td>Number</td>
                        </tr>
                        <%
                     try{
                               
                            dbCon con = new dbCon();
                            String query1="select * from channeling WHERE d_id = " + did + " AND number = " + request.getParameter("no");
                            Statement st1=con. createConnection().createStatement();
                            ResultSet rs2=st1.executeQuery(query1);
                            rs2.next();
                            pid = rs2.getString("p_id");
                            cid = rs2.getString("id");
                            user data = new user();
                            ResultSet rs4 = data.udata(rs2.getString("p_id"));
                            rs4.next();
                            String pat = rs4.getString("name");
                            String status = rs2.getString("status");
                            if("R".equals(rs2.getString("status"))){
                                status = "Reserved";
                            }else if("C".equals(rs2.getString("status"))){
                                status = "Checked In";
                            }

                            %>
                        <tr>
                            <td><%=pat %></td>
                            <td><%=rs2.getString("number") %></td>
            </tr>
 <%    
                }catch(Exception r){
                System.out.println(r.getMessage());
                } 
%>
                    </table>
                    <form action="../prescription" method="post" id="usrform">
                        <textarea rows="4" cols="50" name="pres" form="usrform"></textarea>
                        <input type="hidden" name="pid" value="<%=pid%>"/>
                        <input type="hidden" name="did" value="<%=did%>"/>
                        <input type="hidden" name="cid" value="<%=cid%>"/>
                        <br/>
                        <input type="submit" value="send"/>
                        <input type="reset" value="reset"/>
                    </form>
                    
                    <%}%>
                    </div>
                    
                    <script>
                        function GetSelectedValue(){
                            var e = document.getElementById("doc");
                            var result = e.options[e.selectedIndex].value;
                            window.location.replace("index.jsp?no="+result);

                        }
                    </script>
    </body>
</html>
