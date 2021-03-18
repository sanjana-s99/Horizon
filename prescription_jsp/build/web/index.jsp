<%-- 
    Document   : index
    Created on : Mar 9, 2021, 1:23:30 PM
    Author     : Movini
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if(request.getParameter("submit")!=null)
    {
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
        pst = con.prepareStatement("insert into prescription(doc_id,pid,pname,drug_name,price,tdate)values(?,?,?,?,?,?)");
        pst.setInt(1, doc_id);
        pst.setInt(2, pid);
        pst.setString(3, pname);
        pst.setString(4,drug_name );
        pst.setDouble(5, price );
        pst.setString(6, tdate);
        pst.executeUpdate();
        
        
 
%>
          <script>
              alert("Record Added");
    
          </script>
    
    
    
    
<% 
   
  }

%>










<!DOCTYPE html>
<html >
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
        
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.2/angular.js"></script>
        <script>
        var TDataCtrl = function ($scope) {
           
            $scope.tdata = [{'id': '0'}];
            $scope.addRow = function(){
                $scope.tdata[$scope.tdata.length]={'id':$scope.tdata.length};
            };
            $scope.removeRow = function(){
                $scope.tdata.pop();
            };
        };

        </script>
        
    </head>
    <body data-ng-app>
        <h3>Prescription</h3>
        <br>
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="post" action="#">
                    
                    <div alight="left">
                        <label class="form-label">Doctor ID</label>
                        <input type="text" class="form-control" placeholder="" name="doc_id" id="doc_id" required > 
                    </div>
                    
            
                    <div alight="left">
                        <label class="form-label">Patient ID</label>
                        <input type="text" class="form-control" placeholder="" name="pid" id="pid" required > 
                    </div>
                    
                       
                    <div alight="left">
                        <label  class="form-label">Patient name</label>
                        <input type="text" class="form-control" placeholder="" name="pname" id="pname" required > 
                    </div>
                    
                  <!--  <div class="row">
                   <div class="form-group col-md-6">
                      <label id="lblRange" class="form-label">Drug name</label>
                        <input type="text" class="form-control" placeholder="" name="drug_name" id="drug_name" required aria-labelledby='lblRange'> 
                        <input type="text" class="form-control" placeholder="" name="drug_name" id="drug_name[]" required aria-labelledby='lblRange'> 
                    </div> 
                                       
                    <div  class="form-group col-md-6">
                        <label id="x" class="form-label">Price</label>
                        <input type="text" class="form-control" placeholder="" name="price" id="price" required required aria-labelledby='x' > 
                        <input type="text" class="form-control" placeholder="" name="price" id="price[]" required required aria-labelledby='x' > 
                    </div>
                    </div> -->
                  
                  <div data-ng-controller="TDataCtrl">
                    <table >
                        <tbody data-ng-repeat="thisrow in tdata">
                        <tr>

                            <td>Drug name</td>
                            <td><input type="text" class="form-control" placeholder="" name="drug_name" id="drug_name[]" required aria-labelledby='lblRange'> </td>
                            <td>Price</td>
                            <td><input type="text" class="form-control" placeholder="" name="price" id="price[]" required required aria-labelledby='x' > </td>

                        </tr>
                        </tbody>
                    </table>
                    <input type="button" value="Add" data-ng-click="addRow()"/>
                    <input type="button" value="Remove" data-ng-click="removeRow()"/>
                    </div>
                  

                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                    
                       
                    <div alight="left">
                        <label class="form-label">Date & Time</label>
                        <input type="datetime-local" class="form-control" placeholder="" name="tdate" id="tdate" required > 
                    </div><br>
                    
                    
                  
                    <div alight="right">
                        <input type="submit" value="submit" name="submit" class="btn btn-info" >
                        <input type="reset" value="reset" name="reset" class="btn btn-warning" >
                         
                    </div>
                    
                </form>
                
            
            
            </div>
            
            
            <div class="col-sm-8">
                
                <div class="panel-body">
                    <table id="tbl-prescription" class="table table-responsive table-bordered" cellpadding="0" width="50%">
                        <thead>
                            <tr id="mac">
                                <th >Doctor ID</th>
                                <th>Patient ID</th>
                                <th>Patient name</th>
                                <th>Drug name </th>
                                <th>price</th>
                                <th>Date & Time</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                       </thead>    
                     <% 
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
        
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/prescription","root","");
                            
                            String query ="select * from prescription";
                            Statement st= con.createStatement();
                            rs=st.executeQuery(query);
                            
                           /** String strQuery = "SELECT SUM(price) FROM prescription";
                            ResultSet rss = st.executeQuery(strQuery);
                            Double t_price=null;

                           while(rs.next()){
                              while(rss.next()){
                               }

                            rss.getDouble(t_price);*/
                            
                            while(rs.next()){
                                String id=rs.getString("id");
                                
                               
                               
                           %>
                               
                            
                         
                            <tr>
                              
                                <td><%=rs.getInt("doc_id")%></td>
                                <td><%=rs.getInt("pid")%></td>
                                <td><%=rs.getString("pname")%></td>
                                <td><%=rs.getString("drug_name")%></td> 
                                <td><%=rs.getDouble("price")%></td>
                                
                                <td><%=rs.getString("tdate")%></td>
                                <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                            </tr>
                            
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><%=rs.getString("drug_name")%></td> 
                                <td><%=rs.getDouble("price")%></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                               
                            </tr>
                            
                             <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><%=rs.getString("drug_name")%></td> 
                                <td><%=rs.getDouble("price")%></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                               
                            </tr>
                            
   
                            
                            
                                                     
                            
                            
                            <% }%>
                        
                        
                  
                        
                    </table> 
                           
                    
                    
                </div>
                
                            <div>
                                 <form method="get" action="doc">
                                 <lable>Prescription list</lable>
                                 <input type="submit" value="By Doctor" name="submit" >
                                
                                
                            </div>
                            
                            
                                   
                                
                                
                                
                                
                                
                                
                                
                                
                                
                         
                
                
                
            </div>
            
            
            
        </div>
        
        
    </body>
</html>
