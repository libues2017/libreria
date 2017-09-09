<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Libreía UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

</head>
<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<!-- <div class="row"> <%@include file="authheader.jsp" %></div>-->
<div class="row">

 <div class="row col-md-13">
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Localizacion de los productos</span></div>
<!--<div class="col-xs-8">-->
	<table class="table table-striped ">
		<thead>
    		<tr >
    			
    			<th>CODPROD</th>
    			<th>NOMBRE PROD</th>
    			<th>LUGAR</th>
    			<th>ESTANTE</th>
    			<th>NIVEL</th>
    			<th>CANTIDAD</th>
    			<th>ACTUALIZAR</th>
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${localizaciones}" var="localizacion">
    		<tr >
    			
    			<td>${localizacion.codigoprod}</td>
    			<td>${localizacion.nombreprod}</td>
    			<td>${localizacion.lugar}</td>
    			<td>${localizacion.estante}</td>
    			<td>${localizacion.nivel}</td>
    			<td>${localizacion.cantidad}</td>
    			                
            <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
            <td><a href="<c:url value='/edit-localizacion-${localizacion.idlocalizacion}' />" class="btn btn-success custom-width">Actualizar Ubicacion</a></td>
            </sec:authorize>                        
    		</tr>
    	</c:forEach>
    	</tbody>
	</table><br/>
	</div>
	</div>
	
</div>


</div>
<br/><br/>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
<div class="row"><%@include file="foot.jsp" %></div>
</body>
</html>