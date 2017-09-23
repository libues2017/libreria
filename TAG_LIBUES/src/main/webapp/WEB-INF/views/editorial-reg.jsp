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
	  <div class="well lead">Agregar Editorial</div>
        <form:form method="POST" modelAttribute="editorial" class="form-horizontal">
            <form:input type="hidden" path="codigoeditorial" id="codigoeditorial"/>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Codigo:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="codigoespecifico" id="codigoespecifico" placeholder="Digite el Codigo de la Editorial" class="form-control input-sm"/>
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
                        <form:input type="text" path="nombre" id="nombre" placeholder="Digite el Nombre de la Editorial" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nombre" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
          <div class="row">
		        	<div class="form-group col-md-12">
                    	<label class="col-md-3 control-lable" for="estado">Estado:</label>
                    	<div class="col-md-7">
                        	<!--<form:input type="text" path="estado" id="estado" class="form-control input-sm"/>-->
                        	<SELECT name="estado" id="estado" class="form-control input-sm">
										<OPTION VALUE="Activo">Activo</OPTION>
										<OPTION VALUE="Inactivo">Inactivo</OPTION>
							</SELECT>
                        	<div class="has-error">
                            	<form:errors path="estado" class="help-inline"/>
                       	 	</div>
                    	</div>
               		</div>
            	</div>
            
            <div class="row">
                <div class="form-actions floatRight">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar Editorial" class="btn btn-primary btn-sm"/> ó <a href="<c:url value='/editorial-list' />">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar Editorial" class="btn btn-primary btn-sm"/> ó <a href="<c:url value='/editorial-list' />">Cancelar</a>
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