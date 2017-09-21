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
       	  
  
       	<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well">
                <a href="<c:url value='/producto-agregar' />" class="btn btn-primary">Nuevo Producto</a> |
                <a href="<c:url value='/existencias' />" class="btn btn-primary">Reporte</a>
                <a href="<c:url value='/index' />"> Regresar</a>
            </div>
        </sec:authorize>
        
        <div class="row col-md-12">
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Lista de Productos</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Nombre de Producto</th>
                        <th>Codigo de Producto</th>
                        <th>Autor</th>
                        <th>Existencia</th>
                        <th>Precio</th>
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            <th width="100"></th>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <th width="100"></th>
                        </sec:authorize>
                         
                    </tr>
                </thead>
                
                <tbody>
                	<c:forEach items="${productos}" var="producto">
                    	<tr>
                    		<td><a  href="<c:url value='/producto-detalle-${producto.codigoProducto }' />">${producto.nombreProducto}</a></td>
                    		<td>${producto.correlativo}</td>
                        	<td>
                        		<c:forEach items="${producto.autores}" var="autor">
                        			${autor.nombreautor}<br/> 
                        		</c:forEach>
                        	</td>	
                        	<td>${producto.existencia}</td>	
                        	<td>$${producto.precio}</td>
                        
                        	<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            	<td><a href="<c:url value='/edit-producto-${producto.codigoProducto }' />" class="btn btn-success custom-width">Editar</a></td>
                        	</sec:authorize>
                        
                        	<sec:authorize access="hasRole('ADMINISTRADOR')">
                            	<td><a href="<c:url value='/delete-producto-${producto.codigoProducto}' />" class="btn btn-danger custom-width">Eliminar</a></td>
                        	</sec:authorize>
                    	</tr>
                	</c:forEach>
                </tbody>
            </table>
        	</div>
        </div>
    </div>
  <div class="row"><%@include file="foot.jsp" %></div>
 <!--<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>-->
</body>
</html>