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
	<script src="/static/js/jquery-3.1.1.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
	<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
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
				<sec:authorize access="hasRole('ADMINISTRADOR')"  >
					<li class="dropdown">
			        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Ingreso <span class="caret"></span></a>
			          	<ul class="dropdown-menu">
			          		<li><a href="<c:url value="tipo-list" />">Tipo Producto</a></li>			          			
			          		<li role="separator" class="divider"></li>
			          		<li class="dropdown-submenu">
			          		<a class="test" tabindex="-1" href="#">Áreas <span class="caret"></span></a>
			          		<ul class="dropdown-menu">
			            		<li><a href="<c:url value="area-list" />">Lista de Áreas</a></li>
			            		
			            			<li role="separator" class="divider"></li>
			            				<li><a href="<c:url value="area-agregar" />">Agregar Área</a></li>
			            			<li role="separator" class="divider"></li>
			            				<li><a href="<c:url value="area-list-deleted" />">Restaurar Áreas</a></li>
			                 	
			          		</ul>
			          		
			          		<li role="separator" class="divider"></li>	
				        	<li class="dropdown-submenu">
			          		<a class="test" tabindex="-1" href="#">Proveedores <span class="caret"></span></a>
			            	<ul class="dropdown-menu">
			            		
			            			<li><a href="<c:url value="proveedor-list" />">Lista de Proveedores</a></li>
			            			<li role="separator" class="divider"></li>
			            			<li><a href="<c:url value="proveedor-agregar" />">Agregar Proveedor</a></li>			            			
			                 	
			          		</ul>  		
				        	<li role="separator" class="divider"></li>
				        	<li><a href="<c:url value="editorial-list" />">Editoriales</a></li>
				        	<li role="separator" class="divider"></li>
				        	<li class="dropdown-submenu">
			          		<a class="test" tabindex="-1" href="#">Autores <span class="caret"></span></a>
			          		<ul class="dropdown-menu">
				            	<li><a href="<c:url value="autor-list" />">Lista de Autores</a></li>
				            	<sec:authorize access="hasRole('ADMINISTRADOR')"  >
				            		<li role="separator" class="divider"></li>
				            		<li><a href="<c:url value="autor-agregar" />">Agregar Autor</a></li>
			                 	</sec:authorize>
			          		</ul>			          			
			          	</ul>
				 	</li>
			</sec:authorize>	
					<li class="dropdown">
          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Productos <span class="caret"></span></a>
          				<ul class="dropdown-menu">
            				<li><a href="<c:url value="producto-list" />">Catálago</a></li>
            				<li role="separator" class="divider"></li>
            				<li><a href="<c:url value="producto-busqueda" />">Busqueda de Productos</a></li>
            				<li role="separator" class="divider"></li>
            				<sec:authorize access="hasRole('ADMINISTRADOR')"  >
            				<li class="dropdown-submenu">
			          		<a class="test" tabindex="-1" href="#">Retaceo de Productos <span class="caret"></span></a>
			          		<ul class="dropdown-menu">			            		
			            			<li><a href="<c:url value="detalleretaceo-list" />">Lista de Retaceos</a></li>
            						<li role="separator" class="divider"></li>
           							<li><a href="<c:url value="detalleretaceo-agregar" />">Agregar nuevo retaceo</a></li>
			          		</ul>
			          		</sec:authorize>
            	
            				<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO') or hasRole('USUARIO')"  >
            					<li><a href="<c:url value="cotizacion-list" />">Cotizaciones</a></li>
           					</sec:authorize>
          				</ul>
        			</li>
        				
        			<sec:authorize access="hasRole('ADMINISTRADOR')"  >
        				<li class="dropdown">
          					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Facturación <span class="caret"></span></a>
          					<ul class="dropdown-menu">
            					<li><a href="<c:url value="detallefacturacion-agregar" />">Facturar</a></li>
            					<li role="separator" class="divider"></li>
            					<li><a href="<c:url value="factura-list" />">Listar Facturas</a></li>
            					<li role="separator" class="divider"></li>
            					<li><a href="<c:url value="numero-factura" />">Establer Numero Factura</a></li>
           					</ul>
        				</li>
        			</sec:authorize>

			 		<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO')"  >
			      		<li class="dropdown">
			          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Inventario<span class="caret"></span></a>
			          		<ul class="dropdown-menu">
			          			<sec:authorize access="hasRole('ADMINISTRADOR') "  >			            		
			            		<li><a href="<c:url value="localizacion-list" />">Ubicación de productos</a></li>
			            		</sec:authorize>			                 	
			          			<!--<li role="separator" class="divider"></li>
			            		<li><a href="<c:url value="detallerequisicion-list" />">Requisiciones</a></li> -->			            		
			            		<li role="separator" class="divider"></li>
			            		<sec:authorize access="hasRole('BODEGUERO') or hasRole ('ADMINISTRADOR')"  >
			            		<li><a href="<c:url value="requisicion-list" />">Requisiciones</a></li>
			            		<li role="separator" class="divider"></li>
			            		<li><a href="<c:url value="transferencia-list" />">Transferencias</a></li>
			            		</sec:authorize>
			            		<sec:authorize access="hasRole('ADMINISTRADOR') "  >
			            		<li role="separator" class="divider"></li>
			            		<li class="dropdown-submenu">
			          			<a class="test" tabindex="-1" href="#">Reportes <span class="caret"></span></a>
			            		<ul class="dropdown-menu">			            			
				            			<li><a href="<c:url value="transferencias" />">Reporte de Transferencias</a></li>
				            			<li role="separator" class="divider"></li>
	            						<li><a href="<c:url value="kardex" />">Reporte de Kárdex</a></li>
				            			<li role="separator" class="divider"></li>
				            			<li><a href="<c:url value="existencias" />">Reporte de Existencias</a></li>
				            			<li role="separator" class="divider"></li>
	           							<li><a href="<c:url value="/reporte-retaceo" />">Reporte Mensual de Retaceo</a></li>			                 		
			          			</ul>
			            		<li role="separator" class="divider"></li>
			            		<li><a href="<c:url value="downloadExcel" />">Comparación de Inventario</a></li>
			            			<li><a href="<c:url value="generarEtiquetas" />">Generar etiquetas</a></li>				                 	
			          			</sec:authorize>
			          		</ul>
			      		</li>
					</sec:authorize>
					<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO') "  >
        				<li class="dropdown">
			          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Reportes<span class="caret"></span></a>
			          		<ul class="dropdown-menu">
			          			<sec:authorize access="hasRole('BODEGUERO')"  >			          			
			            			<li><a href="<c:url value="transferencias" />">Reporte de Transferencias</a></li>
			            		</sec:authorize>
			            			<li role="separator" class="divider"></li>
			            			<li><a href="<c:url value="kardex" />">Reporte de Kárdex</a></li>
			            			<li role="separator" class="divider"></li>
			            			<li><a href="<c:url value="existencias" />">Reporte de Existencias</a></li>
			            			<li role="separator" class="divider"></li>
	           							<li><a href="<c:url value="/reporte-retaceo" />">Reporte Mensual de Retaceo</a></li>
			          		</ul>			          			
				        </li>
					</sec:authorize>
					
        			<sec:authorize access="hasRole('ADMINISTRADOR')">
        				<li class="dropdown">
			          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Matenimiento<span class="caret"></span></a>
			          		<ul class="dropdown-menu">
			          			<sec:authorize access="hasRole('ADMINISTRADOR')"  >
			            			<li><a href="<c:url value="list" />">Usuarios</a></li>
			            			<li role="separator" class="divider"></li>
			            			<li><a href="<c:url value="backup-crear" />">Respaldo Base de Datos</a></li>
			            			<li role="separator" class="divider"></li>
			            			<li><a href="<c:url value="reservaciones-list" />">Listado de Reservas de Libros</a></li>			            			
			           			</sec:authorize>
			          		</ul>			          			
				        </li>
					</sec:authorize>
				</ul>
		    </div><!-- /.navbar-collapse -->
	 	</div><!-- /.container -->
	</nav><!-- /.navbar -->

 	<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
 
 	<script>
		$(document).ready(function(){
  			$('.dropdown-submenu a.test').on("click", function(e){
    		$(this).next('ul').toggle();
    		e.stopPropagation();
    		e.preventDefault();
  			});
		});
	</script>
 
</body>
</html>