<%-- 
    Document   : bill
    Created on : Apr 21, 2021, 12:32:20 PM
    Author     : SHATTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setMaxInactiveInterval(5000);
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    String type = (String)session.getAttribute("type");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/staffchannel.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
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
            <div class="flex-container">
        <h1>Discharge Ticket</h1>
        
        <%
            String pat =  null;
            String index = null;
            String nic = null;
            String price =  null;
            String dfee =  null;
            String pbill =  null;
            String other =  null;
            String ward =  null;
            String bed =  null;
            float tot = 0;
            if(request.getParameter("patient")!=null){
                if(request.getParameter("ward")!=null){
                    index =  request.getParameter("index");
                    nic =  request.getParameter("nic");
                    pat =  request.getParameter("patient");
                    String doc =  request.getParameter("doctor");
                    ward =  request.getParameter("ward");
                    bed =  request.getParameter("bed");
                    String atime =  request.getParameter("atime");
                    String dtime =  request.getParameter("dtime");
                    price =  request.getParameter("price");
                    dfee =  request.getParameter("dfee");
                    pbill =  request.getParameter("pbill");
                    other =  request.getParameter("other");
                    tot = Float.valueOf(price)+Float.valueOf(dfee)+Float.valueOf(pbill)+Float.valueOf(other);
                    
        %>
            Admition id : <%=index%>
            <br/>
            Ward : <%=ward%>
            <br/>
            <%=bed%>
            <br/>
            Patient : <%=pat%>
            <br/>
            Doctor : <%=doc%>
            <br/>
            Admition Time : <%=atime%>
            <br/>
            Discharge Time : <%=dtime%>
            <br/>
            Room Fee : <%=price%>
            <br/>
            Doctor Fee : <%=dfee%>
            <br/>
            Pharmacy Bill : <%=pbill%>
            <br/>
            Other Fees : <%=other%>
            <br/>
            Total : <%=tot%>
            <br/>
        <%
                }else{
                    index =  request.getParameter("index");
                    nic =  request.getParameter("nic");
                    pat =  request.getParameter("patient");
                    String doc =  request.getParameter("doctor");
                    bed =  request.getParameter("bed");
                    String atime =  request.getParameter("atime");
                    String dtime =  request.getParameter("dtime");
                    price =  request.getParameter("price");
                    dfee =  request.getParameter("dfee");
                    pbill =  request.getParameter("pbill");
                    other =  request.getParameter("other");
                    tot = Float.valueOf(price)+Float.valueOf(dfee)+Float.valueOf(pbill)+Float.valueOf(other);
%>
            Admition id : <%=index%>
            <br/>
            <%=bed%>
            <br/>
            Patient : <%=pat%>
            <br/>
            Doctor : <%=doc%>
            <br/>
            Admition Time : <%=atime%>
            <br/>
            Discharge Time : <%=dtime%>
            <br/>
            Room Fee : <%=price%>
            <br/>
            Doctor Fee : <%=dfee%>
            <br/>
            Pharmacy Bill : <%=pbill%>
            <br/>
            Other Fees : <%=other%>
            <br/>
            Total : <%=tot%>
            <br/>
<%
    }
            }
            
        %>
        <form action="../pdis" method="post">
            <input type="hidden" name="index" value="<%=index%>">
            <input type="hidden" name="nic" value="<%=nic%>">
            <input type="hidden" name="ward" value="<%=ward%>">
            <input type="hidden" name="bed" value="<%=bed%>">
            <input type="hidden" name="patient" value="<%=pat%>">
            <input type="hidden" name="room" value="<%=price%>">
            <input type="hidden" name="doc" value="<%=dfee%>">
            <input type="hidden" name="pham" value="<%=pbill%>">
            <input type="hidden" name="other" value="<%=other%>">
            <input type="hidden" name="tot" value="<%=tot%>">
            <input type="submit" value="Discharge" class="inputbutt">
        </form>
            </div>
    </body>
</html>
