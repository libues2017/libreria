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
  				<div class="panel-heading"><h3>FACTURA: ${factura.numerofactura}</h3></div>
  				<div class="panel-body">
					<div class="col-md-3"></div>
					<div class="col-md-6">
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
       								<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${factura.fechafactura}"/></td>
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
       								<th scope="row">Total:</th>
       								<td>$ ${factura.total}</td>
      							</tr>  	
      						
      						</tbody>
      					</table>
    
  					</div>
  					<table class="table table-striped">
				<thead>
		    		<tr class="success">			
			      			<th>Código</th>
			      			<th>Título</th>	      			
			      			<th>Cantidad</th>
			      			<th>Precio $</th>
			      			<th>Subtotal $</th>
			      	</tr>
		    	</thead>
		    	<tbody>
		    	      <c:forEach items="${facturas}" var="facturas" >
				    		<tr class="info">
				    			<td>${facturas.codigoproducto}</td>
				    			<td>${facturas.nombreproducto}</td>
				    			<td>${facturas.cantidad}</td>				    		    
				    			<td>$ ${facturas.precio}</td>
				    			<td>$ ${facturas.subtotalfactura}</td>	    			
				    	</tr>
				    	 </c:forEach>
		    	</tbody>
	    </table>
  				</div>

			</div>
			
	</div>
<form class="form-horizontal" role="form" action="<c:url value="/repo_factura" />" target="_blank">
	    <div class="form-group" align="left">
            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-10">
                    <button type="submit" class="btn btn-primary">Imprimir Factura</button>
                    <a href="<c:url value='/factura-list' />" class="btn btn-primary"> Regresar</a>
                </div>
				<input type="hidden" value="${loggedinuser}" name="usuario"/>
				<input type="hidden" value="Factura.jasper" name="nombre"/>
            </div>
</form>
	</div>
	
<div class="row"><%@include file="foot.jsp" %></div>	
</body>
</html>