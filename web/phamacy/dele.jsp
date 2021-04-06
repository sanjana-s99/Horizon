
<%@page import="Model.dbCon"%>
<%@page import="java.sql.*"%> 

<%
    dbCon con = new dbCon();
   
       String idx = request.getParameter("id");
      
       PreparedStatement pst;

       pst=con.createConnection().prepareStatement("delete from drugs where id = ?");
      
       pst.setString(1,idx);
       pst.executeUpdate();
       
       
       %>
       
       <script>
           alert("Record Deleted");
       </script>
       
       
       
       
     