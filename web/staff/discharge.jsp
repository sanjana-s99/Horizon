<%-- 
    Document   : discharge
    Created on : Apr 21, 2021, 11:09:58 AM
    Author     : SHATTER
--%>

<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Model.user"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Model.dbCon"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String type = (String)session.getAttribute("type");
    if(name!=null){
        name = name.substring(0, name.indexOf(' '));
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/staffchannel.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="../scripts/nav.js"></script>
    </head>
    <body>
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <a href="channel.jsp">Channel</a>
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
        <h1>Discharge</h1>
         <%    
            if(request.getParameter("id")!=null){
                if(request.getParameter("type").equals("ward")){
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT a.id as 'index', a.nic, a.did, a.gname, a.gtp, a.time, w.wtype, w.price, b.bno  FROM admit a JOIN beds b ON a.bno = b.bid JOIN ward_types w ON b.wid = w.wid WHERE a.type = 'ward' AND a.id = "+request.getParameter("id");
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
                        String time1 = sdf.format(rs.getTimestamp("time"));
                        String time2 = sdf.format(timestamp);

                        java.util.Date d1 = rs.getTimestamp("time");
                        java.util.Date d2 = timestamp;
                        
                        long diff = d2.getTime() - d1.getTime();
                        long days =  TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS)+1;
                        int price = rs.getInt("price")*(int)days;
                        
            %>
            Ward : <%=rs.getString("wtype")%>
            <br/>
            Bed : <%=rs.getInt("bno")%>
            <br/>
            Patient : <%=pat%>
            <br/>
            Doctor : <%=doc%>
            <br/>
            Admition Time : <%=time1%>
            <br/>
            Discharge Time : <%=time2%>
            <br/>
            Price : <%=price%>
            <br/>
            Guardians Details: <br/>
            Name : <%=rs.getString("gname")%>
            Telephone : <%=rs.getString("gtp")%>

            <form action="bill.jsp" method="post">
                <input type="hidden" name="index" value="<%=rs.getInt("index")%>">
                <input type="hidden" name="nic" value="<%=rs.getString("nic")%>">
                <input type="hidden" name="patient" value="<%=pat%>">
                <input type="hidden" name="doctor" value="<%=doc%>">
                <input type="hidden" name="ward" value="<%=rs.getString("wtype")%>">
                <input type="hidden" name="bed" value="Bed : <%=rs.getInt("bno")%>">
                <input type="hidden" name="atime" value="<%=time1%>">
                <input type="hidden" name="dtime" value="<%=time2%>">
                <input type="hidden" name="price" value="<%=price%>">
                Doctor Fee : <input type="text" name="dfee"><br/>
                Pharmacy Bill : <input type="text" name="pbill"><br/>
                other fees : <input type="text" name="other"><br/>
                <input  class="inputbutt" type="submit" value="confirm">
            </form>
<%
    }
                }catch (Exception e){

                }
    }else if(request.getParameter("type").equals("room")){
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT a.id as 'index', a.nic, a.did, a.gname, a.gtp, a.time, r.price, r.id  FROM admit a JOIN room r ON a.bno = r.id WHERE a.type = 'room' AND a.id = "+request.getParameter("id");
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
                        String time1 = sdf.format(rs.getTimestamp("time"));
                        String time2 = sdf.format(timestamp);

                        java.util.Date d1 = rs.getTimestamp("time");
                        java.util.Date d2 = timestamp;
                        
                        long diff = d2.getTime() - d1.getTime();
                        long days =  TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS)+1;
                        int price = rs.getInt("price")*(int)days;
                        
            %>
            Room : <%=rs.getInt("id")%>
            <br/>
            Patient : <%=pat%>
            <br/>
            Doctor : <%=doc%>
            <br/>
            Admition Time : <%=time1%>
            <br/>
            Discharge Time : <%=time2%>
            <br/>
            Price : <%=price%>
            <br/>
            Guardians Details: <br/>
            Name : <%=rs.getString("gname")%>
            Telephone : <%=rs.getString("gtp")%>

            <form action="bill.jsp" method="post">
                <input type="hidden" name="index" value="<%=rs.getInt("index")%>">
                <input type="hidden" name="nic" value="<%=rs.getString("nic")%>">
                <input type="hidden" name="patient" value="<%=pat%>">
                <input type="hidden" name="doctor" value="<%=doc%>">
                <input type="hidden" name="bed" value="<%=rs.getInt("id")%>">
                <input type="hidden" name="atime" value="<%=time1%>">
                <input type="hidden" name="dtime" value="<%=time2%>">
                <input type="hidden" name="price" value="<%=price%>">
                Doctor Fee : <input type="text" name="dfee"><br/>
                Pharmacy Bill : <input type="text" name="pbill"><br/>
                other fees : <input type="text" name="other">
                <input type="submit" value="confirm" class="inputbutt">
            </form>
<%
    }
                }catch (Exception e){
                }
}
}
            %>
    </body>
</html>
