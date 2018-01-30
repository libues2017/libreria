<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,java.io.*" %>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
	<link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet"></link>
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

<script type="text/javascript">

	function validar(){
	
		var Id = document.getElementById("dui").value;		
		<c:forEach items="${reservas}" var="current" >
		
		  if( ${current.dui} == Id) {		    	 		  
		      alert('Este DUI ya fue usado. Ingrese otro DUI si desea hacer otra reserva.')
		    }
		</c:forEach>              		
      return true;	
     }
</script>
		          
</head>
<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="col-xs-8">
	<c:choose>
	<c:when test="${edit}">
		<div class="well lead" align="center">RESERVAR LIBRO </div>
	</c:when>
    <c:otherwise>
	  <div class="well lead" align="center">NUEVA RESERVACIÓN</div>
	</c:otherwise>
	</c:choose>
        <form:form method="POST" modelAttribute="reserv" class="form-horizontal">
            <form:input type="hidden" path="idreservas" id="idreservas"/>
            <div class="well lead">
                         
            <div class="row">
                <div class="form-group col-md-12" style="display:none">
                    <label class="col-md-4 control-lable" for="codigo">Codigo:</label>
                    <div class="col-md-4">
                        <form:input type="text" path="codigoproducto" id="codigoproducto" class="form-control input-sm" value="${codigo}"/>
                        <div class="has-error">
                            <form:errors path="codigoproducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
             
            <div class="row">
                <div class="form-group col-md-12" style="display:none">
                    <label class="col-md-4 control-lable" for="nombr">Titulo:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="nombreproducto" id="nombreproducto"  class="form-control input-sm" value="${nombre}" />
                        <div class="has-error">
                            <form:errors path="nombreproducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="nombr">Titulo:</label>
                    <div class="col-md-7">
                        <input type="text" id="nombreproducto"  class="form-control input-sm" value="${nombre}" disabled="disabled"/>
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
                        <form:input type="text" path="dui" id="dui" maxlength="10" class="form-control input-sm" 
                        onchange="validar()" placeholder="########-#" title="Digitar. Incluir guion (-)"/>
                        <div class="has-error">
                            <form:errors path="dui" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
             <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="telefono">Telefono:</label>
                    <div class="col-md-4">
                        <form:input type="text" path="telefono" id="telefono" maxlength="9" class="form-control input-sm" 
                         placeholder="####-####" title="Digitar. Incluir guion (-)"/>
                        <div class="has-error">
                            <form:errors path="telefono" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12" style="display:none">
                    <label class="col-md-4 control-lable" for="fecha">Reservación:</label>
                    <div class="col-md-4">
                        <form:input type="date" path="fechaini" id="fechaini"  class="form-control input-sm" value="<%=sAhora%>"/>                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="fecha">Reservación:</label>
                    <div class="col-md-4">
                        <input type="date" id="fechaini"  class="form-control input-sm" value="<%=sAhora%>" disabled/>                        
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12" >
                    <label class="col-md-4 control-lable" for="fecha">Finaliza:</label>
                    <div class="col-md-4">
                        <form:input type="date" path="fechafin" id="fechafin"  class="form-control input-sm" value="<%=sDespues%>"/>                        
                    </div>
                </div>
            </div>
            
            <c:choose>
	            <c:when test="${tipo='Libro'}">
	            <div class="row">
	                <div class="form-group col-md-12" >
	                    <label class="col-md-4 control-lable" for="cantidad">Cantidad:</label>
	                    <div class="col-md-2">
	                        <form:input type="number"  path="cantidad" id="cantidad"  class="form-control input-sm" value="1"/>                        
	                    </div>
	                </div>
	            </div>
	            </c:when>
	           	<c:otherwise>
	            <div class="row">
	                <div class="form-group col-md-12" >
	                    <label class="col-md-4 control-lable" for="cantidad">Cantidad:</label>
	                    <div class="col-md-2">
	                        <form:input type="number" min="1" max="5" path="cantidad" id="cantidad"  class="form-control input-sm" />                        
	                    </div>
	                </div>
	            </div>
	            </c:otherwise>
           	</c:choose>
            <div class="row">
                <div class="form-group col-md-12" style="display:none">
                    <label class="col-md-4 control-lable" for="precio">Precio:</label>
                    <div class="col-md-2">
                        <form:input type="text" path="precio" id="precio"  class="form-control input-sm" value="${prec}"/>                        
                    </div>
                </div>
            </div>            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="precio">Precio:</label>
                    <div class="col-md-2">
                        <input type="text" id="precio"  class="form-control input-sm" value="${prec}" disabled/>                        
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-4 control-lable" for="tipo">Tipo:</label>
                    <div class="col-md-3">
                        <input type="text" id="tipo"  class="form-control input-sm" value="${tipo}" disabled/>                        
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-actions floatRight" align="center">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="GUARDAR" class="btn btn-primary" /> ||||| 
                            <a href="<c:url value='/producto-busqueda' />" class="btn btn-primary">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="REALIZAR" class="btn btn-primary" /> |||||
                            <a href="<c:url value='/producto-busqueda' />" class="btn btn-primary">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            </div>            
        </form:form>
         <div class="well lead">
         <p>
         - Las reservaciones tienen una duración de 24 horas por defecto, aunque pueden ser modificada<br>
         - Solo se puede reservar un producto por DUI.
         </p>
         </div>
</div>

</div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script> 

</body>
</html>