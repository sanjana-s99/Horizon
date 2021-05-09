<%-- 
    Document   : finddocchannel
    Created on : Apr 26, 2021, 11:40:40 AM
    Author     : SHATTER
--%>

<%@page import="Model.user"%>
<%@page import="Model.dfind"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //check user logged in or not
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String type = (String)session.getAttribute("type");
    String name = (String)session.getAttribute("name");
    if(id == null){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="styles/finddoc.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="scripts/nav.js"></script>
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
        <%
            //get values from form
            String symp_1=request.getParameter("symptom1");
            String symp_2=request.getParameter("symptom2");
            String symp_3=request.getParameter("symptom3");

            //create doctor finder object
            dfind con = new dfind();
            try {
                ResultSet rs = con.symptomCheck(symp_1, symp_2,symp_3);
                int i=0;
                while(rs.next()){
                    i++;
                    String disease = rs.getString("disease");
                %>
                <br/>
                <div class="flex-container">
                <h2>Possible : <%=disease%></h2>
                <%
                    //find doctors details using specialist if
                    String sid = rs.getString("specialist_id");
                    ResultSet r=con.getDoctor(sid);
                    while(r.next()){
                        String iid =r.getString("id");
                        user data = new user();
                        ResultSet rr = data.udata(iid);
                        if(rr.next()){
                            
                %>
                <h3>We recommend : Dr. <%=rr.getString("name")%> </h3><br> <a href='patients/channel.jsp?doc=<%=rr.getString("id")%>' class="inputbutt">Channel Doctor</a>
                
                <%
                            }
                    }
                }
if(i==0){
%>
not found!!
<%
}
            } catch (Exception ex) {
                System.out.println(ex);
            } 
        %>
        </div>
    </body>
</html>
