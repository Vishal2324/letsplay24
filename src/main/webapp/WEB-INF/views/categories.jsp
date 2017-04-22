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
	$scope.data=${CategoryJSON};
		});
</script>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
<c:import url="/head"/>
  <div class="container-fluid">
  <br>
  <br>
		<div class="col-md-4 col-md-offset-4">
			<a href="addcategory" class="btn btn-warning btn-block">Add Category</a>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<div class="container">
	
		<div class="row">
			<div class="col-lg-3"><strong>Category Name</strong></div>
			<div class="col-lg-3"><strong>Category Description</strong></div>
			
			<div class="col-lg-3"><strong>Update</strong></div>
			<div class="col-lg-3"><strong>Delete</strong></div>
		
			
		</div>
		
		<hr>
		<br>
		
		<div class="row" ng-repeat="cat in data">
			<div class="col-lg-3"><span>{{cat.CategoryName}}</span></div>
			<div class="col-lg-3"><span>{{cat.CategoryDescription}}</span></div>
			
			<div class="col-lg-3">
				<a href="updatecategory/{{cat.CategoryId}}" class="btn btn-success">Edit</a>
			</div>
			
			<div class="col-lg-3">
			
				<form action="DeleteCategoryFromDB" method="post">
					<input type="hidden" name="text" value="{{cat.CategoryId}}"><input type="submit" value="Delete" class="btn btn-danger">
				</form>
			
			</div>
			
			<br>
			<br>
			<hr>
			<br>
			
				
		</div>
		<br>
			<hr>
			<br>
	</div>
	
</body>
</html>