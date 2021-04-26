<%-- 
    Document   : ambulance
    Created on : Mar 23, 2021, 9:48:38 AM
    Author     : SHATTER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.dbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIwzALxUPNbatRBj3Xi1Uhp0fFzwWNBkE"></script>
        <script src="https://unpkg.com/location-picker/dist/location-picker.min.js"></script>
        <style type="text/css">
            #map {
                width: 100%;
                height: 350px;
            }
        </style>
    </head>
    <body>
        <%
            String stat = request.getParameter("status");
            if(stat!=null){
                if(stat.equals("success")){
        %>
                    compleated
        <%
                }else if(stat.equals("error")){
        %>
                    error
        <%
                }
            }
        %>
        <h1>Hello World!</h1>
         <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT COUNT(number) FROM ambulance WHERE status='N' ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by 
                        rs.next();
        %>
        <h1>Available Ambulance: <%=rs.getString("COUNT(number)")%></h1>
        <%
                    }catch(Exception e){
                    }
         %>
        <form action="amb" method="post">
            <select name="number">
                <option>Select Ambulance</option>

                <%
                    try {
                        dbCon con = new dbCon();
                        Statement st = con.createConnection().createStatement();
                        String query = "SELECT number FROM ambulance WHERE status='N' ";
                        //get table data
                        ResultSet rs = st.executeQuery(query);
                        //get data one by one
                        while(rs.next()){
                            %>
                            <option value="<%=rs.getString("number")%>"><%=rs.getString("number")%></option>

                            <% }
                    }catch (Exception e){

                    }
                %>
            </select>
            Name : <input type="text" name="name">
            Phone : <input type="text" name="phone">
                    <label for="sel1">Mark Your Location :</label>
                    <div id="map"></div>
                    <input type="hidden" name="lat" id="lat">
                    <input type="hidden" name="lng" id="lng">
            <input type="submit" value="request">
        </form>
    <!--GMaps Script-->
    <script>
        // Get element references
        var lat = document.getElementById('lat');
        var lng = document.getElementById('lng');

        // Initialize locationPicker plugin
        var lp = new locationPicker('map', {
            setCurrentPosition: true, // You can omit this, defaults to true
        }, {
            zoom: 15 // You can set any google map options here, zoom defaults to 15
        });

        // Listen to map idle event, listening to idle event more accurate than listening to ondrag event
        google.maps.event.addListener(lp.map, 'idle', function(event) {
            // Get current location and show it in HTML
            var location = lp.getMarkerPosition();
            lat.value = location.lat;
            lng.value = location.lng;
        });
    </script>
    </body>
</html>
