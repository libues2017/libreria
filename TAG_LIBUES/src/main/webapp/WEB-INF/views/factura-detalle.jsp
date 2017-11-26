<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Factura Detalle</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="row"><%@include file="page_head_2.jsp" %></div>	
	<div class="container">        
	<div class="row">		
	<div class="panel panel-default">
  				<!-- Default panel contents -->
  				<div class="panel-heading"><h3>ELIMINAR FACTURA: ${factura.numerofactura}</h3></div>
  				<div class="panel-body">
					<div class="col-md-1"></div>
					<div class="col-md-7">
						<table class="table table-striped">
							<tbody>
								<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
									<tr>
	       								<th scope="row">Factura:</th>
	       								<td>${factura.numerofactura}</td>
	      							</tr>
      							</sec:authorize>
								<tr>
       								<th scope="row">Fecha:</th>
       								<td>${factura.fechafactura}</td>
      							</tr>
      							<tr>
       								<th scope="row">Forma de pago:</th>
       								<td>${factura.tipofactura}</td>
      							</tr>
      							
      							<tr>
       								<th scope="row">Cliente:</th>
       								<td>${factura.cliente}</td>
      							</tr>   	
      							
      							<tr>   
                    	    		<td colspan="2" align="center">
                        				<sec:authorize access="hasRole('ADMINISTRADOR')">
                            				<a href="<c:url value='/cambio-estado-factura-${factura.idfactura}' />" class="btn btn-danger custom-width">Eliminar</a>
                        				</sec:authorize>                        				
                            				<a href="<c:url value='/factura-list' />" class="btn btn-primary"> Regresar</a>
                        			</td>
                        			
                    </tr>
                    
      						</tbody>
      					</table>
  					</div>
  				</div>
			</div>
	</div>
	
	</div>
	
<div class="row"><%@include file="foot.jsp" %></div>	
</body>
</html>