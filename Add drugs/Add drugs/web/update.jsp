

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 

<%
    
   if(request.getParameter("submit")!=null)
   {
       String id = request.getParameter("id");
       String doctorsname = request.getParameter("dname");
       String  patientsname= request.getParameter("pname");
       String name = request.getParameter("sname");
       String price =request.getParameter("price");
       String date = request.getParameter("date");
       
       
       Connection con;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost/pharmacy","root","");
       pst=con.prepareStatement("update records set doctorsname=?,patientsname=?, drugsname= ?,price= ?,date= ? where id = ?");
       pst.setString(1,doctorsname );
       pst.setString(2, patientsname);
       pst.setString(3, name);
       pst.setString(4, price);
       pst.setString(5, date);
       pst.setString(6, id);
       pst.executeUpdate();
       
       
       %>
       
       <script>
           alert("Record Updated");
       </script>
       
       
       
       
       <%
   
   
   
   
   }



%>

















<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Drugs Update</h1>
        
        
        <div class="row">
            
            <div class="col-sm-4">
                <form  method="POST" action="#">
                    
                    <%
                    
                     Connection con;
                     PreparedStatement pst;
                     ResultSet rs;
       
                     Class.forName("com.mysql.jdbc.Driver");
                     con=DriverManager.getConnection("jdbc:mysql://localhost/pharmacy","root","");
                     

                     String id= request.getParameter("id");
                     
                   pst= con.prepareStatement("select * from records where id = ?");
                   pst.setString(1,id );
                   rs= pst.executeQuery();
                   
                    while(rs.next())
                    {
                      
                    
                    
                    %>
                    
                    
                     <div alight="left" >
                        <label  class="form-label">Doctors Name</label>
                        <input type="text" class="form-control" placeholder="Doctors Name" value="<%= rs.getString("doctorsname")%>" name="dname" id="dname" required >                    
                        
                        </div>
                        
                        
                         <div alight="left" >
                        <label  class="form-label">Patients Name</label>
                        <input type="text" class="form-control" placeholder="Patients Name" value="<%= rs.getString("patientsname")%>" name="pname" id="pname" required >                    
                        
                        </div>
                    
                    
                    <div alight="left" >
                        <label  class="form-label">Drugs Name</label>
                        <input type="text" class="form-control" placeholder="Drugs Name" value="<%= rs.getString("drugsname")%>" name="sname" id="sname" required >                    
                        
                        </div>
                    
                     <div alight="left" >
                        <label  class="form-label">Price</label>
                        <input type="text" class="form-control" placeholder="Price" value="<%= rs.getString("price")%>" name="price" id="price" required >                    
                        
                        </div>  
                     <div alight="left" >
                        <label  class="form-label">Date</label>
                        <input type="text" class="form-control" placeholder="Date" value="<%= rs.getString("date")%>" name="date" id="date" required >   
                        
                        <% } %>
                        
                        </br>
                        
                        </div>
                     <div alight="right" >
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">             
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">             
                        </div>
                        
                        <div align="right">
                            
                            <p><a href="index.jsp">Click Back</a></p>
                            
                        </div>
                    
                    
                    
                 
                </form>
                
            </div>
            
            
            
        </div>
        
        
        
        
    </body>
</html>
