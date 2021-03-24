

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 

<%
    
   if(request.getParameter("submit")!=null)
   {
       String id = request.getParameter("id");
       
       
       String drugsname = request.getParameter("dname");
       String price = request.getParameter("price");
       String date = request.getParameter("date");	
       String expdate = request.getParameter("expdate");	
       String brands = request.getParameter("brands");
       String country = request.getParameter("country");
       String Mdate  = request.getParameter("Mdate");
      
       
       Connection con;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost/pharmacy","root","");
       pst=con.prepareStatement("update records set drugsname= ?,price= ?, date= ?,expdate= ?, brands= ?,country= ?,Mdate= ? where id = ?");
       pst.setString(8, id);
       pst.setString(1,drugsname );
       pst.setString(2, price);
       pst.setString(3, date);
       pst.setString(4,expdate );
       pst.setString(5,	brands );
       pst.setString(6,	country );
       pst.setString(7,	Mdate );
       
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
                        <label  class="form-label">Drugs Name</label>
                        <input type="text" class="form-control" placeholder="Drugs Name" value="<%= rs.getString("drugsname")%>" name="dname" id="dname" required >                    
                        
                        </div>
                        
                        
                         <div alight="left" >
                        <label  class="form-label">Price</label>
                        <input type="text" class="form-control" placeholder="Price" value="<%= rs.getString("price")%>" name="price" id="price" required >                    
                        
                        </div>
                    
                    
                    <div alight="left" >
                        <label  class="form-label">Date</label>
                        <input type="text" class="form-control" placeholder="Date" value="<%= rs.getString("date")%>" name="date" id="date" required >                    
                        
                        </div>
                    
                     <div alight="left" >
                        <label  class="form-label">ExpireDate</label>
                        <input type="text" class="form-control" placeholder="expdate" value="<%= rs.getString("expdate")%>" name="expdate" id="expdate" required >                    
                        
                        </div>  
                     
                        
                        <div alight="left" >
                        <label  class="form-label">Brands</label>
                        <input type="text" class="form-control" placeholder="brands" value="<%= rs.getString("brands")%>" name="brands" id="brands" required >                    
                        
                        </div>
                        
                        <div alight="left" >
                        <label  class="form-label">Country</label>
                        <input type="text" class="form-control" placeholder="country" value="<%= rs.getString("country")%>" name="country" id="country" required >                    
                        
                        </div>
                        
                        <div alight="left" >
                        <label  class="form-label">ManufactureDate</label>
                        <input type="text" class="form-control" placeholder="Mdate" value="<%= rs.getString("Mdate")%>" name="Mdate" id="Mdate" required >                    
                        
                       </div>
                        
                        
                        
                        <% } %>
                        
                        </br>
                        
                        </div>
        </div>
                     <div alight="right" >
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">             
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">  
                           <a href="index.jsp" id="clickback"   class="btn btn-info">Click back </a>  
                        </div>
                        
                        <div align="right">
                            
                            <p><a href="index.jsp">Click Back</a></p>
                            
                        </div>
                    
                    
                    
                 
                </form>
                
            </div>
            
            
            
        </div>
        
        
        
        
    </body>
</html>
