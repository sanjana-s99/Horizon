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
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
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
        <title>Doctor - Channelings</title>
        <link rel="stylesheet" href="../styles/staffchannel.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="../scripts/nav.js"></script>
        <script>
            $(document).ready(function() {
                $('.js-example-basic-single').select2();
            });
        </script>
    </head>
    <body>
        <!--<marquee direction="left" scrollamount="4"></marquee>-->
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="../staff/">Staff</a>
            <%}else if(type.equals("W")){%>
            <a href="../staff/">Staff</a>
            <a href="../admin/main.jsp">Admin Dashboard</a>
            <%}else if(type.equals("D")){%>
            <a href="index.jsp" class="active">Doctor</a>
            <%}}%>
            <%if(id != null){
                %>
            <a style="float:right">Welcome <%=name%></a>
            <a href="../Slogout" style="float:right">Logout</a>
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
                                String pid = null;
                    String cid = null;
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("success")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Successful'})</script>
        <%
                }else if(stat.equals("error")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Error'})</script>
        <%
            }}
        %>
        <div class="flex-container">
            <%
                 if( request.getParameter("no")!=null){ 
            %>
            <br/>
            <h1>Send Prescription</h1>
            <table class="w3-table-all" style="width:30%">
                        <tr>
                            <td>Patient</td>
                            <td>Age</td>
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
                            cid = rs2.getString("number");
                            user data = new user();
                            ResultSet rs4 = data.udata(rs2.getString("p_id"));
                            rs4.next();
                            String pat = rs4.getString("name");
                            String age = rs4.getString("age");
                            String status = rs2.getString("status");
                            if("R".equals(rs2.getString("status"))){
                                status = "Reserved";
                            }else if("C".equals(rs2.getString("status"))){
                                status = "Checked In";
                            }

                            %>
                        <tr>
                            <td><%=pat %></td>
                            <td><%=age %></td>
                            <td><%=rs2.getString("number") %></td>
            </tr>
 <%    
                }catch(Exception r){
                System.out.println(r.getMessage());
                } 
%>
                    </table><br/>
                    <a class="inputbutt"  href="index.jsp">Back</a>
                    <br/>
                    <form action="../prescription" method="post" id="usrform">
                        <textarea rows="7" cols="50" name="pres" form="usrform"></textarea>
                        <input type="hidden" name="pid" value="<%=pid%>"/>
                        <input type="hidden" name="did" value="<%=did%>"/>
                        <input type="hidden" name="cid" value="<%=cid%>"/>
                        <br/>
                        <input type="submit" value="send" class="inputbutt"/>
                        <input type="reset" value="reset" class="inputbutt"/>
                    </form>
                    
                    <%}else{%>
                                        <h1>Channelings</h1>
                    <select name="doc" onchange="GetSelectedValue()" id="doc" class="js-example-basic-single" style="width: 30%">
                <option>Select Petient</option>

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "select * from channeling WHERE status <> 'D' AND d_id = " + did;
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                                user data = new user();
                                ResultSet rs6 = data.udata(rs.getString("p_id"));
                                rs6.next();
                            %>
                            <option value="<%=rs.getInt("number")%>"><%=rs.getInt("number")%> - <%=rs6.getString("name")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select>
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
