<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Libreía UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

</head>
<body>
<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">
<div class="row"><%@include file="menu.jsp" %></div>

<p>El Inventario Teorico ya se encuentra en el sistema</p>
<hr>
<p>Es necesario cargar el Inventario Fisico en el sistema</p>
<hr>
<a href="<c:url value='#' />" class="btn btn-primary">Cargar Inventario</a>
<hr>
<p>En el siguiente boton se comparan las existencias de los inventarios.<br>
Si hay diferencias en las existencias se muestra la informacion.<br></p>
<hr>
<a href="<c:url value='#' />" class="btn btn-primary">Comparar inventarios</a>


</div>
<br/><br/>
<div class="row"><%@include file="foot.jsp" %></div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
</body>
</html>