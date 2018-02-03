<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>    
</head>
<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="col-xs-8">
	<c:choose>
	<c:when test="${edit}">
		<div class="well lead" align="center">ACTUALIZAR EDITORIAL</div>
	</c:when>
    <c:otherwise>
	  <div class="well lead" align="center">NUEVA EDITORIAL</div>
	</c:otherwise>
	</c:choose>
        <form:form method="POST" modelAttribute="editorial" class="form-horizontal">
            <form:input type="hidden" path="codigoeditorial" id="codigoeditorial"/>
            <div class="well lead"> 
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Código:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="codigoespecifico" id="codigoespecifico" maxlength="4" placeholder="Digite el Código de la Editorial" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nombre" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
             
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Nombre:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="nombre" id="nombre" maxlength="100" placeholder="Digite el Nombre de la Editorial" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nombre" class="help-inline"/>
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
                            <input type="submit" value="Actualizar Editorial" class="btn btn-primary btn-sm" onclick="alert('Se actualizo')"/> ||||| 
                            <a href="<c:url value='/editorial-list' />" class="btn btn-primary">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Guardar Editorial" class="btn btn-primary btn-sm" onclick="alert('Se creo editorial')"/> |||||
                            <a href="<c:url value='/editorial-list' />" class="btn btn-primary">Cancelar</a>
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