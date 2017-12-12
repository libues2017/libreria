<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.io.*" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Libreía UES</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>

</head>
<body >
<div class="row"><%@include file="page_head_2.jsp" %></div>
<div class="container">
	<c:choose>
	<c:when test="${edit}">
		<div class="well lead" align="center">ACTUALIZAR DATOS FACTURA</div>
	</c:when>
    <c:otherwise>
    	<div class="well lead" align="center">NUEVA FACTURA</div>
    </c:otherwise>
    </c:choose>
	<form:form method="POST" modelAttribute="factura" class="form-horizontal">
		<form:input type="hidden" path="idfactura" id="idfactura" />
		
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="factura">Codigo:</label>
						<div class="col-md-3">						
						<form:input type="text" path="idfactura"  maxlength="10" id="idfactura"   class="form-control input-sm" />
						</div>
					</div>
		
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="factura">Número de Factura:</label>
						<div class="col-md-3">						
						<form:input type="text" path="numerofactura"  maxlength="10" id="numerofactura" class="form-control input-sm" />
						</div>
					</div>
					<div class="form-group col-md-12">	
						<label class="col-md-3 control-lable" for="fecha">Fecha Factura:</label>
						<div class="col-md-3">
						<form:input type="date" path="fechafactura" id="fechafactura"  class="form-control input-sm" />
						</div>
					</div>
					
					<div class="form-group col-md-12">	
						<label class="col-md-3 control-lable" for="fecha">Total:</label>
						<div class="col-md-3">
						<form:input type="text" path="total" id="total"  class="form-control input-sm" />
						</div>
					</div>
					
					<div class="form-group col-md-12">	
						<label class="col-md-3 control-lable" for="fecha">Tipo Factura:</label>
						<div class="col-md-3">
						<form:input type="text" path="tipofactura" id="tipofactura"  class="form-control input-sm" />
						</div>
					</div>
					
					<div class="form-group col-md-12">	
						<label class="col-md-3 control-lable" for="fecha">Cliente:</label>
						<div class="col-md-3">
						<form:input type="text" path="cliente" id="cliente"  class="form-control input-sm" />
						</div>
					</div>
					
					<div class="form-group col-md-12">	
						<label class="col-md-3 control-lable" for="fecha">Direccion:</label>
						<div class="col-md-3">
						<form:input type="text" path="direccion" id="direccion"  class="form-control input-sm" />
						</div>
					</div>
					
					<div class="form-group col-md-12">	
						<label class="col-md-3 control-lable" for="fecha">Documento:</label>
						<div class="col-md-3">
						<form:input type="text" path="documento" id="documento"  class="form-control input-sm" />
						</div>
					</div>
					
					<div class="form-group col-md-12">	
						<label class="col-md-3 control-lable" for="fecha">Tipo Credito:</label>
						<div class="col-md-3">
						<form:input type="text" path="tipocredito" id="tipocredito"  class="form-control input-sm" />
						</div>
					</div>
					
					<div class="form-group col-md-12">	
						<label class="col-md-3 control-lable" for="fecha">Estado:</label>
						<div class="col-md-3">
						<form:input type="text" path="estado" id="estado"  class="form-control input-sm" value="1"/>
						</div>
					</div>
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar" class="btn btn-primary btn-sm"/> ó <a href="<c:url value='/factura-list' />">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar" class="btn btn-primary btn-sm"/> ó <a href="<c:url value='/factura-list' />">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
	</form:form>
</div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
</body>
</html>