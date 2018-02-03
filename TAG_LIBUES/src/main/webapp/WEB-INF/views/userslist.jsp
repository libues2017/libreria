<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 
<html>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Usuarios</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
 
<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<div class="row">   
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Lista de Usuarios</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Correo</th>
                        <th>Usuario</th>
                        <sec:authorize access="hasRole('ADMININISTRADOR') or hasRole('DBA')">
                            <th width="100"></th>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <th width="100"></th>
                        </sec:authorize>
                         
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>
                        <td>${user.ssoId}</td>
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            <td><a href="<c:url value='/edit-user-${user.ssoId}' />" class="btn btn-success custom-width">Editar</a></td>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <td><a href="<c:url value='/delete-user-${user.ssoId}' />" class="btn btn-danger custom-width">Eliminar</a></td>
                        </sec:authorize>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well">
                <a href="<c:url value='/newuser' />">Nuevo Usuario</a> |
                <a href="<c:url value='/index' />"> Regresar</a>
            </div>
        </sec:authorize>
    </div>
    </div>
    <div class="row"><%@include file="foot.jsp" %></div>
    <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
</body>
</html>