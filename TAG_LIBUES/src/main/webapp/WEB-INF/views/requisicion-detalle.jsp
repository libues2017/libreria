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
      <div class="row col-md-12">
      
      <sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well" align="center">
                <a href="<c:url value='/detallerequisicion-agregar' />" class="btn btn-primary">Realizar Requisicion</a> ||||||
                <a href="<c:url value='/index' />" class="btn btn-primary" > Menu principal</a> ||||||
                <a href="<c:url value='/requisicion-list' />" class="btn btn-primary" > Documentos</a> 
            </div>
        </sec:authorize>
        
        <div class="panel panel-default">      
              <!-- Default panel contents -->
            <div class="panel-heading">
            <h3>Detalle de Documento</h3>
            </div>
            <table class="table table-hover">
                <thead>
                    <tr>                    	                 
                        <th>Codigo Detalle</th>                        
                        <th>Codigo Producto</th>
                        <th>Nombre</th>
                        <th>Bodega</th>
                        <th>Sala</th>
                        <th>Costo</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                
                <tbody>
                	<c:forEach items="${detallerequisiciones}" var="detallerequisicion">
                    	<tr>                    	
                    	<td>${detallerequisicion.codigodetalle}</td>
                    	<td>${detallerequisicion.codigoproducto}</td>	
                        <td>${detallerequisicion.nombreproducto}</td>
                        <td>${detallerequisicion.bodega}</td>
                        <td>${detallerequisicion.sala}</td>
                        <td>$${detallerequisicion.costo}</td>
                        <td>$${detallerequisicion.precio}</td>
                        <td>${detallerequisicion.cantidad}</td>
                        <td>$${detallerequisicion.subtotal}</td>
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