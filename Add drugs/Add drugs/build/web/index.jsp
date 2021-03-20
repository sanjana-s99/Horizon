

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<%
    
   if(request.getParameter("submit")!=null)
   {
       String doctorsname = request.getParameter("dname");
       String patientsname = request.getParameter("pname");
       String name = request.getParameter("sname");
       String price =request.getParameter("price");
       String date = request.getParameter("date");
       
       
       Connection con;
       PreparedStatement pst;
       ResultSet rs;
       
       Class.forName("com.mysql.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost/pharmacy","root","");
       pst=con.prepareStatement("insert into records(doctorsname,patientsname,drugsname,price,date)values(?,?,?,?,?)");
       pst.setString(1, doctorsname);
       pst.setString(2, patientsname);
       pst.setString(3, name);
       pst.setString(4, price);
       pst.setString(5, date);
       pst.executeUpdate();
       
       
       %>
       
       <script>
           alert("Record Adddedddd");
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
        <h1>Add Drugs</h1>
        </br>
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#">
                    
                    
                    <div alight="left" >
                        <label  class="form-label">Doctors Name</label>
                        <input type="text" class="form-control" placeholder="Doctors Name" name="dname" id="dname" required >                    
                        
                        </div>
                    
                    <div alight="left" >
                        <label  class="form-label">Patients Name</label>
                        <input type="text" class="form-control" placeholder="Patients Name" name="pname" id="pname" required >                    
                        
                        </div>
                    
                    
                    <div alight="left" >
                        <label  class="form-label">Drugs Name</label>
                        <input type="text" class="form-control" placeholder="Drugs Name" name="sname" id="sname" required >                    
                        
                        </div>
                    
                     <div alight="left" >
                        <label  class="form-label">Price</label>
                        <input type="text" class="form-control" placeholder="Price" name="price" id="price" required >                    
                        
                        </div>  
                     <div alight="left" >
                        <label  class="form-label">Date</label>
                        <input type="text" class="form-control" placeholder="Date" name="date" id="date" required >   
                        
                        </br>
                        
                        </div>
                     <div alight="right" >
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">             
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">             
                        </div>
                    
                    
                    
                 
                </form>
                
            </div>
            
            <div class="col-sm-8">
                <div class="panel-body">
                <table id="tbl-docter" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Doctor Name</th>
                            <th>Patients Name</th>
                            <th>Drugs Name</th>
                            <th>Price</th>
                            <th>Date</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        
                        </tr>
                        
                        <%
                        
                         Connection con;
                         PreparedStatement pst;
                         ResultSet rs;
       
                         Class.forName("com.mysql.jdbc.Driver");
                         con=DriverManager.getConnection("jdbc:mysql://localhost/pharmacy","root","");
                         
                           String query ="select * from records";
                           Statement st =con.createStatement();
                           
                            rs =st.executeQuery( query);
                             while(rs.next())
                             {
                             
                                String id= rs.getString("id");
                             
                        


                        %>
                        
                        
                        <tr>
                            <td><%=rs.getString("doctorsname")%></td>
                            <td><%=rs.getString("patientsname")%></td>
                            <td><%=rs.getString("drugsname")%></td>
                            <td><%=rs.getString("price")%></td>
                            <td><%=rs.getString("date")%></td>
                            <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                            <td><a href="Delete.jsp?id=<%=id%>">Delete</a></td>
                        </tr>
                        <%
                          
                          }
                        
                        %>
                           
                        
                        
                        
                        
                </table>
                
            </div>
            
            
        </div>
    </body>
</html>
