<%-- 
    Document   : newjsp
    Created on : Apr 27, 2021, 9:17:01 PM
    Author     : Movini
--%>

<%@page import="Model.dbCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

        String idm=request.getParameter("id");        
        
        dbCon con = new dbCon();
        PreparedStatement pstx;
        
        pstx = con.createConnection().prepareStatement("delete from drprescription where id = ?");
       
        pstx.setString(1,idm);
        try{
            pstx.executeUpdate();
            response.sendRedirect("index.jsp");  
        }catch(Exception e){
            System.out.println(e);
        }




        
        
        
        
        
 
%>
