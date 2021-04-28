<%@page import="Model.dbCon"%>
<%@page import="java.sql.*" %>

<%
dbCon con = new dbCon();
        String id=request.getParameter("id");

        PreparedStatement pst;
        pst = con.createConnection().prepareStatement("delete from prescription where id = ?");
       
        pst.setString(1,id);
        try{
            pst.executeUpdate();
            response.sendRedirect("index.jsp");  
        }catch(Exception e){
            System.out.println(e);
        }
 
%>
          <script>
              alert("Record Deleted");
    
          </script>
