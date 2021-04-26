<%-- 
    Document   : finddocchannel
    Created on : Apr 26, 2021, 11:40:40 AM
    Author     : SHATTER
--%>

<%@page import="Model.user"%>
<%@page import="Model.dfind"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String symp_1=request.getParameter("symptom1");
            String symp_2=request.getParameter("symptom2");
            String symp_3=request.getParameter("symptom3");


            dfind con = new dfind();
            try {
                ResultSet rs = con.symptomCheck(symp_1, symp_2,symp_3);
                while(rs.next()){
                    String disease = rs.getString("disease");
                %>
                <h2>Possible : <%=disease%></h2>
                <%
                    String sid = rs.getString("specialist_id");
                    ResultSet r=con.getDoctor(sid);
                    while(r.next()){
                        String id =r.getString("id");
                        user data = new user();
                        ResultSet rr = data.udata(id);
                        if(rr.next()){
                            
                %>
                <h3>Dr. <%=rr.getString("name")%>     <a href='patients/channel.jsp?doc=<%=rr.getString("id")%>'>Channel Doctor</a></h3>
                
                <%
                            }

                        out.println("<br/>");
                        out.println("<br/>");

                    }




                }
            } catch (Exception ex) {
                System.out.println(ex);
            } 
        %>
    </body>
</html>
