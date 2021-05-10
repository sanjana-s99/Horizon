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
    String uid = (String)session.getAttribute("id");
    String uname = (String)session.getAttribute("name");

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/admin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="../scripts/nav.js"></script>
        <script>
            $(document).ready(function() {
                $('.js-example-basic-single').select2();
                var type = jQuery('#type');
                var select = this.value;
                type.change(function () {
                    if ($(this).val() == 'D') {
                        $('.resources').show();
                    }
                    else $('.resources').hide();
                });
                });
        </script>
    </head>
    <body>
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("error")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Oops...',text: 'Something Went Wrong'})</script>
        <%
                }else if(stat.equals("addedsuccess")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Success',text: 'Staff Member Registering Successfull'})</script>
        <%
                }else if(stat.equals("ue")){
        %>
                    <script>Swal.fire({icon: 'error',title: 'Oops...',text: 'User Exists'})</script>
        <%
                }else if(stat.equals("ambsuc")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Success',text: 'Ambulance Addition Successfull'})</script>
        <%
                }else if(stat.equals("lpu")){
        %>
                    <script>Swal.fire({icon: 'info',title: 'Success',text: 'Price Updated!!'})</script>
        <%
                }else if(stat.equals("ur")){
        %>
                    <script>Swal.fire({icon: 'success',title: 'Success',text: 'User Removing Successfull'})</script>
        <%
                }else if(stat.equals("tc")){
        %>
                    <script>Swal.fire({icon: 'info',title: 'Success',text: 'Time Changed!!'})</script>
        <%
                }
            }
        %>
          
        <div class="topnav" id="myTopnav">
            <div class="toptitle">Horizon Hospitals</div>
            <a href="../index.jsp">Home</a>
            <%
                if(type!=null){
                    if(type.equals("S")){
            %>
            <a href="../staff/index.jsp" class="active">Staff Dashboard</a>
            <%}else if(type.equals("W")){%>
            <a href="../staff/index.jsp">Staff Dashboard</a>
            <a href="main.jsp" class="active">Admin Dashboard</a>
            <%}}%>
            <%if(uid != null){
                %>
            <a style="float:right">Welcome <%=uname%></a>
            <a href="../logout" style="float:right">Logout</a>
            <%
                }else{
        %>
            <a href="../register.jsp" style="float:right">Register</a>
            <a href="../login.jsp" style="float:right">Login</a>
            <%}%>

            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
               <i class="fa fa-bars"></i>
            </a>
        </div>
        <h1>Admin Panel</h1>
        <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'AddUser')">Add User</button>
        <button class="tablinks" onclick="openCity(event, 'AddNewAmb')">Add New Ambulance</button>
        <button class="tablinks" onclick="openCity(event, 'LabServices')">Lab Services</button>
        <button class="tablinks" onclick="openCity(event, 'Channelings')">Channelings</button>
        <button class="tablinks" onclick="openCity(event, 'Patients')">Patients</button>
        <button class="tablinks" onclick="openCity(event, 'Doctors')">Doctors</button>
        <button class="tablinks" onclick="openCity(event, 'Staff')">Staff</button>
        <button class="tablinks" onclick="openCity(event, 'Rooms')">Rooms</button>
        <button class="tablinks" onclick="openCity(event, 'Wards')">Wards</button>
        </div>
        
        <div id="AddUser" class="tabcontent">
        
                <div>
                     <form method ="post" action="../adduser">
                         <h1>Add User</h1>
                        <hr>
                        <label for="name"><b>Name</b></label>
                        <input type="text" placeholder="Enter Name" name="name" id="name" required><br/>

                        <label for="email"><b>Email</b></label>
                        <input type="text" placeholder="Enter Email" name="email" id="email" required><br/>

                        <label for="tp"><b>telephone</b></label>
                        <input type="text" placeholder="Enter number" name="tp" id="tp" required><br/>

                        <label for="add"><b>address</b></label>
                        <input type="text" placeholder="Enter address" name="add" id="add" required><br/>

                        <label for="nic"><b>nic</b></label>
                        <input type="text" placeholder="Enter nic" name="nic" id="nic" required><br/>

                        <label for="type"><b>Account Type</b></label>
                        <select name="type" id="type" class="js-example-basic-single" style="width: 30%">
                            <option id="S" value="S">Staff</option>
                            <option id="D" value="D">Doctor</option>
                        </select><br/><br/>
                        <div class="resources" style="display: none;">
                            <label for="type"><b>Select Specilized Area</b></label>
                            <select name="spe"  class="js-example-basic-single" style="width: 30%">

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
                    </div>
                    <button type="submit" class="inputbutt">Add User</button>
                    </form>
                    </div>
            </div>
            <div id="AddNewAmb" class="tabcontent">
            <h1>Add New Ambulance</h1>
            <form action="../add_amb" method="post">
            Vehicle number : <input type="text" name="number">
            <input type="submit" value="add" class="inputbutt">
            </form>
            </div>
            
            <div id="LabServices" class="tabcontent">
            <h1>Lab Services</h1>
            <div>
