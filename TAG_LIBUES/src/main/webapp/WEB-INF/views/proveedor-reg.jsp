<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-formhelpers.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-formhelpers.min.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
    <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <script>
      function validar()
      {
    	  var nomprov = document.getElementById('nombreproveedor').value;
    	  var direccion = document.getElementById('direccion').value;
    	  var telefono = document.getElementById('telefonoproveedor').value;
    	  
    	  if (nomprov != '' && direccion != '' && telefono != '')
    	  {
    		  alert('El proveedor se creó con éxito') ;  
    	  }
    	  	
    	  else
    	  {
    		  alert('Ingrese un nombre de proveedor, dirección o teléfono');
    	  }
      }
    </script>
    
    <script>
      function editarvalidar()
      {
    	  var nomarea = document.getElementById('nombreproveedor').value;
    	  var direccion = document.getElementById('direccion').value;
    	  var telefono = document.getElementById('telefonoproveedor').value;
    	  
    	  if (nomprov != '' && direccion != '' && telefono != '')
    	  {
    		  alert('El proveedor se actualizó con éxito') ;  
    	  }
    	  	
    	  else
    	  {
    		  alert('Ingrese un nombre de proveedor, dirección o teléfono');
    	  }
      }
    </script>
</head>
<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="col-xs-8">
	<c:choose>
	<c:when test="${edit}">
		<div class="well lead" align="center">ACTUALIZAR PROVEEDOR</div>
	</c:when>
    <c:otherwise>
	  <div class="well lead" align="center">NUEVO PROVEEDOR</div>
	</c:otherwise>
	</c:choose>
        <form:form method="POST" modelAttribute="proveedor" class="form-horizontal">
            <form:input type="hidden" path="codigoproveedor" id="codigoproveedor"/>
            <div class="well lead">
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombreproveedor">Nombre:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="nombreproveedor" id="nombreproveedor" maxlength="100" placeholder="Digite el Nombre del Proveedor" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nombreproveedor" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="telefonoproveedor">Dirección:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="direccion" id="direccion" maxlength="50" placeholder="Digite la Dirección del Proveedor" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="telefonoproveedor" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="telefonoproveedor">Teléfono:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="telefonoproveedor" id="telefonoproveedor" maxlength="8" placeholder="########" class="input-medium bfh-phone" data-country="SV" title="Número sin espacios"/>
                        <div class="has-error">
                            <form:errors path="telefonoproveedor" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="contactoproveedor1">Contacto:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="contactoproveedor1" id="contactoproveedor1" maxlength="35" placeholder="Digite el Nombre del Contacto" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="contactoproveedor1" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
             <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="contactoproveedor2">Correo:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="contactoproveedor2" id="contactoproveedor2"  maxlength="35" placeholder="Digite el Correo Electrónico" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="contactoproveedor2" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
		        	<div class="row">
		        	<div class="form-group col-md-12" style="display: none">
                    	<label class="col-md-3 control-lable" for="estado">Estado:</label>
                    	<div class="col-md-7">
                        	<form:input type="text" path="estado" id="estado" class="form-control input-sm" value="1"/>
                    	</div>
               		</div>
            	</div>
            </div>
             
            <div class="row">
                <div class="form-actions floatRight" align="center">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar Proveedor" class="btn btn-primary btn-sm" onclick="editarvalidar()"/> ||||| 
                            <a href="<c:url value='/proveedor-list' />" class="btn btn-primary btn-sm">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar Proveedor" class="btn btn-primary btn-sm" onclick="validar();"/> |||||
                            <a href="<c:url value='/proveedor-list' />" class="btn btn-primary btn-sm">Cancelar</a>
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