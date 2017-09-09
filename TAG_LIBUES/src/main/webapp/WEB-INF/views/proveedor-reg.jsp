<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librer�a UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-formhelpers.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap-formhelpers.min.css' />" rel="stylesheet"></link>
     
    <Style>
    .control-label{
    	text-align: left;
    	}
    </Style>
</head>
<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<div class="col-xs-8">

	  <div class="well lead">Agregar Proveedor</div>
        <form:form method="POST" modelAttribute="proveedor" class="form-horizontal">
            <form:input type="hidden" path="codigoproveedor" id="codigoproveedor"/>
             
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombreproveedor">Nombre:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="nombreproveedor" id="nombreproveedor" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nombreproveedor" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="telefonoproveedor">Direcci�n:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="direccion" id="direccion" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="telefonoproveedor" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="telefonoproveedor">Telefono:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="telefonoproveedor" id="telefonoproveedor" class="input-medium bfh-phone" data-country="SV"/>
                        <div class="has-error">
                            <form:errors path="telefonoproveedor" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="contactoproveedor1">Contacto 1:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="contactoproveedor1" id="contactoproveedor1" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="contactoproveedor1" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
             <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="contactoproveedor2">Contacto 2:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="contactoproveedor2" id="contactoproveedor2" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="contactoproveedor2" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
             
            <div class="row">
                <div class="form-actions floatRight">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar Proveedor" class="btn btn-primary btn-sm"/> � <a href="<c:url value='/proveedor-list' />">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar Proveedor" class="btn btn-primary btn-sm"/> � <a href="<c:url value='/proveedor-list' />">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </form:form>
</div>

</div>

<div class="row"><%@include file="foot.jsp" %></div>

</body>
</html>