<%-- 
    Document   : staffchannel
    Created on : Mar 8, 2021, 9:57:02 PM
    Author     : SHATTER
--%>


<%@page import="Model.user"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;" %>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
            <% if(request.getParameter("spe")==null && request.getParameter("doc")==null){ %>
            <select name="doc" onchange="GetSelectedValue()" id="doc">
                <option>Select Doctor</option>

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT id, name FROM specelist ";
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
            <a href="channel.jsp">reset</a>
            <% }if(request.getParameter("spe")!=null){ %>
            <%
                String sid = request.getParameter("spe");
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT id, name FROM specelist where id =  " + sid;
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    rs.next();
            %>            
            <h4>Selected : <%=rs.getString("name")%>  <a href="staffchannel.jsp">reset</a> </h4>
            <%
                }catch (Exception e){

                }
            %>
            <select name="doc1" onchange="GetSelectedValue1()" id="doc1">
                <option>Select Doctor</option>

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT id FROM doctor where s_id = " + sid;
                        //String query = "SELECT id, name FROM users where s_id = " + sid + " AND type = 'D'";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            int did = rs.getInt("id");
                            Statement st1 = con.createConnection().createStatement();
                            String query1 = "SELECT id, name FROM users where id = " + did + " AND type = 'D'";
                            //get table data
                            ResultSet rs1 = st1.executeQuery(query1);
                            while(rs1.next()){
                            %>
                            <option value="<%=rs1.getInt("id")%>"><%=rs1.getString("name")%></option>

                            <% }
                                }
                    }catch (Exception e){
                        System.out.println(e);
                    }
                %>
            </select>
            <% } if(request.getParameter("doc")!=null){
                    String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("nouser")){
        %>
                    <h1>No user found!!</h1>
                    <p>User Different NIC or <a href="addpat.jsp">add user</a> </p>
        <%
            }
            }
                String doc = request.getParameter("doc");
                int no = 0;
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT MAX(number) as number FROM channeling WHERE d_id = " + doc;
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    rs.next();
                    if(rs.getInt("number")>0){
                        no=rs.getInt("number");
                    }

                    user dname = new user();
                    ResultSet rs1 = dname.udata(doc);
                    //get data one by one
                    rs1.next();

            %>
        <h4>Selected : <%=rs1.getString("name")%>   <a href="staffchannel.jsp">reset</a> </h4>
        <form action="../sbook" method="post">
            Nic : <input type="text" name="patient">
            <input type="hidden" name="doctor" value="<%=doc %>">
            <h5>Ongoing Number : <%=no+1%> </h5>
            <input type="hidden" value="<%=no+1%>" name="no">
            <input type="submit" value="channel">
            <br/>
            
        </form>
            <%  }catch (Exception e){
                    System.out.println(e);
                }
                 %>
            <div>
                    <hr/>
                    <h1>Channelings</h1>
        <table>
                        <tr>
                            <td>Patient</td>
                            <td>Number</td>
                            <td>Status</td>
                            <td>Action</td>
                        </tr>
                        <%
                     try{
                               
                              dbCon con = new dbCon();
                              String query1="select * from channeling WHERE d_id = " + doc;
                              Statement st1=con. createConnection().createStatement();
                              ResultSet rs2=st1.executeQuery(query1);
                              rs2.next();
                              
                              while(rs2.next()){
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
                            <td><%=status %></td>
            <%
                if("R".equals(rs2.getString("status"))){
            %>
                    <td><a href="../cact?pid=<%=rs2.getString("p_id")%>&did=<%=rs2.getString("d_id")%>&no=<%=rs2.getInt("number")%>&action=in">Checked In</a></td>
                    <td><a href="../cact?pid=<%=rs2.getString("p_id")%>&did=<%=rs2.getString("d_id")%>&no=<%=rs2.getInt("number")%>&action=can">Cancel</a></td>
                </tr>
            <%
                }else if("C".equals(rs2.getString("status"))){
            %>
                <td><a href="../cact?pid=<%=rs2.getString("p_id")%>&did=<%=rs2.getString("d_id")%>&no=<%=rs2.getInt("number")%>&action=com">Complete</a></td>
                <td><a href="../cact?pid=<%=rs2.getString("p_id")%>&did=<%=rs2.getString("d_id")%>&no=<%=rs2.getInt("number")%>&action=can">Cancel</a></td>
            </tr>
            <% }
                }        
                }catch(Exception r){
                System.out.println(r.getMessage());
                }
} %>
                    </table>
                    </div>
        
        
        <script>
            function GetSelectedValue(){
                var e = document.getElementById("doc");
                var result = e.options[e.selectedIndex].value;
                window.location.replace("staffchannel.jsp?spe="+result);

            }

            function GetSelectedValue1(){
                var e = document.getElementById("doc1");
                var result = e.options[e.selectedIndex].value;
                window.location.replace("staffchannel.jsp?doc="+result);
            }
        </script>
            
            
    </body>
</html>
