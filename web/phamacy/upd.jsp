

<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 

<%
    dbCon con = new dbCon();
    
   if(request.getParameter("submit")!=null)
   {
       String idx = request.getParameter("id");
       
       
       String drugsname = request.getParameter("dname");
       String price = request.getParameter("price");
       String expdate = request.getParameter("expdate");	
       String brands = request.getParameter("brands");
       String country = request.getParameter("country");
       String Mdate  = request.getParameter("Mdate");
      
       
       PreparedStatement pst;
       pst=con.createConnection().prepareStatement("update drugs set drugsname= ?,price= ?,expdate= ?, brands= ?,country= ?,Mdate= ? where id = ?");
       pst.setString(7, idx);
       pst.setString(1,drugsname );
       pst.setString(2, price);
       pst.setString(3,expdate );
       pst.setString(4,	brands );
       pst.setString(5,	country );
       pst.setString(6,	Mdate );
       
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
                     PreparedStatement pst;
                     ResultSet rs;
                     

                     String idx= request.getParameter("id");
                     
                   pst= con.createConnection().prepareStatement("select * from drugs where id = ?");
                   pst.setString(1,idx );
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
                         
                        </div>
                        
                        <div align="right">
                            
                            <p><a href="main.jsp">Click Back</a></p>
                            
                        </div>
                    
                    
                    
                 
                </form>
                
            </div>
            
            
            
        </div>
        
        
        
        
    </body>
</html>
