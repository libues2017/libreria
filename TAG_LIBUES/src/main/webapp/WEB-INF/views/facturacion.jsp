<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.io.*" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Libre�a UES</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
<%
	// Quiero la fecha actual para ponerla por defecto 
	String fecha="";
    String sAhora = "";
			
		if(session.getAttribute("fechafactura")!=null){
			fecha=session.getAttribute("fechafactura").toString();
		}
        if(fecha==""){
        	Calendar ahora = Calendar.getInstance();
     		int anyo = ahora.get(Calendar.YEAR);
     		int mes = ahora.get(Calendar.MONTH) +1; 
     		int dia = ahora.get(Calendar.DAY_OF_MONTH);
     					
     		if (mes < 10) {
     			sAhora = anyo + "-0" + mes;
     		} else {
     			sAhora = anyo + "-" + mes;
     			}
     			if (dia < 10) {
     				sAhora += "-0" + dia;
     			}
     			else {
     				sAhora += "-"+dia;
     			} 
                  	 
           	}
                     
            else{
                    	 
            sAhora=fecha;
		}
%>
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
						<label class="col-md-3 control-lable" for="factura">N�mero de Factura:</label>
						<div class="col-md-3">						
						<form:input type="text" path="numerofactura"  maxlength="10" id="numerofactura" placeholder="9999999999"  class="form-control input-sm" />
						</div>
					</div>
					<div class="form-group col-md-12">	
						<label class="col-md-3 control-lable" for="fecha">Fecha Factura:</label>
						<div class="col-md-3">
						<form:input type="date" path="fechafactura" id="fechafactura"  class="form-control input-sm" value="<%=sAhora %>" />
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
                            <input type="submit" value="Actualizar" class="btn btn-primary btn-sm"/> � <a href="<c:url value='/factura-list' />">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar" class="btn btn-primary btn-sm"/> � <a href="<c:url value='/factura-list' />">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
	</form:form>
</div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
</body>
</html>