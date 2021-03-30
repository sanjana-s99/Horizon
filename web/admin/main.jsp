<%-- 
    Document   : adduser
    Created on : Mar 8, 2021, 8:57:56 PM
    Author     : SHATTER
--%>

<%@page import="Model.user"%>
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
        response.sendRedirect("../login.jsp");
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
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("error")){
        %>
                    <h1>Something Went Wrong!!</h1>
        <%
                }else if(stat.equals("addedsuccess")){
        %>
                    <h1>Successfully Added User!!</h1>
        <%
                }else if(stat.equals("ue")){
        %>
                    <h1>User Exists PLease Recheck!!</h1>
        <%
                }else if(stat.equals("ambsuc")){
        %>
                    <h1>ambulance Added Successfully!!</h1>
        <%
                }
            }
        %>
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
                         

                    <br>
                    <form action="" method="post">
                        Service : <input type="text" name="type" >
                        Price : <input type="text" name="price">
                        <input type="submit" value="add">
                    </form>
            </div>
                    <div>
                    <hr/>
                    <h1>Channelings</h1>
        <table>
                        <tr>
                            <td>Patient</td>
                            <td>Doctor</td>
                            <td>Number</td>
                            <td>Status</td>
                            <td>Action</td>
                        </tr>
                        <%
                     try{
                               
                              dbCon con = new dbCon();
                              String query="select * from channeling";
                              Statement st=con. createConnection().createStatement();
                              ResultSet rs=st.executeQuery(query);
                              rs.next();
                              
                              while(rs.next()){
                                    user data = new user();
                                    ResultSet rs1 = data.udata(rs.getString("d_id"));
                                    rs1.next();
                                    String doc = rs1.getString("name");
                                    ResultSet rs2 = data.udata(rs.getString("p_id"));
                                    rs2.next();
                                    String pat = rs2.getString("name");
                                    String status = rs.getString("status");
                                    if("R".equals(rs.getString("status"))){
                                        status = "Reserved";
                                    }else if("C".equals(rs.getString("status"))){
                                        status = "Checked In";
                                    }

                            %>
                        <tr>
                            <td><%=pat %></td>
                            <td><%=doc %></td>
                            <td><%=rs.getString("number") %></td>
                            <td><%=status %></td>
            <%
                if("R".equals(rs.getString("status"))){
            %>
                    <td><a href="../cact?pid=<%=rs.getString("p_id")%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=in">Checked In</a></td>
                    <td><a href="../cact?pid=<%=rs.getString("p_id")%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=can">Cancel</a></td>
                </tr>
            <%
                }else if("C".equals(rs.getString("status"))){
            %>
                <td><a href="../cact?pid=<%=rs.getString("p_id")%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=com">Complete</a></td>
                <td><a href="../cact?pid=<%=rs.getString("p_id")%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=can">Cancel</a></td>
            </tr>
            <% }
                }        
                }catch(Exception r){
                System.out.println(r.getMessage());
                }
                            %>
                    </table>
                    </div>
                    <hr/>
                    <div>
                        <h1>patients</h1>
                        <table border='1'>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Telephone</th>
                            <th>Email</th>
                            <th>NIC</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Action</th>
                        </tr>
                        <%
                     try{
                               
                              dbCon con = new dbCon();
                              String query="select * from users WHERE type = 'P'";
                              Statement st=con. createConnection().createStatement();
                              ResultSet rs=st.executeQuery(query);
                              
                              while(rs.next()){
                      %>
                        <tr>
                            <td><%=rs.getString("id") %></td>
                            <td><%=rs.getString("name") %></td>
                            <td><%=rs.getString("address") %></td>
                            <td><%=rs.getString("telephone") %></td>
                            <td><%=rs.getString("email") %></td>
                            <td><%=rs.getString("nic") %></td>
                            <td><%=rs.getString("gender") %></td>
                            <td><%=rs.getString("age") %></td>
                            <td><a href="../deleteu?id=<%=rs.getString("id")%>">Remove</a></td>
                        </tr>
                        <%
                                }  
                             }
                             catch(Exception r){
                             System.out.println(r.getMessage());
                             }
                        %>
                    </table>
                    </div>
                                        <hr/>
                    <div>
                        <h1>Doctors</h1>
                        <form action="../changetime" method="post">
                        <table border='1'>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Telephone</th>
                            <th>Email</th>
                            <th>NIC</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Specelist</th>
                            <th>Time</th>
                            <th>update</th>
                            <th>Delete</th>
                        </tr>
                        <%
                     try{
                               
                              dbCon con = new dbCon();
                              String query="select * from users u JOIN doctor d on u.id = d.id WHERE u.type = 'D'";
                              Statement st=con. createConnection().createStatement();
                              ResultSet rs=st.executeQuery(query);
                              
                              while(rs.next()){
                                  
                              String query1="select name from specelist WHERE id =" + rs.getString("s_id");
                              Statement st1=con. createConnection().createStatement();
                              ResultSet rs1=st1.executeQuery(query1);
                              rs1.next();
                              String spe = rs1.getString("name");
                      %>
                        <tr>
                            <td><%=rs.getString("id") %></td>
                            <td><%=rs.getString("name") %></td>
                            <td><%=rs.getString("address") %></td>
                            <td><%=rs.getString("telephone") %></td>
                            <td><%=rs.getString("email") %></td>
                            <td><%=rs.getString("nic") %></td>
                            <td><%=rs.getString("gender") %></td>
                            <td><%=rs.getString("age") %></td>
                            <td><%=spe %></td>
                            <td><input type="text" value="<%=rs.getString("time") %>" name="time" pattern=".{5}"/><input type="hidden" name="id" value="<%=rs.getString("id")%>"/></td>
                            <td><input type="submit" value="update time"/></td>
                            <td><a href="../deleteu?id=<%=rs.getString("id")%>">Remove</a></td>
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
                    </div>
                    <hr/>
                                        <div>
                        <h1>Staff</h1>
                        <table border='1'>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Telephone</th>
                            <th>Email</th>
                            <th>NIC</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Action</th>
                        </tr>
                        <%
                     try{
                               
                              dbCon con = new dbCon();
                              String query="select * from users WHERE type = 'S'";
                              Statement st=con. createConnection().createStatement();
                              ResultSet rs=st.executeQuery(query);
                              
                              while(rs.next()){
                      %>
                        <tr>
                            <td><%=rs.getString("id") %></td>
                            <td><%=rs.getString("name") %></td>
                            <td><%=rs.getString("address") %></td>
                            <td><%=rs.getString("telephone") %></td>
                            <td><%=rs.getString("email") %></td>
                            <td><%=rs.getString("nic") %></td>
                            <td><%=rs.getString("gender") %></td>
                            <td><%=rs.getString("age") %></td>
                            <td><a href="../deleteu?id=<%=rs.getString("id")%>">Remove</a></td>
                        </tr>
                        <%
                                }  
                             }
                             catch(Exception r){
                             System.out.println(r.getMessage());
                             }
                        %>
                    </table>
                    </div>
        </div>
    </body>
</html>
