<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/head-meta"/>
<script type="text/javascript">
var myApp=angular.module("myApp",[]);
myApp.controller("myCtrl",function($scope)
		{
	console.log("angular is working");
	$scope.data=${ProductJSON};
		});
</script>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
<c:import url="/head"/>
 <div class="container">
  
			
				 
               <%
	if (request.isUserInRole("ROLE_ADMIN")) {
%>
      <div class="col-md-4 col-md-offset-4">
			<a href="addproduct" class="btn btn-warning btn-block">Add product</a>
		</div>
		<br>
		<br>
		<hr>
		<br>
         <%
	}
    %>
</div>
		
		
	<%
	if (request.isUserInRole("ROLE_ADMIN")) {
	%>	
	<br>
	<br>
	<div class="container">
	
		<div class="row">
			<div class="col-lg-2"><strong>Product Name</strong></div>
			<div class="col-lg-2"><strong>Product Price</strong></div>
			<div class="col-lg-2"><strong>Product Image</strong></div>
			<div class="col-lg-2"><strong>Update</strong></div>
			<div class="col-lg-2"><strong>Delete</strong></div>
			<div class="col-lg-2"><strong>View</strong></div>
			
		</div>
		
		<hr>
		<br>
		
		<div class="row" ng-repeat="cat in data">
			<div class="col-lg-2"><span>{{cat.ProductName}}</span></div>
			<div class="col-lg-2"><span>{{cat.ProductPrice}}</span></div>
			<div class="col-lg-2">
				<span>
				<img alt="" ng-src="resources/images/image_{{cat.ProductId}}.jpg" width="50"/>
				</span>
			</div>
			
			<div class="col-lg-2">
				<a href="updateproduct/{{cat.ProductId}}" class="btn btn-success">Edit</a>
			</div>
			
			<div class="col-lg-2">
			
				<form action="DeleteProductFromDB" method="post">
					<input type="hidden" name="text" value="{{cat.ProductId}}"><input type="submit" value="Delete" class="btn btn-danger">
				</form>
			
			</div>
			
			<div class="col-lg-2">
				<a href="Viewproduct/{{cat.ProductId}}" class="btn btn-link">View</a>
			</div>
			
			<br>
			<br>
			<hr>
			<br>
			<br>
				
				
		</div>
		<br>
			<hr>
			<br>
	</div>
	<%
	}
	%>
	
	<%
	if (request.isUserInRole("ROLE_ADMIN")==false) {
	%>
	<br>
	<br>
	<div class="container">
	
		<div class="row">
			<div class="col-lg-3"><strong>Product Name</strong></div>
			<div class="col-lg-3"><strong>Product Price</strong></div>
			<div class="col-lg-3"><strong>Product Image</strong></div>
			<div class="col-lg-3"><strong>View</strong></div>
	
			

		</div>
		
		<hr>
		<br>
		
		<div class="row" ng-repeat="cat in data">
			<div class="col-lg-3"><span>{{cat.ProductName}}</span></div>
			<div class="col-lg-3"><span>{{cat.ProductPrice}}</span></div>
			<div class="col-lg-3">
				<span>
				<img alt="" ng-src="resources/images/image_{{cat.ProductId}}.jpg" width="50"/>
				</span>
			</div>
			
			<div class="col-lg-2">
				<a href="Viewproduct/{{cat.ProductId}}" class="btn btn-link">View</a>
			</div>
			
			<br>
			<br>
			<hr>
			<br>
			<br>
				
		</div>
		<br>
			<hr>
			<br>
	</div>
	<%
	}
	%>
	
</body>
</html>