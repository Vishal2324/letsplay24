<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/head-meta"/>
<title>Insert title here</title>
</head>
<body>
<c:import url="/head"/>
<c:if test="${param.error != null}">
				<p class="alert alert-danger">
					<span>Invalid Username or password.</span>
				</p>
			</c:if>
			<c:if test="${param.logout != null}">
				<p class="alert alert-success">
					<span>You have been logged out successfully.</span>
				</p>
			</c:if>
			<br>
			<br>
			
<div class= "container">
<div class="col-lg-6">

             
 <center> <img src="${pageContext.request.contextPath}/resources/images/login11.jpeg" class="img-rounded" alt="Cinque Terre" width="400" height="400"> </center>
</div>
<div class="col-lg-6">

  <form action="login" method="post">
    <div>
      <label for="email" style= "color:purple; font-size:180%;">UserName:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter user name" name="Username">
    </div>
    <br>
    
    
    <div >
      <label for="pwd" style= "color:purple; font-size:180%;">Password:</label>
      
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="Password">
    </div>
    <br>
    
    <br>
    
    <button type="submit" class="btn btn-warning" style="font-size:200%; color: white;">Submit</button>
  </form>
 </div>
  </div>
  <br>
  <br>
    <br>
  <br>
    <br>
  <br>
    <div class="panel-footer">@copyright</div>
  


</body>
</html>