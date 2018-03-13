<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Producto Detalle</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="row"><%@include file="page_head_2.jsp" %></div>
	<br>
	<div class="container">
        
	<div class="row">	
	
	<div class="panel panel-default">
  				<!-- Default panel contents -->
  				<div class="panel-body">
  					<div class="col-md-3">
  						<p>Portada</p>
    					<a href="#" class="thumbnail">
    		  				<img  src="data:image/jpeg;base64,${producto.img}" height="100%" width="100%" />
    					</a>
    					<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
	    					<p>Contraportada</p>
	    					<a href="#" class="thumbnail">
	    		  				<img  src="data:image/jpeg;base64,${producto.imgc}" height="100%" width="100%" />
	    					</a>
    					</sec:authorize>
                    </div>
                  
					<div class="col-md-1"></div>
					<div class="col-md-7">
						<table class="table table-striped">
							<tbody>
								<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
									<tr>
	       								<th scope="row">Código Producto:</th>
	       								<td>${producto.correlativo}</td>
	      							</tr>
      							</sec:authorize>
								<tr>
       								<th scope="row">Título:</th>
       								<td>${producto.nombreProducto}</td>
      							</tr>
      							<tr>
       								<th scope="row">Área:</th>
       								<td>${producto.area.nombrearea}</td>
      							</tr>
      							<tr>
       								<th scope="row">Autor:</th>
       								<td>
       									<c:forEach items="${producto.autores}" var="autor">
                        						${autor.nombreautor}<br/> 
                        				</c:forEach>
                       				 </td>
      							</tr>
      							<tr>
       								<th scope="row">Editorial:</th>
       								<td>${producto.editorial.nombre}</td>
      							</tr>
      							
      							<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
	      							<tr>
	       								<th scope="row">Proveedor:</th>
	       								<td>${producto.proveedor.nombreproveedor}</td>
	      							</tr>      							
	      							<tr>
	       								<th scope="row">Bodega:</th>
	       								<td>${producto.existencia}</td>
	      							</tr>
	      							<tr>
	       								<th scope="row">Sala:</th>
	       								<td>${producto.sala}</td>
	      							</tr>
	      							<tr>
	       								<th scope="row">Unidad:</th>
	       								<td>${producto.unidadMedida}</td>
	      							</tr>
	      							<tr>
	       								<th scope="row">ISBN:</th>
	       								<td>${producto.isbn}</td>
	      							</tr>
	      							<tr>
	       								<th scope="row">Fecha de Creación:</th>
	       								<td>${producto.fechaCreacion}</td>
	      							</tr>
      							</sec:authorize>
      							<tr>
       								<th scope="row">Precio:</th>
       								<td>$ ${producto.precio}</td>
      							</tr>
      							<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
	      							<tr>
	       								<th scope="row">Costo:</th>
	       								<td>$ ${producto.costounitario}</td>
	      							</tr>
      							</sec:authorize>
      							<tr>
       								<th scope="row">Tipo Producto:</th>
       								<td>${producto.tipoProducto}</td>
      							</tr>
      							<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
	      							<tr>
	       								<th scope="row">Especifico de Gastos:</th>
	       								<td>${producto.especificoGastos}</td>
	      							</tr>
      							</sec:authorize>
      							<tr>
       								<th scope="row">País:</th>
       								<td>${producto.pais}</td>
      							</tr>
      							<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
	      							<tr>
	       								<th scope="row">Consignación:</th>
	       								<td>${producto.consignacion}</td>
	      							</tr>
      							</sec:authorize>
      							<tr>   
                    	    		<td colspan="2" align="center">
                    	    			<a href="<c:url value='/edit-reservas-${producto.codigoProducto }'/>"  class="btn btn-primary">Reservar</a>
                        				<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            				<a href="<c:url value='/edit-producto-${producto.codigoProducto}' />" class="btn btn-success custom-width">Editar</a>
                        				</sec:authorize>
                        				<sec:authorize access="hasRole('ADMINISTRADOR')">
                            				<a href="<c:url value='/delete-producto-${producto.codigoProducto}' />" class="btn btn-danger custom-width">Eliminar</a>
                        				</sec:authorize>
                        				
                            				<a href="<c:url value='/producto-list' />" class="btn btn-primary"> Regresar</a>
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