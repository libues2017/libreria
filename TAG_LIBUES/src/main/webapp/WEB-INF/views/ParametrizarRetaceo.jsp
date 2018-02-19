<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.io.*" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
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
<div class="col-xs-8">

	
		<div class="well lead" align="center">Parametrizar porcentaje utilidad retaceo</div>
	
    
    	
   
	<form:form method="POST" modelAttribute="retaceo" class="form-horizontal">
	<form:input type="hidden" path="codigoretaceo" id="codigoretaceo" />
		<div class="well lead">	
			<div class="form-group col-md-12" align="center">
				<label class="col-md-6 control-lable" for="factura">Porcentaje Retaceo:</label>
				<div class="col-md-4">						
				<form:input type="number" path="utilidad"  maxlength="10" id="utilidad" placeholder="99"  class="form-control input-sm" value="${utilidad}"/>
			</div>
			</div>
			
			
			<div class="form-actions floatRight" align="center">					
                   
                            <input type="submit" value="ESTABLECER" class="btn btn-primary btn-sm"/> 
                            ó  <a href="<c:url value='/index' />" class="btn btn-primary btn-sm">CANCELAR</a>
                   
             </div>			
		</div>
	</form:form>
</div>
</div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
</body>
</html>