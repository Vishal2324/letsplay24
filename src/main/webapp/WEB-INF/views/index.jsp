<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="/head-meta"/>
</head>
<body>
<c:import url="/head"/>
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
        <img src="bugati.jpeg" alt="Bugati" width="460" height="345">
      </div>

	<div class="item">
		<img src="ferari.jpeg" alt="Ferari" width="460" height="345">
	</div>

      <div class="item">
        <img src="Audi.jpeg" alt="Audi" width="460" height="345">
      </div>

      <div class="item">
        <img src="" alt="Nissan.jpeg" width="460" height="345">
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
  <img src="bugati.jpeg" class="img-circle" alt="Cinque Terre" width="304" height="236"> 

  <img src="Audi.jpeg" class="img-circle" alt="Cinque Terre" width="304" height="236">
 
  <img src="ferari.jpeg" class="img-circle" alt="Cinque Terre" width="304" height="236"> 


</div>
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>Car 1</h3>
      <p>Bugati</p>
      <p>Join Us...</p>
    </div>
    <div class="col-sm-4">
      <h3>Car 2</h3>
      <p>Audi A3</p>
      <p>Join Us...</p>
    </div>
    <div class="col-sm-4">
      <h3>Car 3</h3>        
      <p>Ferari </p>
      <p>Join Us...</p>
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
