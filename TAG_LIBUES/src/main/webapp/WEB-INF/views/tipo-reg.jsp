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
	  <div class="well lead">Agregar Tipo Producto</div>
        <form:form method="POST" modelAttribute="tipo" class="form-horizontal">
            <form:input type="hidden" path="codTipoProducto" id="codTipoProducto"/>
             
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Tipo:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="tipoProducto" id="tipoProducto" placeholder="Digite el Tipo del Producto" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="tipoProducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
     
     
           
            <div class="row">
                <div class="form-actions floatRight">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar" class="btn btn-primary btn-sm"/> ó <a href="<c:url value='/tipo-list' />">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar" class="btn btn-primary btn-sm"/> ó <a href="<c:url value='/tipo-list' />">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </form:form>
</div>

</div>

<div class="row"><%@include file="foot.jsp" %></div>
<!--<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>-->
</body>
</html>