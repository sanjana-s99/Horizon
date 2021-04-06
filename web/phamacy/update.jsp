<%-- 
    Document   : update
    Created on : Mar 11, 2021, 11:24:04 PM
    Author     : Movini
--%>

<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    dbCon con = new dbCon();
    if(request.getParameter("submit")!=null)
    
    {
        String id=request.getParameter("id");
        String doc_name=request.getParameter("doc_name");
        String pname=request.getParameter("pname");
        String drug_name=request.getParameter("drug_name");
      
        String totalprice=request.getParameter("totalprice");
        
        String  test =null;
        
        
        PreparedStatement pst;
        
String[] a = request.getParameterValues("drug_name");
if(a!=null)
{
for(int i=0;i<a.length;i++){
//out.println(a[i]);

}}


if(a.length == 1)
    
{
    
  test  = (a[0]+","+a[1]);   
    
}
if(a.length == 2){
    
     test  = (a[0]+","+a[1]);   
 
    
}

if(a.length == 3){
    
     test  = (a[0]+","+a[1]+","+a[2]);  
    
}

if(a.length == 4){
    
     test  = (a[0]+","+a[1]+","+a[2]+","+a[3]);  
    
}

pst = con.createConnection().prepareStatement("update prescription set doc_name = ?,pname = ?,drug_name = ?,totalprice = ? where id = ?");
        pst.setString(1, doc_name);
       
        pst.setString(2, pname);
        pst.setString(3,test);
       
        pst.setString(4,totalprice);
        pst.setString(5,id);
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
    <body>
        <h3>Update</h3>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="post" action="#">
                    
                    <% 
        PreparedStatement pst;
        ResultSet rs;
        
            
          String id = request.getParameter("id");
          pst= con.createConnection().prepareStatement("select * from prescription where id =?");
          pst.setString(1,id);
          rs=pst.executeQuery();
          
            while(rs.next()){
    
    

                    %>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <div alight="left">
                        
                       <label class="form-label">Doctor name</label>
                       <select class="form-control" aria-label="Default select example" name="doc_name" value="<%=rs.getString("doc_name")%>" >  
                        
                         <%
                        
                         ResultSet rss;
       
                         
                           String query1 ="select * from users WHERE type = 'D'";
                           Statement st1 =con.createConnection().createStatement();
                           
                            rss =st1.executeQuery( query1);
                             while(rss.next())
                             {
                             

                                
                            
                            String name= rss.getString("name");
                        


                        %>
                         <tr>
                         <option selected  value="<%=name%>"><%=name%></option>
                         
                          
                        </tr>
                        <%
                          
                          }
                        
                        %> 
                        
                        
                        
                        
                        
                       </select>  
                        
                        
                        
                    </div>
                    
            
                    <div alight="left">
                        <label class="form-label">Patient name</label>
                        <select class="form-control" aria-label="Default select example" name="pname" value="<%=rs.getString("pname")%>"> 
                            
                            
                         <%
                        
                         ResultSet rss1;
                         
                           String query2 ="select * from users WHERE type = 'P'";
                           Statement st2 =con.createConnection().createStatement();
                           
                            rss1 =st2.executeQuery( query2);
                             while(rss1.next())
                             {
                             

                                
                            
                            String name= rss1.getString("name");
                        


                        %>
                        
                         <option selected  value="<%=name%>"><%=name%></option>
                          
                         
                       
                        <%
                          
                          }
                        
                        %> 
                         </select>
                        
                        
                    </div>
                    
                       
                   
                    
                  
                  <div data-ng-controller="TDataCtrl">
                    <table >
                        <tbody data-ng-repeat="thisrow in tdata">
                        <tr>

                            <td>Drug name</td>
                            
                            
                  <td><select class="form-control"  name="drug_name"   size="" multiple="multiple" tabindex="1" value="<%=rs.getString("drug_name")%>"> 
                         <%
                        
                         ResultSet rss11;

                         
                           String query21 ="select * from drugs";
                           Statement st21 =con.createConnection().createStatement();
                           
                            rss11 =st21.executeQuery( query21);
                             while(rss11.next())
                             {
                             

                                
                            
                            String drugsname= rss11.getString("drugsname");
                            String price= rss11.getString("price");
                        


                        %>
                        
                         <option selected  value="<%=drugsname%> /-<%=price%>"><%=drugsname%> </option>
                         
                         
                             
                              
                          
                         
                       
                        <%
                          
                          }
                        
                        %> 
                         </select></td>
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        </tr>
                        </tbody>
                    </table>
                    
                    </div>
                  

                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  <div alight="left">
                        <label class="form-label">Total price</label>
                        <input type="text" class="form-control" name="totalprice" value="<%=rs.getString("totalprice")%>" > 
                    </div><br>
                  
                  
                  
                    <% }%>
                  
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
