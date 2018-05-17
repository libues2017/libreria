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
<style>
.dropdown-submenu {
    position: relative;
}

.dropdown-submenu .dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: -1px;
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
				<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole ('DBA')"  >
					<li class="dropdown">
			        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Ingreso<span class="caret"></span></a>
			          	<ul class="dropdown-menu">
			          		<li><a href="<c:url value="tipo-list" />">Tipo Producto</a></li>			          			
			          		<li role="separator" class="divider"></li>
			          		
			          		<li class="dropdown-submenu">
			          		<a class="test" tabindex="-1" href="#">Áreas <span class="caret"></span></a>
			          		<ul class="dropdown-menu">
			            	<li><a href="<c:url value="area-list" />">Lista de Áreas</a></li>
			            		<li role="separator" class="divider"></li>
		            		<li><a href="<c:url value="area-agregar" />">Agregar Área</a></li>         	
			          		</ul>
			          		</li>			          		
			          		<li role="separator" class="divider"></li>	
				        	
				        	<li class="dropdown-submenu">
			          		<a class="test" tabindex="-1" href="#">Proveedores <span class="caret"></span></a>
			            	<ul class="dropdown-menu">			            		
			            		<li><a href="<c:url value="proveedor-list" />">Lista de Proveedores</a></li>
			            		<li role="separator" class="divider"></li>
			            		<li><a href="<c:url value="proveedor-agregar" />">Agregar Proveedor</a></li>			            			
			                 	
			          		</ul>
			          		</li>  		
				        	<li role="separator" class="divider"></li>
				        	
				        	<li class="dropdown-submenu">
				        	<a class="test" tabindex="-1" href="#">Editoriales <span class="caret"></span></a>
				        	<ul class="dropdown-menu">
					        	<li><a href="<c:url value="editorial-list" />">Lista de Editoriales</a></li>
					        	<li role="separator" class="divider"></li>
					        	<li><a href="<c:url value="editorial-agregar" />">Agregar Editorial</a></li>
				        	</ul>
				        	<li role="separator" class="divider"></li>
				        	
				        	<li class="dropdown-submenu">
			          		<a class="test" tabindex="-1" href="#">Autores <span class="caret"></span></a>
			          		<ul class="dropdown-menu">
					            <li><a href="<c:url value="autor-list" />">Lista de Autores</a></li>				            	
					            <li role="separator" class="divider"></li>
					            <li><a href="<c:url value="autor-agregar" />">Agregar Autor</a></li>			                 	
			          		</ul>
			          		</li>
			          		<li role="separator" class="divider"></li>
			          			<li><a href="<c:url value="producto-list" />">Catálago de Productos</a></li>
			          			
			          	</ul>
				 	</li>
				</sec:authorize>
			
				<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO') or hasRole ('DBA')"  >
			      		<li class="dropdown">
			          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Inventario<span class="caret"></span></a>
			          		<ul class="dropdown-menu">
			            		 <li><a href="<c:url value="detalleretaceo-list" />">Retaceos</a></li>			                 	
			          			<li role="separator" class="divider"></li>			            		
			            		<li><a href="<c:url value="requisicion-list" />">Requisición</a></li>
			            		<li role="separator" class="divider"></li>
			            		<li><a href="<c:url value="transferencia-list" />">Transferencias</a></li>			            		
			            		 <li role="separator" class="divider"></li>
			            		<li><a href="<c:url value="comparacion" />">Comparación de Inventario</a></li>
			            		<li role="separator" class="divider"></li>
			            		<li><a href="<c:url value="nuevas-etiquetas" />">Generar etiquetas</a></li>				                 	
			          			
			          		</ul>
			      		</li>
				</sec:authorize>	
					<li class="dropdown">
          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Consulta<span class="caret"></span></a>
          				<ul class="dropdown-menu">
            				<li><a href="<c:url value="producto-list" />">Catálago</a></li>
            				<li role="separator" class="divider"></li>
            				<li><a href="<c:url value="producto-busqueda" />">Búsqueda de Productos</a></li>
          				</ul>
        			</li>
        				
        			<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('VENDEDOR') or hasRole('DIRECTOR') or hasRole ('DBA')"  >
        				<li class="dropdown">
          					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Facturación <span class="caret"></span></a>
          					<ul class="dropdown-menu">
          						<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('VENDEDOR') or hasRole ('DBA')">
            					<li><a href="<c:url value="detallefacturacion-agregar" />">Facturar</a></li>
            					<li role="separator" class="divider"></li>
            					<li><a href="<c:url value="cierre_caja" />">Cierre de Caja</a></li>
            					</sec:authorize>
            					<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DIRECTOR') or hasRole ('DBA')">
            					<li role="separator" class="divider"></li>
            					<li><a href="<c:url value="facturas-emitidas" />">Facturas Emitidas</a></li>
            					<li role="separator" class="divider"></li>
            					<li><a href="<c:url value="facturas-creditos" />">Créditos</a></li>
            					<li role="separator" class="divider"></li>
            					<li><a href="<c:url value="facturas-creditos-todos" />">Créditos Generales</a></li>
              					</sec:authorize>
           					</ul>
        				</li>
        			</sec:authorize>

			 		<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO') or hasRole('USUARIO') or hasRole ('DBA')">
        				<li class="dropdown">
          					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cotizacion<span class="caret"></span></a>
          					<ul class="dropdown-menu">
            					<li><a href="<c:url value="cotizacion-list" />">Cotización</a></li>
            					<li role="separator" class="divider"></li>
            					<li><a href="<c:url value="detallecotizacion-agregar" />">Realizar Cotización</a></li>	
           					</ul>
        				</li>
        			</sec:authorize>
			 		
					<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO') or hasRole('DIRECTOR') or hasRole ('DBA')"  >
        				<li class="dropdown">
			          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Reporte<span class="caret"></span></a>
			          		<ul class="dropdown-menu">
			          				<li><a href="<c:url value="kardex" />">Reporte de Kárdex</a></li>
			            			<li role="separator" class="divider"></li>
			            			<li><a href="<c:url value="existencias" />">Reporte de Existencias</a></li>
			            			<li role="separator" class="divider"></li>
	           						<li><a href="<c:url value="/reporte-retaceo" />">Reporte Mensual de Retaceo</a></li>
	           						<li role="separator" class="divider"></li>
	           						<li><a href="<c:url value="transferencias" />">Reporte de Transferencias</a></li>
	           						<li role="separator" class="divider"></li>
            						<li><a href="<c:url value="ventas" />">Reportes de Ventas</a></li>
            						<li role="separator" class="divider"></li>
            						<li><a href="<c:url value="entrada_mensual" />">Reportes de Entradas Mensuales</a></li>
            						<li role="separator" class="divider"></li>
            						<li><a href="<c:url value="venta_mensual_gastos" />">Reportes de Ventas por Específico de Gastos</a></li>
            						<li><a href="<c:url value="/reporte-alcostoventa" />">Reportes al costo de venta</a></li>
		          		</ul>			          			
				        </li>
					</sec:authorize>
					
        			<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole ('DBA')">
        				<li class="dropdown">
			          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Matenimiento<span class="caret"></span></a>
			          		<ul class="dropdown-menu">			          			
			            				<li><a href="<c:url value="list" />">Gestión de Usuarios</a></li>
			            			<li role="separator" class="divider"></li>
			            				<li><a href="<c:url value="backup-crear" />">Respaldo Base de Datos</a></li>
			            			<li role="separator" class="divider"></li>
			            				<li><a href="<c:url value="restaurar-base" />">Restauración de Base de Datos</a></li>
			            			<li role="separator" class="divider"></li>
			            				<li><a href="<c:url value="reservaciones-list" />">Listado de Reservas de Libros</a></li>
			            			<li role="separator" class="divider"></li>
            							<li><a href="<c:url value="numero-factura" />">Establecer Número Factura</a></li>            					
            						<li role="separator" class="divider"></li>
            							<li><a href="<c:url value="factura-list" />">Listar Facturas</a></li>
			            			<li role="separator" class="divider"></li>
			            			<li><a href="<c:url value="edit-Parametro-Retaceo-20.0" />">Establecer Uilidad</a></li>
            						<li role="separator" class="divider"></li>
            							<li><a href="<c:url value="cierre-semestral" />">Cierre Semestral</a></li>
            							
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