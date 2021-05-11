<%@page import="Model.dbCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
    //to check user logged in or not
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String type = (String)session.getAttribute("type");
    String name = (String)session.getAttribute("name");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/finddoc.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="scripts/nav.js"></script>
        <script>
            $(document).ready(function() {
                $('.js-example-basic-single').select2();
            });
        </script>
    </head>
    <body>
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="index.jsp">Home</a>
            <a href="patients/">Channel</a>
            <a href="Lab/">Lab</a>
            <a href="phamacy/productsViews/">Pharmacy</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="staff/">Staff Dashboard</a>
            <%}else if(type.equals("W")){%>
            <a href="staff/">Staff Dashboard</a>
            <a href="admin/main.jsp">Admin Dashboard</a>
            <%}}%>
            <%if(id != null){
                %>
            <a style="float:right">Welcome <%=name%></a>
            <a href="logout" style="float:right">Logout</a>
            <%
                }else{
        %>
            <a href="register.jsp" style="float:right">Register</a>
            <a href="login.jsp" style="float:right">Login</a>
            <%}%>

            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
               <i class="fa fa-bars"></i>
            </a>
        </div>
            <br/><br/>
            <!--send possible sympotoms to jsp -->
        <form action="finddocchannel.jsp" method="post">
        <div class="flex-container">
            <h1>Select Possible Symptoms To Find Doctor</h1>
            Enter symptom one :
            <select class="js-example-basic-single" name="symptom1" style="width: 30%" >
                <option>Select Symptom</option>

                <%
                    //create database connection
                    dbCon con = new dbCon();
                    //load possible symptoms from database
                    try {
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT symptom FROM symptoms ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("symptom")%>"><%=rs.getString("symptom")%></option>

                            <% }
                    }catch (Exception e){
                        System.out.println(e);
                    }
                %>
            </select>
            </div>
            <div class="flex-container">
            Enter symptom two : 
            <select class="js-example-basic-single" name="symptom2" style="width: 30%" >
                <option>Select Symptom</option>
                <%
                    //load possible symptoms from database
                    try {
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT symptom FROM symptoms ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("symptom")%>"><%=rs.getString("symptom")%></option>

                            <% }
                    }catch (Exception e){
                            System.out.println(e);
                    }
                %>
            </select>
            </div>
            <div class="flex-container">
            Enter symptom three : 
            <select class="js-example-basic-single" style="width: 30%" name="symptom3">
                <option>Select Symptom</option>
                <%try{
                    //load possible symptoms from database
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT symptom FROM symptoms ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("symptom")%>"><%=rs.getString("symptom")%></option>

                            <% }
                    }catch (Exception e){
                        System.out.println(e);
                    }
                %>
            </select>
            </div>
            <div class="flex-container">
                <input type="submit" value="enter" class="inputbutt">
            </div>
        </form>        
    </body>
</html>