<!--                <h6>Pirce Details</h6>-->
                    
                    <table class="w3-table-all">
                        <tr class="tablehead">
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
                            <td><form action="../labp" method="post"><input type="hidden" name="id" value="<%=rs.getString("id") %>" ><input type="text" name="price">&nbsp;<input type="submit" value="Update"  class="inputbutt"></form></td>
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
                    <div id="Channelings" class="tabcontent">
                    <h1>Channelings</h1>
                    <table class="w3-table-all">
                        <tr class="tablehead">
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
                                    }else if("D".equals(rs.getString("status"))){
                                        status = "Doctor Commented";
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
                    <td><a class="inputbutt" href="../cact?pid=<%=rs.getString("p_id")%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=in">Checked In</a></td>
                    <td><a class="inputbutt" href="../cact?pid=<%=rs.getString("p_id")%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=can">Cancel</a></td>
                </tr>
            <%
                }else if("C".equals(rs.getString("status"))){
            %>
                <td><a class="inputbutt" href="../cact?pid=<%=rs.getString("p_id")%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=com">Complete</a></td>
                <td><a class="inputbutt" href="../cact?pid=<%=rs.getString("p_id")%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=can">Cancel</a></td>
            </tr>
            <% }else if("D".equals(rs.getString("status"))){
            %>
                <td> <a class="inputbutt" href="../cact?pid=<%=rs.getString("p_id")%>&did=<%=rs.getString("d_id")%>&no=<%=rs.getInt("number")%>&action=com">Complete</a></td>
            </tr>
            <% }
                }        
                }catch(Exception r){
                System.out.println(r.getMessage());
                }
                            %>
                    </table>
                    </div>
            
                    <div id="Patients" class="tabcontent">
                    <div>
                        <h1>Patients</h1>
                        <table class="w3-table-all">
                            <tr class="tablehead">
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
                            <td><a class="inputbutt" href="../deleteu?id=<%=rs.getString("id")%>">Remove</a></td>
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
                    <div id="Doctors" class="tabcontent">
                    <div>
                        <h1>Doctors</h1>
                        <table  class="w3-table-all">
                            <tr class="tablehead">
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
                            <td><%=rs.getString("time") %><form action="../changetime" method="post"><input type="text" value="<%=rs.getString("time") %>" name="time" pattern=".{5}"/><input type="hidden" name="id" value="<%=rs.getString("id")%>"/></td>
                            <td><input type="submit" value="update time" class="inputbutt"/></form></td>
                            <td><a class="inputbutt" href="../deleteu?id=<%=rs.getString("id")%>">Remove</a></td>
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
                    <div id="Staff" class="tabcontent">
                    <div>
                        <h1>Staff</h1>
                        <table  class="w3-table-all">
                            <tr class="tablehead">
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
                            <td><a class="inputbutt" href="../deleteu?id=<%=rs.getString("id")%>">Remove</a></td>
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
                    <div id="Rooms" class="tabcontent">
                    
                                <h1>Rooms</h1>
        <table  class="w3-table-all">
            <tr class="tablehead">
                <th>Room No</th>
                <th>Patient</th>
                <th>Doctor</th>
                <th>Guardians Name</th>
                <th>Guardians Telephone</th>
                <th>Admition Time</th>
                <th>action</th>
            </tr>
            <%    
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT * from admit where type = 'room'";
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    while(rs.next()){
                        user data = new user();
                        ResultSet rs1 = data.udata(rs.getString("did"));
                        rs1.next();
                        String doc = rs1.getString("name");
                        ResultSet rs2 = data.udatanic(rs.getString("nic"));
                        rs2.next();
                        String pat = rs2.getString("name");
                        
            %>
            <tr>
                <td><%=rs.getInt("bno")%></td>
                <td><%=pat%></td>
                <td><%=doc%></td>
                <td><%=rs.getString("gname")%></td>
                <td><%=rs.getString("gtp")%></td>
                <td><%=rs.getString("time")%></td>
                <th><a class="inputbutt" href="discharge.jsp?type=room&id=<%=rs.getInt("id")%>">Discharge</a></th>
            </tr>
            <% 
                }
                }catch (Exception e){

                }
            %>
        </table>
                    </div>
        <div id="Wards" class="tabcontent">
        <h1>Wards</h1>
        <table  class="w3-table-all">
            <tr class="tablehead">
                <th>ward</th>
                <th>Bed No</th>
                <th>Patient</th>
                <th>Doctor</th>
                <th>Guardians Name</th>
                <th>Guardians Telephone</th>
                <th>Admition Time</th>
                <th>action</th>
            </tr>
            <%    
                try {
                    dbCon con = new dbCon();
                    Statement st = con.createConnection().createStatement();
                    String query = "SELECT a.id, a.nic, a.did, a.gname, a.gtp, a.time, w.wtype, b.bno  FROM admit a JOIN beds b ON a.bno = b.bid JOIN ward_types w ON b.wid = w.wid WHERE a.type = 'ward'";
                    //get table data
                    ResultSet rs = st.executeQuery(query);
                    //get data one by one
                    while(rs.next()){
                        user data = new user();
                        ResultSet rs1 = data.udata(rs.getString("did"));
                        rs1.next();
                        String doc = rs1.getString("name");
                        ResultSet rs2 = data.udatanic(rs.getString("nic"));
                        rs2.next();
                        String pat = rs2.getString("name");
                        
            %>
            <tr>
                <td><%=rs.getString("wtype")%></td>
                <td><%=rs.getInt("bno")%></td>
                <td><%=pat%></td>
                <td><%=doc%></td>
                <td><%=rs.getString("gname")%></td>
                <td><%=rs.getString("gtp")%></td>
                <td><%=rs.getString("time")%></td>
                <th><a class="inputbutt" href="discharge.jsp?type=ward&id=<%=rs.getInt("id")%>">Discharge</a></th>
            </tr>
            <% 
                }
                }catch (Exception e){

                }
            %>
        </table>
        </div>  
       <script>
        function openCity(evt, cityName) {
          var i, tabcontent, tablinks;
          tabcontent = document.getElementsByClassName("tabcontent");
          for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
          }
          tablinks = document.getElementsByClassName("tablinks");
          for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
          }
          document.getElementById(cityName).style.display = "block";
          evt.currentTarget.className += " active";
        }
        </script>
    </body>
</html>
