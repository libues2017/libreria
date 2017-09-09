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
		<div class="row">
			<!--<h1>Autores</h1>-->
			<sec:authorize access="hasRole('ADMINISTRADOR')">
            	<div class="well">
                	<a href="<c:url value='/autor-agregar' />" class="btn btn-primary">Nuevo Autor</a> |
                	<a href="<c:url value='/index' />"> Regresar</a>
            	</div>
        	</sec:authorize>

			<!--<div class="col-xs-8">-->
	 		<div class="row col-md-12">
        		<div class="panel panel-default">
              	<!-- Default panel contents -->
            	<div class="panel-heading"><span class="lead">Autores</span></div>
				<table class="table table-striped ">
					<thead>
    					<tr >
    						<th>Codigo</th>
    						<th>Nombre de Autor</th>
    						<th>Opciones</th>
    					</tr>
    				</thead>
    	
    				<tbody>
    					<c:forEach items="${autor}" var="autores">
    						<tr >
    							<td>${autores.codigoautor}</td>
    							<td>${autores.nombreautor}</td>    			
                				
                				<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            		<td><a href="<c:url value='/edit-autor-${autores.codigoautor}' />" class="btn btn-success custom-width">Editar</a></td>
                        		</sec:authorize>
                        
                        		<sec:authorize access="hasRole('ADMINISTRADOR')">
                            		<td><a href="<c:url value='/delete-autor-${autores.codigoautor}' />" class="btn btn-danger custom-width">Eliminar</a></td>
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