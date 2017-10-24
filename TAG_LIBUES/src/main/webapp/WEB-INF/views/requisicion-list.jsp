<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body Style="background-color:#97965B">
<div class="row"><%@include file="page_head_2.jsp" %></div>
	<div class="container">	
		 
        <div class="panel-group">
    		<div class="panel panel-default" align="center">
      		<div class="panel-heading" ><h4>REQUISICIONES</h4></div>
      		<sec:authorize access="hasRole('ADMINISTRADOR')">
      		<div class="panel-body">
      			<a href="<c:url value='/detallerequisicion-agregar' />" class="btn btn-primary">Realizar Requisicion</a> ||||||||
                <a href="<c:url value='/index' />" class="btn btn-primary" > Menu principal</a>
      		</div>
      		 </sec:authorize>
    		</div>
        </div>
        
        <div class="panel panel-default">
        
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Lista de Documento de Requisiciones</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>                        
                        <th>Doc. #</th>                        
                        <th>Destino</th>
                        <th>Fecha</th>
                        <th>Total</th>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <th width="100">ELIMINAR</th>
                        </sec:authorize>
                         
                    </tr>
                </thead>
                
                <tbody>
                	<c:forEach items="${requisiciones}" var="requisicion">
                    	<tr>
                    		<td><a  href="<c:url value='/requisicion-detalle-${requisicion.codigorequisicion}' />">${requisicion.codigorequisicion}</a></td>
                    		<td>${requisicion.destino}</td>	
                        	<td>${requisicion.fecha}</td>
                        	<td>${requisicion.total}</td>
                        	<sec:authorize access="hasRole('ADMINISTRADOR')">                     
                        	<td><a href="<c:url value='/delete-requisicion-${requisicion.codigorequisicion}'/>"  class="btn btn-danger custom-width">Eliminar</a></td>
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