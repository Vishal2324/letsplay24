<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page isELIgnored="false" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="head-meta.jsp"%>

<title>Insert title here</title>
</head>
<body>

<%@ include file="head.jsp"%>
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="${pageContext.request.contextPath}/resources/images/bugati.jpeg" alt="Bugati" width="460" height="345" style="margin: auto; width: 80%; max-height: 600px;">
      </div>

	<div class="item">
		<img src="${pageContext.request.contextPath}/resources/images/ferari.jpeg" alt="Ferari" width="460" height="345" style="margin: auto; width: 80%; max-height: 600px;">
	</div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/Audi.jpeg" alt="Audi" width="460" height="345" style="margin: auto; width: 80%; max-height: 600px;">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/Nissan.jpeg" width="460" height="345" style="margin: auto; width: 80%; max-height: 600px;">
      </div>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br>
<br>

<div class="container">
 <div class="col-sm-4"><img src="${pageContext.request.contextPath}/resources/images/bugati.jpeg" class="img-circle" alt="Cinque Terre" width="304" height="236"> </div> 

  <div class="col-sm-4"><img src="${pageContext.request.contextPath}/resources/images/Audi.jpeg" class="img-circle" alt="Cinque Terre" width="304" height="236"></div> 
 
  <div class="col-sm-4"><img src="${pageContext.request.contextPath}/resources/images/ferari.jpeg" class="img-circle" alt="Cinque Terre" width="304" height="236"></div> 


</div>
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>Car 1</h3>
      <p>Bugati</p>
      <p>200 hourse power,blue colour</p>
    </div>
    <div class="col-sm-4">
      <h3>Car 2</h3>
      <p>Audi A3</p>
      <p>100 hourse power,Blood red colour.</p>
    </div>
    <div class="col-sm-4">
      <h3>Car 3</h3>        
      <p>Ferari </p>
      <p>500 hourse power,red colour</p>
    </div>
  </div>
</div>
<div class="container">
  <div class="panel panel-default">
    <div class="panel-footer">@copyright</div>
  </div>
</div>

</body>
</html>