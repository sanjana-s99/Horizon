
<%@page import="java.sql.*"%> 

<%
    
   
       String idx = request.getParameter("id");
      
       
       
       Connection con;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost/horizon","root","");
       pst=con.prepareStatement("delete from drugs where id = ?");
      
       pst.setString(1,idx);
       pst.executeUpdate();
       
       
       %>
       
       <script>
           alert("Record Deleted");
       </script>
       
       
       
       
     