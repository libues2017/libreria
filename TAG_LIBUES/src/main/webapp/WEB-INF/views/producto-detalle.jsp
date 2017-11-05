<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Producto Detalle</title>
</head>
<body>
	<div class="row"><%@include file="page_head.jsp" %></div>
	<div class="container">
        
		<div class="row"><%@include file="menu.jsp" %></div>
	
	
	<div class="row">	
	
	<div class="panel panel-default">
  				<!-- Default panel contents -->
 				<div class="panel-heading"><h3>${producto.nombreProducto}</h3></div>
  				<div class="panel-body">
  					<div class="col-md-3">
    					<a href="#" class="thumbnail">
    		  				<img  src="data:image/jpeg;base64,${producto.img}" height="100%" width="100%" />
    					</a>
                    </div>
					<div class="col-md-1"></div>
					<div class="col-md-7">
						<table class="table">
							<tbody>
								<tr>
       								<th scope="row">Nombre Producto</th>
       								<td>${producto.nombreProducto}</td>
      							</tr>
      							<tr>
       								<th scope="row">Autor</th>
       								<td>
       									<c:forEach items="${producto.autores}" var="autor">
                        						${autor.nombreautor}<br/> 
                        				</c:forEach>
                       				 </td>
      							</tr>
      							<tr>
       								<th scope="row">Editorial</th>
       								<td>${producto.editorial.nombre}</td>
      							</tr>
      							
      							<tr>
       								<th scope="row">Precio</th>
       								<td>$ ${producto.precio}</td>
      							</tr>
      							<tr>   
                    	    		<td colspan="2">
                        				<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            				<a href="<c:url value='/edit-producto-${producto.codigoProducto}' />" class="btn btn-success custom-width">Editar</a>
                        				</sec:authorize>
                        				<sec:authorize access="hasRole('ADMINISTRADOR')">
                            				<a href="<c:url value='/delete-producto-${producto.codigoProducto}' />" class="btn btn-danger custom-width">Eliminar</a>
                        				</sec:authorize>
                        				
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