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
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    name = name.substring(0, name.indexOf(' '));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script src="scripts/nav.js"></script>
        <link rel="stylesheet" href="../styles/staffchannel.css">
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
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <a href="../patients/">Channel</a>
            <a href="../Lab/">Lab</a>
            <a href="../phamacy/index.jsp">Pharmacy</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="index.jsp">Staff Dashboard</a>
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
        
        <h2 class="center-text">Channel a doctor for the patient</h2>
            <% if(request.getParameter("spe")==null && request.getParameter("doc")==null){ %>
            <div class="flex-container">
            <select  class="js-example-basic-single" style="width: 50%" name="doc" onchange="GetSelectedValue()" id="doc">
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
            </div>
            
            <div class="center-text">
                <a href="channel.jsp">reset</a>
            </div>
            
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
            <h4 class="center-text">Selected : <%=rs.getString("name")%>  <br><a href="staffchannel.jsp">reset</a> </h4>
            <%
                }catch (Exception e){

                }
            %>
            
            <div class="flex-container">
            <select  class="js-example-basic-single" style="width: 50%" name="doc1" onchange="GetSelectedValue1()" id="doc1">
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
            </div>
            
            
            <% } if(request.getParameter("doc")!=null){
                    String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("nouser")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'No user found!!',html: 'User Different NIC or <a href="addpat.jsp">Add User</a> '})</script>

  
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
            
            
            <h4 class="center-text">Selected : <%=rs1.getString("name")%>   <br><a href="staffchannel.jsp">reset</a> </h4>
            <div >
            <form action="../sbook" method="post" class="flex-container">
                Nic : <input type="text" name="patient">
                <input type="hidden" name="doctor" value="<%=doc %>">
                <h5 class="center-text">Ongoing Number : <%=no+1%> </h5>
                <input type="hidden" value="<%=no+1%>" name="no">
                <input type="submit" value="Channel" class="inputbutt">
            </form>
            </div>
            <%  }catch (Exception e){
                    System.out.println(e);
                }
                 %>
            <div>
                    <hr/>
                    <h2>Channelings</h2>
                    <table class="w3-table-all">
                        <tr class="tablehead">
                            <td>Patient</td>
                            <td>Number</td>
                            <td>Status</td>
                            <td>Action</td>
                            <td>Cancel</td>
                        </tr>
                        <%
                     try{
                               
                              dbCon con = new dbCon();
                              String query1="select * from channeling WHERE d_id = " + doc;
                              Statement st1=con. createConnection().createStatement();
                              ResultSet rs2=st1.executeQuery(query1);
                              
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
                System.out.println(r);
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
