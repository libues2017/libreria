<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
    <div class="container">
        <%@include file="authheader.jsp" %>
         
        <div class="alert alert-success lead">
            ${success}
        </div>
         
        <span class="well floatRight">
            <a href="<c:url value='/autor-list' />" class="btn btn-success custom-width">Ver autores</a>
            <a href="<c:url value='/autor-agregar' />" class="btn btn-success custom-width">Agregar otro autor</a>
        </span>
    </div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
</body>
 
</html>