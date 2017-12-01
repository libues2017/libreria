<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,java.io.*" %>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
    
<%
	// Fecha actual para ponerla por defecto 
	String fecha="";
    String sAhora = "";			
		if(session.getAttribute("fechaini")!=null){
			fecha=session.getAttribute("fechaini").toString();
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
%><%
	// Fecha actual para ponerla por defecto 
	String fecha2="";
    String sDespues = "";			
		if(session.getAttribute("fechafin")!=null){
			fecha2=session.getAttribute("fechafin").toString();
		}
        if(fecha2==""){
        	Calendar ahora = Calendar.getInstance();
     		int anyo = ahora.get(Calendar.YEAR);
     		int mes = ahora.get(Calendar.MONTH) +1; 
     		int dia = ahora.get(Calendar.DAY_OF_MONTH) +1;
     		
     		if (mes < 10) {
     			sDespues = anyo + "-0" + mes;
     		} else {
     			sDespues = anyo + "-" + mes;
     			}
     			if (dia < 10) {
     				sDespues += "-0" + dia;
     			}
     			else {
     				sDespues += "-"+dia;
     			}                   	 
           	}                     
            else{                    	 
            sDespues=fecha;
		}
%>     
</head>
<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="col-xs-8">
	<c:choose>
	<c:when test="${edit}">
		<div class="well lead" align="center">ACTUALIZAR </div>
	</c:when>
    <c:otherwise>
	  <div class="well lead" align="center">NUEVA RESERVACIÓN</div>
	</c:otherwise>
	</c:choose>
        <form:form method="POST" modelAttribute="reservas" class="form-horizontal">
            <form:input type="hidden" path="idreservas" id="idreservas"/>
            <div class="well lead"> 
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="codigo">Codigo:</label>
                    <div class="col-md-4">
                        <form:input type="text" path="codigoproducto" id="codigoproducto" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="codigoproducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
             
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="nombr">Libro:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="nombreproducto" id="nombreproducto"  class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nombreproducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="nombre">Nombre:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="nombre" id="nombre"  class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nombre" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="dui">DUI:</label>
                    <div class="col-md-4">
                        <form:input type="text" path="dui" id="dui" maxlength="10" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="dui" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="fecha">Reservación:</label>
                    <div class="col-md-4">
                        <form:input type="date" path="fechaini" id="fechaini"  class="form-control input-sm" value="<%=sAhora%>"/>                        
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="fecha">Finaliza:</label>
                    <div class="col-md-4">
                        <form:input type="date" path="fechafin" id="fechafin"  class="form-control input-sm" value="<%=sDespues%>"/>                        
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="dui">Cantidad:</label>
                    <div class="col-md-2">
                        <form:input type="number" min="1" max="1" path="cantidad" id="cantidad"  class="form-control input-sm" value="1"/>                        
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-actions floatRight" align="center">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar" class="btn btn-primary" /> ||||| 
                            <a href="<c:url value='/ ' />" class="btn btn-primary">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Realizar" class="btn btn-primary" /> |||||
                            <a href="<c:url value='/ ' />" class="btn btn-primary">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            </div>
        </form:form>
</div>

</div>

</body>
</html>