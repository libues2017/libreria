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
<!--<h1>Proveedores</h1>-->
<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well">
                <a href="<c:url value='/proveedor-agregar' />" class="btn btn-primary">Agregar Proveedor</a> |
                <a href="<c:url value='/index' />"> Regresar</a>
            </div>
 </sec:authorize>
 <div class="panel panel-default">
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Proveedores</span></div>
<!--<div class="col-xs-10">-->
	<table class="table table-striped ">
		<thead>
    		<tr >
    			<th>CODIGO</th>
    			<th>NOMBRE DE PROVEEDOR</th>
    			<th>DIRECCION</th>
    			<th>TELEFONO</th>
    			<th>CONTACTO</th>    			    			
    			<th>OPCIONES</th>
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${proveedores}" var="proveedor">
    		<tr >
    			<td>${proveedor.codigoproveedor}</td>
    			<td>${proveedor.nombreproveedor}</td>
    			<td>${proveedor.direccion}</td>
    			<td>${proveedor.telefonoproveedor}</td>
    			<td>${proveedor.contactoproveedor1}</td>    			
    			
    			                
                <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            <td><a href="<c:url value='/edit-proveedor-${proveedor.codigoproveedor}' />" class="btn btn-success custom-width">Editar</a></td>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <td><a href="<c:url value='/delete-proveedor-${proveedor.codigoproveedor}' />" class="btn btn-danger custom-width">Eliminar</a></td>
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