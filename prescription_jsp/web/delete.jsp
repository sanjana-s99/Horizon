<%@page import="java.sql.*" %>

<%

        String id=request.getParameter("id");

        
        String  test =null;
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        
 
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
        















pst = con.prepareStatement("delete from prescription where id = ?");
       
        pst.setString(1,id);
        pst.executeUpdate();




        
        
        
        
        
 
%>
          <script>
              alert("Record Deleted");
    
          </script>
    
    
    

    
    
    

