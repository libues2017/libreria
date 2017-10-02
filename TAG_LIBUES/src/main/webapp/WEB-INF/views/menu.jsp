<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu</title>
<link href="<c:url value='/static/css/bootstrap.min.css' />"  rel="stylesheet"></link>
<style type="text/css">body{
	background-color:#97965B;
}
</style>

</head>
<body>
	<nav class="navbar navbar-default">
	      <div class="container">
		        
		        <div class="navbar-header">
		          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		          </button>
		          <a class="navbar-brand" href="<c:url value='/index'/>">Librería UES</a>
		        </div>
		        
		     	<div class="collapse navbar-collapse" id="navbar-collapse-2">
			          <ul class="nav navbar-nav navbar-left">
			           

			        	<li class="dropdown">
			          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Areas <span class="caret"></span></a>
			          		<ul class="dropdown-menu">
			            		<li><a href="<c:url value="area-list" />">Lista de Areas</a></li>
			            		<sec:authorize access="hasRole('ADMINISTRADOR')"  >
			            			<li role="separator" class="divider"></li>
			            			<li><a href="<c:url value="area-agregar" />">Agregar nueva area</a></li>
			                 	</sec:authorize>
			          		</ul>
			 			</li>
			        	
			        	<li class="dropdown">
			          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Autores <span class="caret"></span></a>
			          		<ul class="dropdown-menu">
			            		<li><a href="<c:url value="autor-list" />">Lista de Autores</a></li>
			            		<sec:authorize access="hasRole('ADMINISTRADOR')"  >
			            			<li role="separator" class="divider"></li>
			            			<li><a href="<c:url value="autor-agregar" />">Agregar nuevo autor</a></li>
			                 	</sec:authorize>
			          		</ul>
			      		</li>
						  <li class="dropdown">
          					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Productos <span class="caret"></span></a>
          					<ul class="dropdown-menu">
            					<li><a href="<c:url value="producto-list" />">Catalago</a></li>
            					<li><a href="<c:url value="producto-busqueda" />">Busqueda de Productos</a></li>
            					<li><a href="<c:url value="existencias" />">Reporte de Existencias</a></li>
            					
            					<sec:authorize access="hasRole('ADMINISTRADOR')"  >
            						<li role="separator" class="divider"></li>
            						<li><a href="<c:url value="producto-agregar" />">Agregar nuevo</a></li>
           						</sec:authorize>
          					</ul>
        				</li>

			      		<sec:authorize access="hasRole('ADMINISTRADOR')"  >
			      		<li class="dropdown">
			          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Inventario<span class="caret"></span></a>
			          		<ul class="dropdown-menu">			            		
			            		<li><a href="<c:url value="localizacion-list" />">Ubicacion de productos</a></li>			                 	
			          			<li role="separator" class="divider"></li>
			            		<li><a href="<c:url value="detallerequisicion-list" />">Requisiciones</a></li>
			            		<li role="separator" class="divider"></li>
			            		<li><a href="<c:url value="detalletransferencia-list" />">Transferencia</a></li>		                 	
			          		</ul>
			      		</li>
			        	</sec:authorize>        	
			        	<sec:authorize access="hasRole('ADMINISTRADOR')"  >
				        	<li><a href="<c:url value="proveedor-list" />">Proveedores</a></li>
				        	<li><a href="<c:url value="editorial-list" />">Editoriales</a></li>
				        	<li><a href="<c:url value="tipo-list" />">Tipo Producto</a></li>
				  		</sec:authorize>
			        	
			        	<sec:authorize access="hasRole('ADMINISTRADOR')"  >
           				 <li class="dropdown">
          					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Retaceo <span class="caret"></span></a>
          		
          					<ul class="dropdown-menu">
          			
            				<li><a href="<c:url value="detalleretaceo-list" />">Lista de Retaceos</a></li>
           					<li><a href="<c:url value="detalleretaceo-agregar" />">Agregar nuevo retaceo</a></li>
           					<li><a href="<c:url value="/vol_ent" />">Reporte mensual de retaceo</a></li>
           		
          				</ul>
          	
        	</li>
        	</sec:authorize>
			        	
			            <!--<sec:authorize access="hasRole('ADMIN')"  >
			            	<li class="dropdown">
			          			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Eventos <span class="caret"></span></a>
			          		
			          			<ul class="dropdown-menu">
			          				<li><a href="<c:url value="evento-proximos" />">Eventos proximos</a></li>
			            			<li><a href="<c:url value="evento-list" />">Lista de eventos</a></li>
			           				<li><a href="<c:url value="evento-agregar" />">Agregar nuevo</a></li>
			          			</ul>
			          	
			        		</li>
			        	</sec:authorize>-->
			        	
			        	<!--<sec:authorize access="isAuthenticated()" var="isAuthenticated" />
							<c:if test="${not isAuthenticated}">
			            		<li><a href="<c:url value="evento-proximos" />">Eventos</a></li>
			            	</c:if>
			            
			            <li><a href="<c:url value="quienesSomos" />">Quienes Somos</a></li>-->
			           	
			           	<sec:authorize access="hasRole('ADMINISTRADOR')"  >
			            		<li><a href="<c:url value="list" />">Usuarios</a></li>
			           	</sec:authorize>
			            
			            <!--<li>
			            	<sec:authorize access="hasRole('USER')"  >
								<a   href="<c:url value="/login" />">Pedidos</a>
							</sec:authorize>
						</li>-->
			
			          </ul>
		          
		        </div><!-- /.navbar-collapse -->
	      </div><!-- /.container -->
    </nav><!-- /.navbar -->


 <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
</body>
</html>