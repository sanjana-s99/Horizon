<%-- 
    Document   : adduser
    Created on : Mar 8, 2021, 8:57:56 PM
    Author     : SHATTER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%
    session.setMaxInactiveInterval(3000);
    String type = (String)session.getAttribute("type");
    if(type != null){
        if(!type.equals("W")){
            response.sendRedirect("../index.jsp");
        }
    }else{
        response.sendRedirect("../login.html");
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Admin Panel</h1>
        <div>
             <form method ="post" action="../adduser">
                 <h5>Add User</h5>
                <hr>

                <label for="name"><b>Name</b></label>
                <input type="text" placeholder="Enter Name" name="name" id="name" required>

                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" id="email" required>
                
                <label for="tp"><b>telephone</b></label>
                <input type="text" placeholder="Enter number" name="tp" id="tp" required>
                
                <label for="add"><b>address</b></label>
                <input type="text" placeholder="Enter address" name="add" id="add" required>
                
                <label for="nic"><b>nic</b></label>
                <input type="text" placeholder="Enter nic" name="nic" id="nic" required>
                
                <label for="type"><b>Account Type</b></label>
                <select name="type">
                    <option value="S">Staff</option>
                    <option value="D">Doctor</option>
                </select>
                <label for="type"><b>Select Specilized Area</b></label>
                <select name="spe">

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT id, name FROM specelist ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select>

                <hr>
                <button type="submit">Add User</button>
              </form>
            <hr/>
            <h1>Add New Ambulance</h1>
            <form action="../add_amb" method="post">
            Vehicle number : <input type="text" name="number">
            <input type="submit" value="add">
        </form>
            <hr/>
            <h1>Lab Services</h1>
            <div>
                <h6>Pirce Details</h6>
                <form>
                    
                    <table border='1'>
                        <tr>
                            <td>ID</td>
                            <td>Appointment Type</td>
                            <td>Price</td>
                            <td>Action</td>
                        </tr>
                        <%
                     try{
                               
                              dbCon con = new dbCon();
                              String query="select * from lab";
                              Statement st=con. createConnection().createStatement();
                              ResultSet rs=st.executeQuery(query);
                              
                              while(rs.next()){
                                  String id=rs.getString("id");
                              

                            %>
                        <tr>
                            <td><%=rs.getString("id") %></td>
                            <td><%=rs.getString("Atype") %></td>
                            <td><%=rs.getString("price") %></td>
                            <td><a href="Update?id=<%=id%>">Update</a></td>
                        </tr>
                                                    <%
                               }  
}
catch(Exception r){
System.out.println(r.getMessage());
}
                            %>
                    </table>
                         
                </form>
                    <br>
                    <form action="" method="post">
                        Service : <input type="text" name="type" >
                        Price : <input type="text" name="price">
                        <input type="submit" value="add">
                    </form>
            </div>
        
        </div>
    </body>
</html>
