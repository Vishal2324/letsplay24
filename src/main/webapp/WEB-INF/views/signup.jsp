<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="head-meta.jsp"%>

<title>Insert title here</title>
</head>
<script type="text/javascript">
	var myapp = angular.module("myApp",[]);
	
	myapp.controller("myCtrl",function($scope){
		
		$scope.overAllError = true;
		$scope.checkOverallError = function()
		{
			/* console.log($scope.emailError  );
			console.log($scope.phoneError  );
			console.log( $scope.emailError || $scope.phoneError );  */
			$scope.overAllError = ( $scope.emailError || !$scope.emailTouched || $scope.phoneError || !$scope.phoneTouched || $scope.passwordError);
		}
		
		$scope.email = '';
		$scope.emailError = false;
		$scope.emailTouched = false;
		$scope.CheckEmail = function()
		{
			$scope.emailTouched = true;
			var patt = /\S+@\S+\.\S+/;
			$scope.emailError = !patt.test($scope.email);
			$scope.checkOverallError();
		}
		
		$scope.phone = '';
		$scope.phoneError = false;
		$scope.phoneTouched = false;
		$scope.CheckPhone = function()
		{
			$scope.phoneTouched = true;
			var patt = /^[7-9][0-9]{9}$/;
			$scope.phoneError = !patt.test($scope.phone);
			$scope.checkOverallError();
			
		}
		$scope.password='';
		$scope.CheckPassword = function()
		
		{
			var patt=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			$scope.passwordError = !patt.test($scope.password);
			$scope.checkOverallError();
		}
		
		
		
		
	});
</script>
<body>
<%@ include file="head.jsp"%>

<c:if test="${not empty passwordmismatch}">
	<label class="text text-danger"> Passwords do not match </label>
</c:if>

<c:if test="${not empty useralreadyexists}">
	<label class="text text-danger"> User already Exists </label>
</c:if>

<div class="col-md-4 col-md-offset-4">
		<form:form class="form-horizontal" role="form" method="post" action="AddUserToDB" modelAttribute="User">
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="UserName" type="text" class="form-control" placeholder="Enter User Name" />
				<label class="text text-danger"><form:errors path="userName"/></label>
			</div>
			
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="Email_ID" type="text" class="form-control" placeholder="Enter Email ID" />
				<label class="text text-danger"><form:errors path="email_ID"/></label>
			</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="Password" type="Password" class="form-control" placeholder="Enter Password" />
				<label class="text text-danger"><form:errors path="password"/></label>
			</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="Confirm_Password" type="Password" class="form-control" placeholder="Enter Password Again" />
			<label class="text text-danger"><form:errors path="confirm_Password"/></label>
			</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:textarea rows="4" cols="50" path="Address" type="text" class="form-control" placeholder="Enter Address"/>
			<label class="text text-danger"><form:errors path="address"/></label>
			</div>
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="Phone_No" type="text " class="form-control" placeholder="Enter Phone NO" />
				<label class="text text-danger"><form:errors path="phone_No"/></label>
			</div>
			
			<div style="margin-top: 10px" class="col-lg-12">
				<!-- Button -->
			
					<input type="submit" value="Add" class="btn btn-warning btn-block" />
							</div>
		</form:form>
	</div>
</body>
</html>