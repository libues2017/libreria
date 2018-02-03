<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

</head>
<body>
<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<div class="row">
	<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
    <div class="well">
    <a href="<c:url value='/tipo-agregar' />" class="btn btn-primary">Crear Tipo Producto</a> |||
	<a href="<c:url value='/index' />" class="btn btn-primary"> Regresar</a>
    </div>
	</sec:authorize>
	 <div class="row col-md-10">
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Tipo de Productos</span></div>
	<table class="table table-striped ">
		<thead>
    		<tr >
    			<th>CÓDIGO</th>
    			<th>TIPO DE PRODUCTO</th>
    			<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
    			<th>EDITAR</th>
    			</sec:authorize>
    			<sec:authorize access="hasRole('ADMINISTRADOR')">
    			<th>ELIMINAR</th>
    			</sec:authorize>
      			
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${tipo}" var="tipos">
    		<tr >
    			<td>${tipos.codTipoProducto}</td>
    			<td>${tipos.tipoProducto}</td>
    			
                <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                <td><a href="<c:url value='/edit-tipo-${tipos.codTipoProducto}' />" class="btn btn-success custom-width">Editar</a></td>
                </sec:authorize>
                <sec:authorize access="hasRole('ADMINISTRADOR')">
                <td><a href="<c:url value='/delete-tipo-${tipos.codTipoProducto}' />" class="btn btn-danger custom-width">Eliminar</a></td>
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
<div class="row"><%@include file="foot.jsp" %></div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
</body>
</html>