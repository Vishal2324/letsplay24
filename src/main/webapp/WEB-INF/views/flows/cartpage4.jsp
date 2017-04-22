<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<script type="text/javascript">

var myApp = angular.module('myApp',[]);

myApp.controller('myCtrl',function($scope, $http){
	
	var BASEURL='http://localhost:9001/letsplay24/';
	
	$http.post(BASEURL+'deleteAllFromCart').then(function(response) {
	      
			console.log(response.data);
			
	  });
	
});

</script>
<body background="resources/images/nb1.jpg"  ng-app="myApp" ng-controller="myCtrl">
<c:import url="/head"/>
<div class="container-fluid">
<div class="col-md-4 col-md-offset-4">

<div class="alert alert-success">
  <strong>Congrats! </strong> You Order has been Placed
</div>
<center>
<h3>ThankYou</h3> 
<h5>Have a nice Day</h5>
<br><br>
<a href="${pageContext.request.contextPath}/products"
			class="btn btn-warning  btn pull-center">Continue Shopping</a>
</center>
</div>
</div>

</body>
</html>