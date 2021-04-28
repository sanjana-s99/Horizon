<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<% 
    session.setMaxInactiveInterval(3000);
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("S") && !type.equals("W")){
            response.sendRedirect("../index.jsp");
        }
    }else{
        response.sendRedirect("../login.jsp");
    }
%>
<%
dbCon con = new dbCon();
    if (request.getParameter("submit") != null) {

        String expdate = request.getParameter("expdate");
        String brands = request.getParameter("brands");
        String country = request.getParameter("country");
        String Mdate = request.getParameter("Mdate");
        
        
        
        String name = request.getParameter("sname");
        String price = request.getParameter("price");

        //String pID = request.getParameter("pID");
        PreparedStatement pst;
        pst = con.createConnection().prepareStatement("insert into drugs(drugsname,price,expdate,brands,Mdate,country)values(?,?,?,?,?,?)");

        pst.setString(1, name);
        pst.setString(2, price);
         pst.setString(3, expdate);
         pst.setString(4, brands);
          pst.setString(5, Mdate);
          pst.setString(6, country);
         
         

        pst.executeUpdate();


%>

<script>
    alert("Record Adddedddd");
</script>




<%           }


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


                        <label  class="form-label">Drugs Name</label>
                        <input type="text" class="form-control" placeholder="Drugs Name" name="sname"  required >                    

                    </div>

                    <div alight="left" >
                        <label  class="form-label">Price</label>
                        <input type="text" class="form-control" placeholder="Price" name="price"  required >                    

                    </div>     
                            
                            <div alight="left" >
                                <label  class="form-label">ExpireDate</label>
                        <input type="datetime-local" class="form-control" placeholder="expdate" name="expdate"  required >   

                        </br>
                        
                        
                        
                        
                        
                        
                      
                    </div> 
                            
                            
                                 <div alight="left" >
                                     <label  class="form-label">Brands</label>
                        <input type="text" class="form-control" placeholder="brands" name="brands"  required >   

                        </br>
                        
                        
                        
                        
                        
                        
                      
                    </div> 
                            
                            
                                 <div alight="left" >
                        <label  class="form-label">Country </label>
                        <input type="text" class="form-control" placeholder="country" name="country"  required >   

                        </br>
                        
                        
                        
                        
                        
                        
                      
                    </div> 
                            
                                <div alight="left" >
                        <label  class="form-label">ManufactureDate </label>
                        <input type="datetime-local" class="form-control" placeholder="Mdate" name="Mdate"  required >   

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
                            

                                <th>ID</th>
                                <th>Drugs Name</th>
                                 <th>Expdate</th>
                                  <th>Brands</th>
                                  <th>Country</th>
                                  <th>Mdate</th>
                                 
                                  
                                  
                                  
                                <th>Price</th>
                                <th>Date</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                

                            </tr>

                            <%   
                                
                              
                                ResultSet rs;

                                
                                String query = "select * from drugs";
                                Statement st = con.createConnection().createStatement();

                                rs = st.executeQuery(query);
                                while (rs.next()) {

                                    String id = rs.getString("id");


                            %>


                            <tr>
                                <td><%=rs.getString("id")%></td>
                          

                                
                                <td><%=rs.getString("drugsname")%></td>
                                <td><%=rs.getString("Expdate")%></td>
                                <td><%=rs.getString("Brands")%></td>
                                <td><%=rs.getString("Country")%></td>
                                <td><%=rs.getString("Mdate")%></td>
                                <td><%=rs.getString("price")%></td>
                                <td><%=rs.getString("date")%></td>
                                <td><a href="upd.jsp?id=<%=id%>">Edit</a></td>
                                <td><a href="dele.jsp?id=<%=id%>">Delete</a></td>
                                
                            </tr>
                            <%

                                }

                            %>





                    </table>

                </div>


            </div>
        </div>
    </body>
</html>
