<%-- 
    Document   : text3
    Created on : Mar 18, 2021, 12:45:50 PM
    Author     : Movini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        
        
        
        <html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Facility Screen</title>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.2/angular.js"></script>
    <script>
        var TDataCtrl = function ($scope) {
            $scope.venues = [{name:'venue1',value:'venue1'},{name:'venue2', value:'venue2'}];
            $scope.facilities = [{name:'facility1',value:'facility1'},{name:'facility2',value:'facility2'}];
            $scope.vendors = [{name:'vendor1',value:'vendor1'},{name:'vendor2', value:'vendor2'}];
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
<form method="get">
    <table>
        <tr>
            <td>Customer id</td>
            <td><input type="text" id="customer_id" name="customer_id"></td>
        </tr>

    </table>
</form>
<div data-ng-controller="TDataCtrl">
<table >
    <tbody data-ng-repeat="thisrow in tdata">
    <tr>
        <td>VENUE ID</td>
        <td>
            <select id="select">
                <option ng-repeat="option in venues" value="{{option.value}}">{{option.name}}</option>
            </select>
        </td>
        <td>FACILITY</td>
        <td>
            <select id="select1">
                <option ng-repeat="option in facilities" value="{{option.value}}">{{option.name}}</option>
        </select>
        </td>
        <td>VEDNOR ID</td>
        <td>
            <select id="select2">
                <option ng-repeat="option in vendors" value="{{option.value}}">{{option.name}}</option>
            </select>
        </td>
        <td>COST</td>
        <td><input type="text" id="myDiv"></td>
        <td>QUANTITY</td>
        <td><input type="text" id="quantity" name="quantity"></td>

    </tr>
    </tbody>
</table>
<input type="button" value="Add" data-ng-click="addRow()"/>
<input type="button" value="Remove" data-ng-click="removeRow()"/>
</div>
</body>
</html>
    </body>
</html>
