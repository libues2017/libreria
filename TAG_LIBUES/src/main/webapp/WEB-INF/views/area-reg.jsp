<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librer�a UES</title>
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
	<c:choose>
	<c:when test="${edit}">
		<div class="well lead" align="center">ACTUALIZAR �REA</div>
	</c:when>
    <c:otherwise>
    	<div class="well lead" align="center">NUEVA �REA</div>
    </c:otherwise>
    </c:choose>	  
        <form:form method="POST" modelAttribute="area" class="form-horizontal">
            <form:input type="hidden" path="codigoarea" id="codigoarea"/>
            <div class="well lead"> 
	            <div class="row">
	                <div class="form-group col-md-12">
	                    <label class="col-md-3 control-lable" for="nombrearea">Nombre:</label>
	                    <div class="col-md-7">
	                        <form:input type="text" path="nombrearea" id="nombrearea"  maxlength="50" placeholder="Digite el Nombre del �rea" class="form-control input-sm"/>
	                        <div class="has-error">
	                            <form:errors path="nombrearea" class="help-inline"/>
	                        </div>
	                    </div>
	                </div>
	            </div>           
           
		        <div class="row">
		        	<div class="form-group col-md-12" style="display: none">
                    	<label class="col-md-3 control-lable" for="estado">Estado:</label>
                    	<div class="col-md-7">
                        	<form:input type="text" path="estado" id="estado" class="form-control input-sm" value="1"/>
                    	</div>
               		</div>
            	</div>
     
            <div class="row">
                <div class="form-actions floatRight" align="center">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar" class="btn btn-primary btn-sm" onclick="alert('Se actualiz� el �REA')"/> 
                            � <a href="<c:url value='/area-list' />" class="btn btn-primary btn-sm">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar" class="btn btn-primary btn-sm" onclick="alert('Se cre� el �REA')"/> 
                            � <a href="<c:url value='/area-list' />" class="btn btn-primary btn-sm">Cancelar</a>
                        </c:otherwise> 
                    </c:choose>
                </div>
            </div>
            </div>
        </form:form>
</div>

</div>


<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
</body>
</html>