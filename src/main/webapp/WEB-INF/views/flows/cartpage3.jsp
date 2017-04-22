<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>



<script type="text/javascript">
var myApp = angular.module('myApp',[]);

myApp.controller('myCtrl',function($scope, $http){
	
	$scope.data = [];
	
	$scope.shippingAddress = '';
	$scope.billingAddress = '';
	$scope.TotalPrice = 0;
	
	var BASEURL='http://localhost:9001/letsplay24/';
	
	$http.post(BASEURL+'getAllItemsInCart').then(function(response) {
	      
			console.log(response.data);
			$scope.data = response.data;
			
			$scope.shippingAddress = $scope.data[0].cartShippingAddress;
			$scope.billingAddress = $scope.data[0].cartBillingAddress;
			
			var sum = 0;
			
			for( var i = 0 ; i < $scope.data.length ; i++ )
			{
				sum += $scope.data[i].cartPrice * $scope.data[i].cartQuantity;
			}
			
			$scope.TotalPrice = sum;
			
	  });
	
});
</script>


<body background="resources/images/nb2.jpg" ng-app="myApp" ng-controller="myCtrl">
	<c:import url="/head" />
	<div class="container">
		<a href="${flowExecutionUrl}&_eventId=BackToConfirmDetails"
			class="btn btn-danger btn pull-left">Back To Update Address</a> <a
			href="${flowExecutionUrl}&_eventId=ConfirmOrder"
			class="btn btn-warning btn pull-right"> Confirm Order</a>
	</div>

	<hr />

	<div class="container">

		<div class="col-md-6 col-md-offset-3" id="printableArea">

			<div class="panel panel-default">
				<div class="panel-heading"><center><strong>INVOICE</strong></center></div>
				<table width="100%" class="table">
					<thead align="center">
						<tr>
							<th style="text-align: center">S.No</th>
							<th style="text-align: center">Image</th>
							<th style="text-align: center">Name</th>
							<th style="text-align: center">Quantity</th>
							<th style="text-align: center">Price</th>
						</tr>
					</thead>

					<tbody align="center">
						<tr ng-repeat="x in data">
							<td>{{$index+1}}</td>
							<td><img
								ng-src="${pageContext.request.contextPath}/resources/images/image_{{x.cartProductId}}.jpg"
								height=" 30px" width="80px"
								class="img img-responsive img-thumbnail"></td>
							<td>{{x.cartProductName}}</td>
							<td>{{x.cartQuantity}}</td>
							<td>&#8377{{x.cartPrice}}</td>
						</tr>
						<tr align="center">
							<td colspan="3"></td>
							<td><b>Total Price:</b></td>
							<td><b>&#8377{{TotalPrice}}</b></td>
						</tr>
					</tbody>
				</table>
				<br />

				<div style="margin: 10px">
					<b>Shipping Address:</b><br /> {{shippingAddress}}
				</div>
				<div style="margin: 10px">
					<b>Billing Address:</b><br /> {{billingAddress}}
				</div>
			</div>

		</div>
		
	</div>
</body>
</html>