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
						</div>
					</div>
				</div>
			</div>
			
		</form:form>
	</div>
</body>
</html>