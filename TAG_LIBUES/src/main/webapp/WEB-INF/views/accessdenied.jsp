<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Acceso denegado a pagina</title>
</head>
<body>
    <div class="generic-container">
        <div class="authbar">
            <span>Estimado <strong>${loggedinuser}</strong>, No tiene permisos para acceder a esta página.</span> <span class="floatRight"><a href="<c:url value="/logout" />">Salir</a></span>
        </div>
    </div>
    <div class="row"><%@include file="foot.jsp" %></div>
</body>
</html>