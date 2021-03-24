<%@page import="Model.dbCon"%>
<%@page import="java.sql.*" %>
<%
    
    
   
        String id=request.getParameter("id");
        
        dbCon con = new dbCon();
        PreparedStatement pst;
        
        pst=con.createConnection().prepareStatement("DELETE FROM lab_apo where id=?");
        pst.setString(1, id);
       
        pst.executeUpdate();
        
        %>
        
        <script>
            alert("Record Deleted");
            
        </script>
        <%
            response.sendRedirect("admin.jsp"); 
            
%>
        
