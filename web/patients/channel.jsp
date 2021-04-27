<%-- 
    Document   : channel
    Created on : Mar 6, 2021, 8:35:45 PM
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
    if(id == null){
        response.sendRedirect("../login.jsp");
    }else{
        //out.print("Welcome : " + name );
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/finddoc.css">
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
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <a href="channel.jsp" class="active">Channel</a>
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
            <% if(request.getParameter("spe")==null && request.getParameter("doc")==null){ %>
            <div class="flex-container">
            <select name="doc" onchange="GetSelectedValue()" id="doc" class="js-example-basic-single" style="width: 30%">
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
            <br>
            <a href="channel.jsp">reset</a></div>
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
            <h4 class="txtcent">Selected : <%=rs.getString("name")%>  <a href="channel.jsp">reset</a> </h4>
            <%
                }catch (Exception e){

                }
            %>
            <div class="flex-container">
            <select name="doc1" onchange="GetSelectedValue1()" id="doc1" class="js-example-basic-single" style="width: 30%">
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
        <h4 class="txtcent">Selected : <%=rs1.getString("name")%>   <a href="channel.jsp">reset</a> </h4>
        <form action="../book" method="post">
            <input type="hidden" name="doctor" value="<%=doc %>">
            <input type="hidden" name="patient" value="<%=id %>">
            <h5 class="txtcent">Ongoing Number : <%=no+1%> </h5>
            <br/>
            <input type="hidden" value="<%=no+1%>" name="no">
            <div class="flex-container">
            <input type="submit" value="Channel" class="inputbutt">
            </div>
            <br/>
            
        </form>
            <%  }catch (Exception e){
                    System.out.println(e);
                }
            } %>
        
        
        <script>
            function GetSelectedValue(){
                var e = document.getElementById("doc");
                var result = e.options[e.selectedIndex].value;
                window.location.replace("channel.jsp?spe="+result);

            }

            function GetSelectedValue1(){
                var e = document.getElementById("doc1");
                var result = e.options[e.selectedIndex].value;
                window.location.replace("channel.jsp?doc="+result);
            }
        </script>
            
            
    </body>
</html>
