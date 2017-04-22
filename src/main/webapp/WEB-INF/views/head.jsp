<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<nav class="navbar navbar-inverse" style="background-color: #800000; border: none; box-shadow: 2px 2px 20px #000000;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" >
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Letsplay24</a>
      
    </div>
    
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
      
              <%
	if (request.isUserInRole("ROLE_ADMIN")) {
%>
        <li><a href="${pageContext.request.contextPath}/categories">Categories</a></li>
       
        <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
         <%
	}
    %>
                <%
	if (request.isUserInRole("ROLE_USER")) {
%>
        
       
        <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
         <%
	}
    %>
    	 
        <li><a href="${pageContext.request.contextPath}/contactus">Contact Us</a></li>
        <li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <c:choose>
      
      
      <c:when test="${not empty pageContext.request.userPrincipal.name }">
       <a class="navbar-brand" href="${pageContext.request.contextPath}/cart">View Cart</a>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>Welcome ${pageContext.request.userPrincipal.name }</a></li>
    <li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li> 
    
		 </c:when>		
  
    	
			
    		<c:otherwise>
    		
        <li><a href="${pageContext.request.contextPath}/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="${pageContext.request.contextPath}/loginpage"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </c:otherwise>
      
      </c:choose>
      
      </ul>
    </div>
  </div>
</nav>