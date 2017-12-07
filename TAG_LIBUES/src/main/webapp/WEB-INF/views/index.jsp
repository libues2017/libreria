<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Libreria Universitaria</title>
<link href="<c:url value='/static/css/bootstrap.min.css' />"  rel="stylesheet"></link> 
</head>
<body>
<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">
<div class="row"><%@include file="carrusel.jsp" %></div>
<div class="row"><%@include file="menu.jsp" %></div>
<sec:authorize access="hasRole('USUARIO')"  ></sec:authorize>
<sec:authorize access="hasRole('BODEGUERO')"  ></sec:authorize>
<div class="row">
	<div class="row">
		  <div class="col-sm-4 col-md-4">
		    <div class="thumbnail">
		      <img src="<c:url value='/static/img/libros.jpg' />" style="min-height:50px;height:200px;" />
		      <div class="caption">
		        <h3><a href="<c:url value="producto-busqueda" />" class="alert-link">Libros</a></h3>
		        <p>Contamos con una gran variedad de libros a su disposicion, tanto academincos como de entretenimiento.</p>
		        
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-sm-4 col-md-4">
		    <div class="thumbnail">
		      <img src="<c:url value='/static/img/utiles.jpg' />" style="min-height:50px;height:200px;" />
		      <div class="caption">
		        <h3><a href="<c:url value="producto-list" />" class="alert-link">Utiles/Miscelánios</a></h3>
		        <p>Realice una busqueda con todos los utiles que necesite para todas sus actividades.</p>
		        
		      </div>
		    </div>
		  </div>
		
		  <div class="col-sm-4 col-md-4">
		    <div class="thumbnail">
		      <img src="<c:url value='/static/img/libros.jpg' />" style="min-height:50px;height:200px;" />
		      <div class="caption">
		        <h3><a href="<c:url value="area-list" />" class="alert-link">Areas</a></h3>
		        <p>Contamos con una gran variedad de libros a su disposicion, libros academicos, literatura, etc.</p>
		        
		      </div>
		    </div>
		  </div>
		  
	</div>
</div>

</div>
<!--Para agregar pie depagina-->
<!--  <div class="row"><%@include file="foot.jsp" %></div>-->
<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
</body>
</html>