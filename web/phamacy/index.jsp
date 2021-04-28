<%-- 
    Document   : index
    Created on : Mar 9, 2021, 1:23:30 PM
    Author     : Movini
--%>

<%@page import="Model.user"%>
<%@page import="Model.dbCon"%>
<%@page import="java.lang.String"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
    if(request.getParameter("submit")!=null)
    {
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














pst = con.createConnection().prepareStatement("insert into prescription(doc_name,pname,drug_name,totalprice)values(?,?,?,?)");
        pst.setString(1, doc_name);
       
        pst.setString(2, pname);
        pst.setString(3,test);
      
        pst.setString(4,totalprice);
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
        <a href="main.jsp">Add Drugs</a>
        <br/><br/>
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="post" action="#">
                    
                    <div alight="left">
                        
                         <label class="form-label">Doctor name</label>
                       <select class="form-control" aria-label="Default select example" name="doc_name">  
                        
                         <%
                         ResultSet rss;
       
                         
                           String query1 ="select * from users where type = 'D'";
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
                
                          
                         <select class="form-control" aria-label="Default select example" name="pname"> 
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
                            
                            
                  <td><select class="form-control"  name="drug_name"   size="" multiple="multiple" tabindex="1"> 
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
                        <input type="text" class="form-control" name="totalprice" > 
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
                                <th >Doctor name</th>
                                
                                <th>Patient name</th>
                                <th>Drug name </th>
                                 <th>price </th>
                                
                                <th>Date & Time</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                <th>Send Email</th>
                            </tr>
                       </thead>    
                     <% 
                            ResultSet rs;

                            
                            String query ="select * from prescription";
                            Statement st= con.createConnection().createStatement();
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
                               String username =rs.getString("pname");
                               String doctorname =rs.getString("doc_name");
                               String drugs =rs.getString("drug_name");
                               String totalprice =rs.getString("totalprice");
                               String date=rs.getString("tdate");
                               
                               
                           %>
                               
                            
                         
                            <tr>
                              
                                <td><%=rs.getString("doc_name")%></td>
                                
                                <td><%=rs.getString("pname")%></td>
                                <td><%=rs.getString("drug_name")%></td> 
                               
                                  <td><%=rs.getString("totalprice")%></td>
                                <td><%=rs.getString("tdate")%></td>
                                <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                                <td><a href="email.jsp?id=<%=id%>&username=<%=username%>&doctorname=<%=doctorname%>&drugs=<%=drugs%>&date=<%=date%>&price=<%=totalprice%> ">Email</a></td>
                                
                            </tr>                     
                            
                            <% }%>                     
                    </table>                     
                </div>
                
                <div>
                     <%
                        
                            ResultSet rssx;

                            String queryx ="select * from drprescription";
                            Statement stx = con.createConnection().createStatement();

                               rssx =stx.executeQuery( queryx);
                                while(rssx.next()){                              
                               String pres= rssx.getString("pres");
                               String id=rssx.getString("id");
                               String did=rssx.getString("did");
                               String pid=rssx.getString("pid");
                               String cid=rssx.getString("cno");
                               
                              user udata = new user();
                              String doc = null, pat = null;
                              try{
                                ResultSet rsd = udata.udata(did);
                                rsd.next();
                                doc = rsd.getString("name");
                                ResultSet rsp = udata.udata(pid);
                                rsp.next();
                                pat = rsp.getString("name");
                                
                              }catch(Exception e){
                                  
                              }


                        %>
                        <form>
                        <p> Doctor Prescription <br>
                          Number : <%=cid%> |
                          Doctor : <%=doc%> |
                          Patient :  <%=pat%> </p>
                        <textarea  rows="4" readonly>
                                  <%= pres %>
                        </textarea>
                        <a href="delete_prescrip.jsp?id=<%=id%>">Delete</a>
                        </form>
                                  
                            <%    }  %>                       
                </div>         
            </div>     
        </div> 
    </body>
</html>
