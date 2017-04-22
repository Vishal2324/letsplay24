<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	
	var myApp = angular.module('myApp',[]);
	
	myApp.controller('myCtrl',function($scope, $http){
		
		$scope.data = [];
		
		var BASEURL='http://localhost:9001/letsplay24/';
		
		$http.post(BASEURL+'getAllItemsInCart').then(function(response) {
		      
				console.log(response.data);
				$scope.data = response.data;
		  });
		
		$scope.DeleteFromCart = function(input)
		{
			$http.post(BASEURL+'deleteFromCart',input).then(function(response) {
			 //
			 if( response.data.deleted == 'deleted' )
			 {
				 $http.post(BASEURL+'getAllItemsInCart').then(function(response) {
				      
						console.log(response.data);
						$scope.data = response.data;
				  });	 
			 }
			 //
		  });
		}
		
	});
	
</script>



<body background="resources/images/nb2.jpg"  ng-app="myApp" ng-controller="myCtrl">
<c:import url="/head"/>


	<div class="container">
		<a href="${pageContext.request.contextPath}/products"
			class="btn btn-danger btn pull-left">BACK TO PRODUCTS</a>


		<a href="${flowExecutionUrl}&_eventId=goToCheckout"
			class="btn btn-warning  btn pull-right">CHECK OUT</a>
				</div>
<hr/>

	<%-- <div class="container-fluid">
	
	<div class="col-md-4 col-md-offset-4">
	<div  ng-repeat="x in data ">
			<div class="panel panel-default">
			
				 <div class="panel-body">
				 
					 <div class="col-md-6">
				  	 <img 
					ng-src="${pageContext.request.contextPath}/{{ x.ProductImage }}" height=" 80px" width="170px" class="img img-responsive img-thumbnail">
				    </div>
				    
				    <div class="col-md-6">
					<div><span style="font-size:20px"><strong>{{x.ProductName}}</strong></span></div>
					
					<div><b>Quantity :{{x.ProductQty}} </b></div>
					
					<div><span style="font-size:15px" class="text-warning"><strong>&#8377  {{x.ProductPrice}}</strong></span></div>
				    </div>
			    
			    
				    <div class="col-md-12" style="margin-top:10px;" align="center">
				    <a href="${pageContext.request.contextPath}/view/{{x.ProductId}}" class="btn btn-warning btn-xs">VIEW</a>
					&nbsp &nbsp
					<input type="button" value="Delete from Cart"
					class="btn btn-danger btn-xs" ng-click="deleteFromCart(x.CartId)" />
				    </div>
			    		    
			    </div>  
		    
		  	</div>
	 </div>
  </div>
		</div> --%>
	
	
	<!--  -->
	
	<div class="container">
		
		<div class="row">
		
			<div class="col-lg-2">Name</div>
			<div class="col-lg-2">Price</div>
			<div class="col-lg-2">Quantity</div>
			<div class="col-lg-2">Image</div>
			<div class="col-lg-2">Delete</div>
			<br>
		</div>
		
		<hr>
		
		<div class="row" ng-repeat="x in data">
		
			<div class="col-lg-2">{{x.cartProductName}}</div>
			<div class="col-lg-2">{{x.cartPrice}}</div>
			<div class="col-lg-2">{{x.cartQuantity}}</div>
			<div class="col-lg-2">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/image_{{x.cartProductId}}.jpg" style="max-width: 40px;">
			</div>
			<div class="col-lg-2">
				
				<button class="btn btn-danger" ng-click="DeleteFromCart(x.cartId)">Delete From Cart</button>
				
			</div>
			<br><br><br>
		</div>
	</div>
	
</body>
</html>
