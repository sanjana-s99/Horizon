<%-- 
    Document   : email
    Created on : Mar 23, 2021, 9:32:43 PM
    Author     : Movini
--%>

<%@page import="Model.dbCon"%>
<%@page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    
    
 
    <%= request.getParameter("username") %>
    
    <%
             dbCon con = new dbCon();            
 PreparedStatement pstmt=null; //create statement  
 
 
 
 String name =request.getParameter("username");
    
    pstmt=con.createConnection().prepareStatement("select * from users where name=?"); // sql select query
    pstmt.setString(1,name);
    ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
    
    while(rs.next()) 
    {
    
  String email = rs.getString("email");



  


   





    %>
    
    
    <body bgcolor="grey">
        <form action="mailProcess.jsp">
            <table>
                <tr><td><b><font color="White">To:
                    </td>
                    
                    <input type="text" class="form-select" aria-label="Default select example" name="users" value="<%=email%>">    
                            <%
                          
                          }
                        
                        %>    
                    </td>
                </tr>
                <tr>
                    <td>
                        <b><font color="white">Subject:
                    </td>
                    <td>
                        <input type="text" name="sub" value="This is  your Bill "><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b><font color="white">Message Text: 
                    </td>
                    <td>
                        <textarea rows="12" cols="80" name="mess"> user name - <%= request.getParameter("username") %> &#13;&#10; Doctor name  <%= request.getParameter("doctorname") %>&#13;&#10; drugs-<%= request.getParameter("drugs") %> &#13;&#10; Date-<%= request.getParameter("date") %> &#13;&#10; price-<%= request.getParameter("price") %> &#13;&#10;Thank you!       </textarea><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Send">
                    </td>
                    <td>
                        <input type="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
