<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="row"><%@include file="page_head_2.jsp"%></div>
	<div class="container">
		<div class="well lead" align="center">REALIZAR COTIZACIÓN</div>
		<form:form method="POST" name="cot" modelAttribute="detallecotizacion" class="form-horizontal">
			<form:input type="hidden" path="numeroDetalle" id="numeroDetalle" />
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="form-group row">
						<div class="panel-body">
							<div class="col-xs-3">
								<label class="form-control" for="nombr">Cotización #:</label>
								<form:input type="text" path="codigoCotizacion" id="codigoCotizacion" class="form-control input-sm" value='<%=session.getAttribute("codigo6")%>' />
							</div>
							<div class="col-xs-3">			
								<label class="form-control" for="nombr">Fecha:</label>
								<input type="date" id="fechaCotizacion" name="fechaCotizacion" class="form-control input-sm" 
								title="Seleccione la fecha de Cotización" />
							</div>
							<div class="col-xs-6">
								<label class="form-control" for="nombr">Nombre del Cliente:</label>
								<input type="text" id="nombreCliente" name="nombreCliente" class="form-control input-sm" onchange="sesion();" placeholder="Digitar"
								title="Digite el nombre del Cliente"/>
							</div>	
						</div>
					</div>
					<div class="form-group row" align="center">
						<div class="panel-body">
							<div class="col-xs-3">
								<label class="form-control" for="nombr">Número de Teléfono:</label>
								<input type="text" id="telefono" name="telefono" class="form-control input-sm" onchange="sesion();" placeholder="Digitar"
								title="Digite el número de Telefono del Cliente"/>
							</div>
							<div class="col-xs-6">
								<label class="form-control" for="nombr">Correo Electrónico:</label>
								<input type="text" id="correo" name="correo" class="form-control input-sm" onchange="sesion();" placeholder="Digitar"
								title="Digite el correo electrónico del Cliente"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel panel-success">
					<div class="form-group row">
						<div class="panel-body">
							<div class="col-xs-3">
				        		<label class="form-control" for="tags">Código de Producto:</label>
	                    		<form:input type="text" path="codigoProducto" id="codigoProducto"  placeholder="DIGITE"  class="form-control input-sm" onchange='label();' 
	                    		title="Digite el Código del Producto"/>        
                    		</div>
                    		<div class="col-xs-7"> 
	                    		<label class="form-control" for="nombr">Nombre de Producto:</label>
								<input type="text" id="nombreProducto" placeholder="AUTOMATICO" class="form-control input-sm" />
							</div>
						</div>
						<div class="panel-body">
							<div class="col-xs-2">
								<label class="form-control" for="precio">Precio $:</label>
								<form:input type="text" path="valorUnitario" id="valorUnitario" placeholder="AUTOMATICO" class="form-control input-sm" title="Se llena automaticamente"/>							
							</div>
							<div class="col-xs-2">
	                    		<label class="form-control" for="nombr">Cantidad:</label>
	                    		<form:input type="number" min="1" path="cantidad" id="cantidad" placeholder="DIGITE" class="form-control input-sm" onchange="addIt('cantidadproducto');"
	                    		title="Digite la Cantizad de producto a cotizar"/>
                    		</div>
                    		<div class="col-xs-2">
	                    		<label class="form-control" for="nombr">Valor Total $:</label>
	                    		<form:input type="number" min="1" path="cantidad" id="cantidad" placeholder="DIGITE" class="form-control input-sm" onchange="addIt('cantidadproducto');"
	                    		title="Digite la Cantizad de producto a cotizar"/>
                    		</div>
                    	</div>
						
					</div>
				</div>
			</div>
			
		</form:form>
	</div>
</body>
</html>