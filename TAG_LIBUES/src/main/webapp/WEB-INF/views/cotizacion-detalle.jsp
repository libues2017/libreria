<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>   
</head>

<body Style="background-color:#97965B">
	<div class="row"><%@include file="page_head_2.jsp" %></div>
	<div class="container">	
    	<div class="row col-md-12">
      		<sec:authorize access="hasRole('ADMINISTRADOR')">
            	<div class="well" align="center">
                	<a href="<c:url value='/detallecotizacion-agregar' />" class="btn btn-primary">Realizar Cotización</a> ||||||
                	<a href="<c:url value='/index' />" class="btn btn-primary" > Menu principal</a> ||||||
                	<a href="<c:url value='/cotizacion-list' />" class="btn btn-primary" >Cotizaciones</a> 
            	</div>
        	</sec:authorize>     
        	
        	<div class="panel panel-default">      
            	<!-- Default panel contents -->
            	<div class="panel-heading">
            		<h3>Detalle de Cotización</h3>
            	</div>
            	
            	<table class="table table-hover">
	                <thead>
	                    <tr>                    	                 
	                        <th>Codigo Cotizacion</th>                        
	                        <th>Codigo Producto</th>
	                        <th>Nombre</th>
	                        <!--<th>Bodega</th>
	                        <th>Sala</th>
	                        <th>Costo</th>-->
	                        <th>Precio</th>
	                        <th>Cantidad</th>
	                        <th>Subtotal</th>
	                    </tr>
	                </thead>
                
                <tbody>
                	<c:forEach items="${detallecotizaciones}" var="detallecotizacion">
                    	<tr>                    	
                    	<td>${detallecotizacion.numeroDetalle}</td>
                    	<td>${detallecotizacion.codigoProducto}</td>	
                        <td>${detallecotizacion.nombreProducto}</td>
                        <!--<td>${detallerequisicion.bodega}</td>
                        <td>${detallerequisicion.sala}</td>
                        <td>$${detallerequisicion.costo}</td>-->
                        <td>$${detallecotizacion.valorUnitario}</td>
                        <td>${detallecotizacion.cantidad}</td>
                        <td>$${detallecotizacion.valorTotal}</td>
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