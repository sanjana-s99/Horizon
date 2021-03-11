<%-- 
    Document   : update
    Created on : Mar 11, 2021, 11:24:04 PM
    Author     : Movini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if(request.getParameter("submit")!=null)
    {
        
        String id=request.getParameter("id");
        int doc_id=Integer.parseInt(request.getParameter("doc_id"));
        int pid=Integer.parseInt(request.getParameter("pid"));
        String pname=request.getParameter("pname");
        String drug_name=request.getParameter("drug_name");
        double price=Double.parseDouble(request.getParameter("price"));
        String tdate=request.getParameter("tdate");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
        pst = con.prepareStatement("update prescription set doc_id= ?,pid =?,pname =?,drug_name= ?,price= ?,tdate =? where id=?");
        pst.setInt(1, doc_id);
        pst.setInt(2, pid);
        pst.setString(3, pname);
        pst.setString(4,drug_name );
        pst.setDouble(5, price );
        pst.setString(6, tdate );
        pst.setString(7, id );
        pst.executeUpdate();
        
        
 
%>
          <script>
              alert("Record Added");
    
          </script>
    
    
    
    
<% 
   
  }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap-grid.rtl.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap-grid.rtl.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap-utilities.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap-utilities.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap-utilities.rtl.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap-utilities.rtl.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.rtl.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.rtl.min.css" rel="stylesheet" type="text/css"/>
        
        
    </head>
    <body>
        <h3>Update</h3>
        
        
        <div class="row">
           <div class="col-sm-4">
                <form  method="post" action="#">
                    
                    <%
                        
                        
                       
                       Connection con;
                       PreparedStatement pst;
                       ResultSet rs;
        
                       Class.forName("com.mysql.jdbc.Driver");
                       con = DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
                       
                       String id=request.getParameter("id");
                       pst=con.prepareStatement("select * from prescription where id= ?");
                       
                       pst.setString(1, id);
                       rs=pst.executeQuery();
                       
        
                       
                       while(rs.next()){

                       
                    
                    %>
                    
                    
                    
                    
                    <div alight="left">
                        <label class="form-label">Doctor ID</label>
                        <input type="text" class="form-control" placeholder="" value="<%=rs.getInt("doc_id")%>" name="doc_id" id="doc_id" required > 
                    </div>
                    
            
                    <div alight="left">
                        <label class="form-label">Patient ID</label>
                        <input type="text" class="form-control" placeholder="" value="<%=rs.getInt("pid")%>" name="pid" id="pid" required > 
                    </div>
                    
                       
                    <div alight="left">
                        <label class="form-label">Patient name</label>
                        <input type="text" class="form-control" placeholder="" value="<%=rs.getString("pname")%>" name="pname" id="pname" required > 
                    </div>
                    
            
                    <div alight="left">
                        <label class="form-label">Drug name</label>
                        <input type="text" class="form-control" placeholder="" value="<%=rs.getString("drug_name")%>" name="drug_name" id="drug_name" required > 
                    </div>
                    
                     
                    <div alight="left">
                        <label class="form-label">Price</label>
                        <input type="text" class="form-control" placeholder="" value="<%=rs.getDouble("price")%>" name="price" id="price" required > 
                    </div>
                  
                    
                       
                    <div alight="left">
                        <label class="form-label">Date</label>
                        <input type="text" class="form-control" placeholder="" value="<%=rs.getString("tdate")%>" name="tdate"  id="tdate" required > 
                    </div>
                    
                   <%} %>
                    
                    
                    <br>
                    
                    
                  
                    <div alight="right">
                        <input type="submit" value="submit" name="submit" class="btn btn-info" >
                        <input type="reset" value="reset" name="reset" class="btn btn-warning" >
                         
                    </div>
                    
                    <div align="right">
                        
                        <p><a href="index.jsp"> Click Back</a></p>
                    </div>
                    
                    
                </form>
             </div>
            
            
            
        </div>
    </body>
</html>
