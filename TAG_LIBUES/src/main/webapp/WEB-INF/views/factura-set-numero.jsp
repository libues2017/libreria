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
<div class="well lead" align="center">ESTABLECER NÚMERO FACTURA</div>
	<form:form method="POST" modelAttribute="factura" class="form-horizontal">
		<form:input type="hidden" path="idfactura" id="idfactura" />
		
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="factura">Número de Factura:</label>
						<div class="col-md-3">						
						<form:input type="text" path="numerofactura"  maxlength="10" id="numerofactura" placeholder="9999999999"  class="form-control input-sm" />
						</div>
					</div>
					<div class="form-group col-md-12" style="display:none">	
						<label class="col-md-3 control-lable" for="fecha">Fecha Factura:</label>
						<div class="col-md-3">
						<form:input type="date" path="fechafactura" id="fechafactura"  class="form-control input-sm" value="<%=sAhora %>" />
						</div>
					</div>
					<div class="col-xs-2" style="display:none">	
						<label class="form-control" for="codigo">Estado:</label>						
						<form:input type="text" path="estado" id="estado" class="form-control input-sm" value="1" />
					</div>
						
					<div class="col-xs-3" >
						<input type="submit" value="ESTABLECER" class="btn btn-primary btn-sm" onclick="alert('Se creó el nuevo número de Factura')" />
					</div>
					<div class="col-xs-3" >
						<a href="<c:url value='/index' />" class="btn btn-primary btn-sm" >CANCELAR</a>					
					</div>
	</form:form>
</div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
</body>
</html>