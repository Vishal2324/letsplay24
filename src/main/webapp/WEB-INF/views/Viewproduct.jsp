<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/head-meta"/>
</head>
<body>
<c:import url="/head"/>
<br>
<br>
<div style = "margin:auto;width:80%;">
	<div class="col-md-6">
	<img alt="" src="${pageContext.request.contextPath}/resources/images/image_${Product.getProductId()}.jpg" style="margin: auto; width: 70%; max-width: 70%;">
		</div>
		<div class="col-md-6">
			
			<div><span style="font-size:15px"><strong>Name : ${Product.getProductName()}</strong></span></div>
			<hr>
			<div><span style="font-size:15px"><strong>Category : ${Product.getCategory()}</strong></span></div>
			<hr>
			<div><span style="font-size:15px"><strong>Description : ${Product.getProductDEscription()}</strong></span></div>
			<hr>
			<div><span style="font-size:15px"><strong>Price : ${Product.getPrice()}</strong></span></div>
			<hr>
		</div>
		<form action="${pageContext.request.contextPath}/addToCart" method="post">
        		<input type="hidden" value="${Product.getProductId()}" name="ProductId" />
				<div>
				
				
				</div>
				
				<br><br>
				<div class="col-md-6">
				</div>
				  <%
	if (request.isUserInRole("ROLE_USER")) {
%>
        
				<div class="col-md-6">
				<b>Quantity :</b>
				<input type="number" value="1" min="1" max="10"
						name="productquantity"   />
						<br><br>
						
				<input type="submit" value="Add To Cart"
						class="btn btn-warning btn-lg" />
				</div>
				    <%
	}
    %>
        	</form>
        	</div>
	

</body>
</html>