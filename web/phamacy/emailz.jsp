
<%@page import="Model.dbCon"%>
<%@page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
    <head>
        <title>W3Adda Index Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    
    
    <%= request.getParameter("id") %>
    <%= request.getParameter("doctorsname") %>
     <%= request.getParameter("doctorsname") %>
    
    
    <body bgcolor="grey">
        <form action="mailProcess.jsp">
            <table>
                <tr><td><b><font color="White">To:
                    </td>
                    
                        <select class="form-select" aria-label="Default select example" name="users">    
                                <%
                        dbCon con = new dbCon();
                         ResultSet rs;
  
                         
                           String query ="select * from users";
                           Statement st =con.createConnection().createStatement();
                           
                            rs =st.executeQuery( query);
                             while(rs.next())
                             {
                             
                                String id= rs.getString("id");
                                String username =rs.getString("name");
                                  String email =rs.getString("email");
                                
                                
                                
                            
                        


                        %>
                        
                        
                        
                            
                        
                        <option selected  value="<%=email %>"><%=username %></option>
                   
                   
                           
                    
                        <%
                          
                          }
                        
                        %>                
 </select>
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
                        <textarea rows="12" cols="80" name="mess"> Doctors name - <%= request.getParameter("doctorsname") %> &#13;&#10; Drugs name- <%= request.getParameter("drugsname") %>&#13;&#10; price-<%= request.getParameter("price") %> &#13;&#10; Date-<%= request.getParameter("date") %> &#13;&#10; Thank you!       </textarea><br/>
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