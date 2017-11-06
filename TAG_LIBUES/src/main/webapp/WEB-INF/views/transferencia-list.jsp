<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lista de Transferencias</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
<div class="row"><%@include file="page_head.jsp" %></div>
	<div class="container">
		<div class="row"><%@include file="menu.jsp" %></div>
		
		<div class="row col-md-12">
		<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well">
                <a href="<c:url value='/detalletransferencia-agregar' />" class="btn btn-primary">Agregar Transferencia</a>   
                <a href="<c:url value='/index' />" class="btn btn-primary" > Menu principal</a>
            </div>
        </sec:authorize>
        
        <div class="panel panel-default">
        
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Listado de Transferencia</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>                        
                        <th>Documento</th>                        
                        <th>Tipo</th>
                        <th>Sucursal</th>                        
                        <th>Fecha</th>
                        <th>Total</th>
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            <th width="100"></th>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <th width="100"></th>
                        </sec:authorize>
                         
                    </tr>
                </thead>
                
                <tbody>
                	<c:forEach items="${transferencias}" var="transferencia">
                    	<tr>
                    		<td><a  href="<c:url value='/transferencia-detalle-${transferencia.codTransferencia}' />">${transferencia.codTransferencia}</a></td>
                    		<td>${transferencia.tipoTransferencia}</td>	
                        	<td>${transferencia.sucursal}</td>	
                        	<td>${transferencia.fechaTransferencia}</td>
                        	<td>${transferencia.total}</td>
                        	<sec:authorize access="hasRole('ADMINISTRADOR')">
                        		<td><a href="<c:url value='/delete-transferencia-${transferencia.codTransferencia}'/>" class="btn btn-danger custom-width">Eliminar</a></td>
                        	</sec:authorize>
                        	 
                     
                    	</tr>
                	</c:forEach>
                </tbody>
            </table>
        	</div>
        </div>
    </div>
  <div class="row"><%@include file="foot.jsp" %></div>
 <!--<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>-->
</body>
</html>