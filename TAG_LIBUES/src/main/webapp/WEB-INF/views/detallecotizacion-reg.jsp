<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librer�a UES</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="row"><%@include file="page_head_2.jsp"%></div>
	<div class="container">
		<div class="well lead" align="center">REALIZAR COTIZACI�N</div>
		<form:form method="POST" name="cot" modelAttribute="detallecotizacion" class="form-horizontal">
			<form:input type="hidden" path="numeroDetalle" id="numeroDetalle" />
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="form-group row">
						<div class="panel-body">
							<div class="col-xs-3">
								<label class="form-control" for="nombr">Cotizaci�n #:</label>
								<form:input type="text" path="codigoCotizacion" id="codigoCotizacion" class="form-control input-sm" value='<%=session.getAttribute("codigo6")%>' />
							</div>
							<div class="col-xs-3">			
								<label class="form-control" for="nombr">Fecha:</label>
								<input type="date" id="fechaCotizacion" name="fechaCotizacion" class="form-control input-sm" 
								title="Seleccione la fecha de Cotizaci�n" />
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
								<label class="form-control" for="nombr">N�mero de Tel�fono:</label>
								<input type="text" id="telefono" name="telefono" class="form-control input-sm" onchange="sesion();" placeholder="Digitar"
								title="Digite el n�mero de Telefono del Cliente"/>
							</div>
							<div class="col-xs-6">
								<label class="form-control" for="nombr">Correo Electr�nico:</label>
								<input type="text" id="correo" name="correo" class="form-control input-sm" onchange="sesion();" placeholder="Digitar"
								title="Digite el correo electr�nico del Cliente"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel panel-success">
					<div class="form-group row">
						<div class="panel-body">
							<div class="col-xs-3">
				        		<label class="form-control" for="tags">C�digo de Producto:</label>
	                    		<form:input type="text" path="codigoProducto" id="codigoProducto"  placeholder="DIGITE"  class="form-control input-sm" onchange='label();' 
	                    		title="Digite el C�digo del Producto"/>        
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