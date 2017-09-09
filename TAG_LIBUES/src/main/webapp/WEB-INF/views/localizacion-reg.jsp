<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
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
	  <div class="well lead">Agregar Ubicacion Especifica</div>
        <form:form method="POST" modelAttribute="localizacion" class="form-horizontal">
            <form:input type="hidden" path="idlocalizacion" id="idlocalizacion"/>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Codigo del libro:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="codigoprod" id="codigoprod" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="codigoprod" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
             
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Nombre del libro:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="nombreprod" id="nombreprod" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nombreprod" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Lugar:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="lugar" id="lugar" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="lugar" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Estante:</label>
                    <div class="col-md-7">
                        <form:input type="number" min="0" path="estante" id="estante" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="estante" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Nivel:</label>
                    <div class="col-md-7">
                        <form:input type="number" min="0" path="nivel" id="nivel" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nivel" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Cantidad:</label>
                    <div class="col-md-7">
                        <form:input type="number" min="0" path="cantidad" id="cantidad" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="cantidad" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-actions floatRight">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar Localizacion" class="btn btn-primary btn-sm"/> ó <a href="<c:url value='/localizacion-list' />">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar Localizacion" class="btn btn-primary btn-sm"/> ó <a href="<c:url value='/localizacion-list' />">Cancelar</a>
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