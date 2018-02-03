<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Reservación de Libros</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

</head>
<body>
<div class="row"><%@include file="page_head_2.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<div class="row">
<!--<h1>Tipos</h1>-->
<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well">                
                <a href="<c:url value='/index' />" class="btn btn-primary"> Regresar</a>
            </div>
        </sec:authorize>
<!--<div class="col-xs-8">-->
	
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Lista de Libros Reservados</span></div>
	<table class="table table-striped ">
		<thead>
    		<tr >
    			<th>CÓDIGO</th>
    			<th>TÍTULO</th>
    			<th>PRECIO</th>
    			<th>NOMBRE CLIENTE</th>
    			<th>DUI</th>
    			<th>FECHA FIN</th>
    			<th>OPCIONES</th>
      			
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${reservas}" var="reservas">
    		<tr >
    			<td>${reservas.codigoproducto}</td>
    			<td>${reservas.nombreproducto}</td>
    			<td>${reservas.precio}</td>
    			<td>${reservas.nombre}</td>
    			<td>${reservas.dui}</td>
    			<td>${reservas.fechafin}</td>
    			
                <sec:authorize access="hasRole('ADMINISTRADOR')">
                	<td><a href="<c:url value='/delete-reserva-${reservas.idreservas}' />" class="btn btn-danger custom-width">Eliminar</a></td>
               	</sec:authorize>
    		</tr>
    	</c:forEach>
    	</tbody>
	</table><br/>
	</div>
	
	
</div>


</div>
<br/><br/>
<div class="row"><%@include file="foot.jsp" %></div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
</body>
</html>