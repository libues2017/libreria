<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Detalle Transferencia</title>
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
                <a href="<c:url value='/index' />" class="btn btn-primary" > Menu principal</a> |||
                <a href="<c:url value='/transferencia-list' />" class="btn btn-primary" >Lista de Transferencias</a> 
            </div>
        </sec:authorize>
        
        <div class="panel panel-default">      
              <!-- Default panel contents -->
            <div class="panel-heading"><h3>Transferencia: ${transferencia.codTransferencia}</h3> </div>
            <table class="table table-hover">
                <thead>
                    <tr>                    	                 
                        <!--<th>Codigo Detalle</th>-->                        
                        <th>Codigo Producto</th>
                        <th>Titulo</th>
                        <th>Cantidad</th>
                        <th>Costo</th>
                        <th>Precio</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                
                <tbody>
                	<c:forEach items="${detalletransferencias}" var="detalletransferencia">
                    	<tr>                    	
                    	<!-- <td>${detallerequisicion.codigodetalle}</td>-->
                    	<td>${detalletransferencia.codProducto}</td>	
                        <td>${detalletransferencia.nomProducto}</td>
                        <td>${detalletransferencia.cantidadProducto}</td>
                        <td>$${detalletransferencia.costoProducto}</td>
                        <td>$${detalletransferencia.precioProducto}</td>
                        <td>$${detalletransferencia.subTotal}</td>
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