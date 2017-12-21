<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Libreria Universitaria</title>
<link href="<c:url value='/static/css/bootstrap.min.css' />"  rel="stylesheet"></link>
<style>
  

.img-responsive,
.thumbnail > img,
.thumbnail a > img,
.carousel-inner > .item > img,
.carousel-inner > .item > a > img {
  display: block;
  width: 100%;
  height: 400px;
  max-height: 400px;
  
}

/* ------------------- Carousel Styling ------------------- */

.carousel-inner {
  border-radius: 15px;
}

.carousel-caption {
  background-color: rgba(0,0,0,.5);
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 10;
  padding: 0 0 10px 25px;
  color: #fff;
  text-align: left;
   
}

.carousel-indicators {
  position: absolute;
  bottom: 0;
  right: 0;
  left: 0;
  width: 100%;
  z-index: 15;
  margin: 0;
  padding: 0 25px 25px 0;
  text-align: right;
}

.carousel-control.left,
.carousel-control.right {
  background-image: none;
}


/* ------------------- Section Styling - Not needed for carousel styling ------------------- */

.section-white {
   padding: 10px 0;
}

.section-white {
  background-color: #fff;
  color: #555;
}

@media screen and (min-width: 768px) {

  .section-white {
     padding: 1.5em 0;
  }

}

@media screen and (min-width: 992px) {

  .container {
    max-width: 930px;
  }

}
  
  
  </style>
 
</head>
<body>

  <section class="section-white">
	  <div class="container">
	
		    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			      <!-- Indicators -->
			      <ol class="carousel-indicators">
			        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
			      </ol>
			
			      <!-- Wrapper for slides -->
			      <div class="carousel-inner">
				        <div class="item active">
				          <img src="<c:url value='/static/img/libues.jpg' />" alt="...">
				          <div class="carousel-caption">
				            <h3>Librería Universitaria</h3><br/>
				            <p>Bienvenido a la librería de la Universidad de El Salvador.</p>
				          </div>
				        </div>
				        
				        <div class="item">
				          <img src="<c:url value='/static/img/books.jpg' />" alt="...">
				          <div class="carousel-caption">
				            <h3>Libros</h3>
				            <br/>
				            <p>Catalogo de libros en linea.</p>
				          </div>
				        </div>
				        
				         <div class="item">
				          <img src="<c:url value='/static/img/fondolibros3.jpg' />" alt="...">
				          <div class="carousel-caption">
				            <h2>Útiles/Miscelánios</h2>
				            <br/>
				            <p>Catálogo de Papelería y Utiles.</p>
				          </div>
				        </div>
				        
			      </div>
			      
			
			      <!-- Controls -->
			      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left"></span>
			      </a>
			      
			      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right"></span>
			      </a>
		    </div>
	
	  </div>
</section>
  
<script  src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<script  src="<c:url value='/static/js/bootstrap.min.js' />"></script>
</body>
</html>