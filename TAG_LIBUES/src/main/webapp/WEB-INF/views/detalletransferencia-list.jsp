<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lista de Transferencias</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
<div class="row"><%@include file="page_head.jsp"%></div>
<div class="container">
	<div class="row"><%@include file="menu.jsp"%></div>
	<!-- <div class="row"> <%@include file="authheader.jsp" %></div>-->
	
	<div class="row">
		
		<sec:authorize access="hasRole('ADMINISTRADOR')">
			<div class="well">
				<a href="<c:url value='/detalletransferencia-agregar' />" class="btn btn-primary">Agregar Transferencia</a> | 
				<a href="<c:url value='/index' />"> Regresar</a>
			</div>
		</sec:authorize>
		
		<div class="panel panel-default">
			<div class="panel panel-default">
				
				<div class="panel-heading">
					<span class="lead">Transferencias</span>
				</div>
				
				<table class="table table-striped ">
					<thead>
						<tr>
							<th>CODIGO</th>
							<th>TITULO</th>
							<th>CANTIDAD</th>
							<th>COSTO</th>
							<th>PRECIO</th>
							<th>SUBTOTAL</th>
							<!-- <th>OPCIONES</th>-->
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${detalletransferencias}" var="transferencias">
							<tr>
								<td>${transferencias.codDetalleTransferencia}</td>
								<td>${transferencias.nomProducto}</td>
								<td>${transferencias.cantidadProducto}</td>
								<td>$${transferencias.costoProducto}</td>
								<td>$${transferencias.precioProducto}</td>
								<td>$${transferencias.subTotal}</td>

								<!--  
								<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
									<td>
										<a href="<c:url value='/edit-transferencia-${transferencia.codDetalleTransferencia}' />"
										class="btn btn-success custom-width">Editar</a>
									</td>
								</sec:authorize>
									
								<sec:authorize access="hasRole('ADMINISTRADOR')">
									<td>
										<a href="<c:url value='/delete-transferencia-${transferencia.codDetalleTransferencia}' />"
										class="btn btn-danger custom-width">Eliminar</a>
									</td>
								</sec:authorize>
								-->
							</tr>
						</c:forEach>
					</tbody>
				</table><br />
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