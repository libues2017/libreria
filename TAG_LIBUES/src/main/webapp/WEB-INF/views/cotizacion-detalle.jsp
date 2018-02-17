<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Detalle de Cotización</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>   

	<style>
		p.normal {
    		font-weight: normal;
		}

		p.light {
    		font-weight: lighter;
		}

		p.thick {
    		font-weight: bold;
		}

		p.thicker {
    		font-weight: 900;
		}
	</style>
	
	<Style>
		.control-label {
			text-align: left;
		}
		
		invalid {
			border: 2px solid #ff0000;
		}
	</Style>

</head>

<body Style="background-color:#97965B">
	<div class="row"><%@include file="page_head_2.jsp" %></div>
	<div class="container">
	<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading"><h3>COTIZACIÓN: ${cotizacion.codigoCotizacion}</h3></div>
  		<p></p>
  		<div class="panel-body">
  			<div class="col-md-3"></div>
  			<div class="col-md-6" align="center">
  			<table class="table table-striped">
  				<tbody>
  					<tr>
	       				<th scope="row">Número de Cotización:</th>
	       				<td>${cotizacion.codigoCotizacion}</td>
	      			</tr>
	      			<tr>
	       				<th scope="row">Nombre del Cliente:</th>
	       				<td>${cotizacion.nombreCliente}</td>
	      			</tr>
	      			<tr>
	       				<th scope="row">Teléfono:</th>
	       				<td>${cotizacion.telefono}</td>
	      			</tr>
	      			<tr>
	       				<th scope="row">Correo:</th>
	       				<td>${cotizacion.correo}</td>
	      			</tr>
	      			<tr>
	       				<th scope="row">Fecha:</th>
	       				<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${cotizacion.fechaCotizacion}"/></td>
	      			</tr>
	      			<tr>
	       				<th scope="row">Total:</th>
	       				<td>$ ${cotizacion.total}</td>
	      			</tr>
  				</tbody>
  			</table>
  		</div>
	</div>
	
	<p class="thick" align="center">DETALLE DE LOS PRODUCTOS</p>
	<table class="table table-striped ">
		<thead>
			<tr class="success">
				<th>ÍTEM</th> 			
				<th>Código Producto</th>
				<th>Nombre Producto</th>			      			      			
				<th>Cantidad</th>
				<th>Precio</th>
				<th>SubTotal</th>			      				
			</tr>
		</thead>
		<tbody>
			<c:set var="contador" value="${0}"/>
			<c:forEach items="${cotiza1}" var="cotizaciones">
				<tr class="info">
				<c:set var="salary" scope="session" value="${2000*2}"/>
				<c:if test="${salary > 2000 }">
					<c:set var="contador" value="${contador + 1}" />	
			    	<td>${contador}</td>
					<td>${cotizaciones.codigoProducto}</td>				    		
					<td>${cotizaciones.nombreProducto}</td>
					<td>${cotizaciones.cantidad}</td>
					<td>$ ${cotizaciones.valorUnitario}</td>
					<td>$ ${cotizaciones.valorTotal}</td>
				</c:if>
	            </tr>
			</c:forEach>
		</tbody>
	</table>
	</div>	
    
    <form class="form-horizontal" role="form" action="<c:url value="/repo_requisiciones" />" target="_blank">
    	<div class="form-group">
        	<div class="col-sm-offset-6 col-sm-10">
            	<button type="submit" class="btn btn-primary">Imprimir Cotización</button>
                <a class="btn btn-danger" href="<c:url value="/cotizacion-list" />" role="button">Lista de Cotizaciones</a>
             </div>

				<input type="hidden" value="${loggedinuser}" name="usuario"/>
				<input type="hidden" value="Cotizaciones.jasper" name="nombre"/>
            </div>
	</form>	  	  	
    </div>
    </div>
  <div class="row"><%@include file="foot.jsp" %></div>
</body>
</html>