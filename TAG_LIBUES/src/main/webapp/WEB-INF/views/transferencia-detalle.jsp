<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transferencia Detalle</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<body>
	<div class="row"><%@include file="page_head_2.jsp" %></div>	
	<div class="container">        
	<div class="row">		
	<div class="panel panel-default">
  				<!-- Default panel contents-->
  				<div class="panel-heading"><h3>TRANSFERENCIA: ${transferencia.codTransferencia}</h3></div>
  				<p></p>
  				<div class="panel-body">
					<div class="col-md-3"></div>
					<div class="col-md-6" align="center">
						<table class="table table-striped" >
							<tbody>
								<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
									<tr>
	       								<th scope="row">Transferencia Número:</th>
	       								<td>${transferencia.numeroTransferencia}</td>
	      							</tr>
      							</sec:authorize>
								<tr>
       								<th scope="row">Tipo:</th>
       								<td>${transferencia.tipoTransferencia}</td>
      							</tr>
      							<tr>
       								<th scope="row">Sucursal:</th>
       								<td>${transferencia.sucursal}</td>
      							</tr>
      							<tr>
       								<th scope="row">Fecha:</th>
       								<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${transferencia.fechaTransferencia}"/></td>
      							</tr>
      							<tr>
       								<th scope="row">Total:</th>
       								<td>$ ${transferencia.total}</td>
      							</tr>
      						</tbody>
      					</table>
    
  					</div>
  					
  					
  				</div>
  				<p class="thick" align="center">DETALLE DE LOS PRODUCTOS TRANSFERIDOS</p>
  					<table class="table table-striped ">
					<thead>
						<tr class="success">
							<th>Código</th>
							<th>Título</th>
							<th>Cantidad</th>
							<th>Costo</th>
							<th>Precio</th>
							<th>SubTotal</th>
							
						</tr >
					</thead>
					
					<tbody>						
						<c:forEach items="${transferencia2}" var="transferencias">
						<tr class="info">							
									<td>${transferencias.codProducto}</td>
									<td>${transferencias.nomProducto}</td>
									<td>${transferencias.cantidadProducto}</td>
									<td>$${transferencias.costoProducto}</td>
									<td>$${transferencias.precioProducto}</td>
									<td>$${transferencias.subTotal}</td>
						</tr>
						</c:forEach>
						
						
					</tbody>
				</table>

			</div>
	<form class="form-horizontal" role="form" action="<c:url value="/repo_UltimaTransferencia" />" target="_blank">

            <div class="form-group">

            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-10">
                    <button type="submit" class="btn btn-primary">Imprimir Transferencia</button>
                    <a class="btn btn-danger" href="<c:url value="/transferencia-list" />" role="button">Lista de Transferencias</a>
                </div>

				<input type="hidden" value="${loggedinuser}" name="usuario"/>
				<input type="hidden" value="TransferenciasUltima.jasper" name="nombre"/>
            </div>
	</form>		
	</div>
	
	
	
	<!-- 
	<div class="form-group">
	    <div class="col-sm-offset-6 col-sm-10">
	    	<button type="submit" class="btn btn-primary">Imprimir Transferencia</button>
			<a href="<c:url value='/transferencia-list' />" class="btn btn-primary"> Regresar</a>
			<input type="hidden" value="${loggedinuser}" name="usuario"/>
			<input type="hidden" value="Factura.jasper" name="nombre"/>
		</div>
	</div>
	-->
</div>	
<div class="row"><%@include file="foot.jsp" %></div>	
</body>
</html>