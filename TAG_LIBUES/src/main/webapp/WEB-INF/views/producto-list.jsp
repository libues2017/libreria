<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
 <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
 <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
  <title>Librería UES</title>
   
</head>
<body>
<div class="row"><%@include file="page_head_2.jsp" %></div>
	<div class="container">
		<div class="row">
		
		<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well" align="center">
                <a href="<c:url value='/producto-agregar' />" class="btn btn-primary">Nuevo Producto</a> |||
                <a href="<c:url value='/existencias' />" class="btn btn-primary">Reporte</a> |||
                <a href="<c:url value='/index' />" class="btn btn-primary"> Regresar</a>
            </div>
        </sec:authorize>
                
        <div class="panel panel-defaul">
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Lista de Productos</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Ítem</th>
                        <th>Imagen</th>
                        <th>Nombre de Producto</th>
                        <th>Código de Producto</th>
                        <th>Autor</th>
                        <th>Existencia</th>
                        <th>Precio</th>
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            <th width="100">Editar</th>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <th width="100">Eliminar</th>
                        </sec:authorize>
                        
                    </tr>
                </thead>
                
                <tbody>
                	<c:set var="contador" value="${0}" />
                	<c:forEach items="${productos}" var="producto">
                    	<tr>
                    		<c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	            <c:if test = "${salary > 2000}">
				    	        <c:set var="contador" value="${contador + 1}" />
				    	        <td>${contador}</td>
	                    		<td><a  href="<c:url value='/producto-detalle-${producto.codigoProducto }' />"><img  src="data:image/jpeg;base64,${producto.img}" height="100" width="75" /></a></td>
	                    		<td><a  href="<c:url value='/producto-detalle-${producto.codigoProducto }' />">${producto.nombreProducto}</a></td>
	                    		<td>${producto.correlativo}</td>
	                        	<td>
	                        	<c:forEach items="${producto.autores}" var="autor">
	                        		${autor.nombreautor}<br/> 
	                        	</c:forEach>
	                        	</td>	
	                        	<td>${producto.existencia}</td>	
	                        	<td>$${producto.precio}</td>
                        	</c:if>
                        	<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            	<td><a href="<c:url value='/edit-producto-${producto.codigoProducto }'/>"  class="btn btn-success custom-width">Editar</a></td>
                        	</sec:authorize>
                        	<sec:authorize access="hasRole('ADMINISTRADOR')">
                            	<td><a href="<c:url value='/delete-producto-${producto.codigoProducto}'/>"  class="btn btn-danger custom-width">Eliminar</a></td>
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