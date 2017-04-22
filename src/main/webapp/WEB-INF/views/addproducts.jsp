<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/head-meta"/>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>
<body>
   <c:import url="/head" />
	<div class="container-fluid">
		<div class="col-md-4 col-md-offset-4">
			<h3>
				<b>ADD PRODUCT</b>
			</h3>
		</div>
	</div>
	<hr>

	<div class="col-md-4 col-md-offset-4">
		<form:form class="form-horizontal" role="form" method="post" action="AddProductToDB" modelAttribute="Product" enctype="multipart/form-data">
			<div style="margin-bottom: 25px" class="col-lg-12">
				<form:input path="ProductName" type="text" class="form-control" placeholder="Enter Product Name" />
				<hr>
				<form:input path="ProductDEscription" type="text" class="form-control" placeholder="Enter Description" />
				<hr>
				<form:input path="Price" type="text" class="form-control" placeholder="Enter price" />
				<hr>
				<!--  -->
				
				<form:select path="category" class="form-control">
					
					<c:forEach var="c" items="${catlist}">
					
						<form:option value="${c.getName()}"></form:option>
					
					</c:forEach>
					
					
				</form:select>
				<!--  -->
			</div>
			<div style="margin-top: 10px" class="col-lg-12">
				<!-- Button -->
				<label class="btn btn-default btn-file">
			   Select Product Image <form:input path="File" type="file" style="display: none;" id="imageFile" 
			   onchange="filePathDisp()" /> 
			</label><br>
			<span id =file_location>&nbsp</span>
			<script type="text/javascript">
					function filePathDisp() {
							document.getElementById("file_location").innerHTML = $('#imageFile').val();}
			</script> 
			
					<input type="submit" value="Add" class="btn btn-warning btn-block" />
							</div>
		</form:form>
	</div>

	
</body>
</html>