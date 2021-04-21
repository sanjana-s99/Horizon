<%-- 
    Document   : bill
    Created on : Apr 21, 2021, 12:32:20 PM
    Author     : SHATTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            Bed : <%=bed%>
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
            Bed : <%=bed%>
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
            <input type="submit" value="Discharge">
        </form>
    </body>
</html>
