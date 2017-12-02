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
<title>Busqueda Productos</title>
</head>
<body>
	
	<div class="row"><%@include file="page_head.jsp" %></div>
	<div class="container">
		<div class="row"><%@include file="menu.jsp" %></div>
       	  
       	
       	<h3>Busqueda de Productos</h3>
       	<form:form method="POST" modelAttribute="busqueda" class="form-horizontal">
       	<div class="row">
       		
       		<div class="col-md-4">
       			Proveedor: 
	       		<form:select path="codigoproveedor"  multiple="false"  class="form-control input-sm" >
	       			<form:option value="0"  label="Todos los proveedores"/>
	       			<form:options items="${proveedores}"  itemValue="codigoproveedor"  itemLabel="nombreproveedor" />
	       		</form:select>
       		</div>
       		
       		<div class="col-md-4">
       			Editorial: 
	       		<form:select path="codigoeditorial"  multiple="false"  class="form-control input-sm" >
	       			<form:option value="0"  label="Todas las editoriales"/>
	       			<form:options items="${editoriales}"  itemValue="codigoeditorial" itemLabel="nombre"  />
	       		</form:select>
       		</div>
       		
       		<div class="col-md-4">
       			Autores: 
	       		<form:select path="codigoautor"  multiple="false"  class="form-control input-sm" >
	       			<form:option value="0"  label="Todas los autores"/>
	       			<form:options items="${autores}"  itemValue="codigoautor" itemLabel="nombreautor"  />
	       		</form:select>
       		</div>
       		
       		<div class="col-md-4">
       			Areas: 
	       		<form:select path="codigoarea"  multiple="false"  class="form-control input-sm" >
	       			<form:option value="0"  label="Todas las areas"/>
	       			<form:options items="${areas}"  itemValue="codigoarea" itemLabel="nombrearea"  />
	       		</form:select>
       		</div>
	       	
	       	<div class="col-md-4">
       			Tipo Producto: 
	       		<form:select path="codTipoProducto"  multiple="false"  class="form-control input-sm" >
	       			<form:option value="0"  label="Todos los Tipos de Producto"/>
	       			<form:options items="${tipoproductos}"  itemValue="codTipoProducto" itemLabel="tipoProducto"  />
	       		</form:select>
       		</div>
	       	
	       	       	
       	</div>
       	<br/>
       	<div class="row"><div class="col-md-4"><input type="submit" value="Buscar Producto" class="btn btn-primary"/> |||||
       	<a href="<c:url value='/index' />" class="btn btn-primary"> Regresar</a>
       	</div>
       	
       	
       	</div>
       
       	</form:form>
  
  	<c:set var="categories" value="${productos}" scope="session"/>
  	
  	<hr/>

       	<sec:authorize access="hasRole('ADMIN')">
            <div class="well">
                <a href="<c:url value='/producto-agregar' />" class="btn btn-primary">Nuevo Libro</a> |
                <a href="<c:url value='/index' />" class="btn btn-primary"> Regresar</a>
            </div>
        </sec:authorize>
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Resultados</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Imagen</th>
                        <th>Titulo</th>
                        <th>Autores</th>
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')" >
                        	<th>Area</th>
                        </sec:authorize>
                        <th>Proveedor</th>
                        <th>Editorial</th>
                        <th>Precio</th>
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                        <th>RESERVAR</th>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            <th width="100">EDITAR</th>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <th width="100">ELIMINAR</th>
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
                    		<td>
                        	<c:forEach items="${producto.autores}" var="autor">
                        		${autor.nombreautor}<br/> 
                        	</c:forEach>
                        	</td>	
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                        	<td>${producto.area.nombrearea}</td>
                        </sec:authorize>
                        <td>${producto.proveedor.nombreproveedor}</td>
                        <td>${producto.editorial.nombre}</td>
                        <td>$${producto.precio}</td>
                        
                        	<td><a href="<c:url value='/edit-reservas-${producto.codigoProducto }'/>"  class="btn btn-primary">Reservar</a></td>
                        
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
  <div class="row"><%@include file="foot.jsp" %></div>
</body>
</html>