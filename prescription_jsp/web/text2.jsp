<%-- 
    Document   : text2
    Created on : Mar 18, 2021, 12:23:49 PM
    Author     : Movini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Facility Screen</title>
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

<div data-ng-controller="TDataCtrl">
<table >
    <tbody data-ng-repeat="thisrow in tdata">
    <tr>

        <td> <label id="lblRange" class="form-label">Drug name</label></td>
        <td><input type="text" class="form-control" placeholder="" name="drug_name" id="drug_name" required aria-labelledby='lblRange'> </td>
        <td><label id="x" class="form-label">Price</label></td>
        <td><input type="text" class="form-control" placeholder="" name="price" id="price" required required aria-labelledby='x' > </td>
           
    </tr>
    </tbody>
</table>
<input type="button" value="Add" data-ng-click="addRow()"/>
<input type="button" value="Remove" data-ng-click="removeRow()"/>
</div>
</body>
</html>
