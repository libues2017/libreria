<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Librer�a UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
    
</head>
<body >
<div class="row"><%@include file="page_head_2.jsp" %></div>
	<div class="container">	
		 
        <div class="panel-group">
    		<div class="panel panel-default" align="center">
      		<div class="panel-heading" ><h4>VENTAS</h4></div>
      		<sec:authorize access="hasRole('ADMINISTRADOR')">
      		<div class="panel-body">      			
                <a href="<c:url value='/index' />" class="btn btn-primary" > Menu principal</a>
      		</div>
      		 </sec:authorize>
    		</div>
        </div>
        
        <div class="panel panel-default">
        
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Mantenimiento de Ventas</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                    	<th>Item</th>                        
                        <th># de Factura</th>                        
                        <th>Cliente</th>
                        <th>Venta</th>
                        <th>Total</th>
                        <th>Fecha</th>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                        	
                            <th width="100">ELIMINAR</th>
                        </sec:authorize>
                         
                    </tr>
                </thead>
                
                <tbody>
                	<c:set var="contador" value="${0}" /> 
                	<c:forEach items="${facturas}" var="factura">
                    	<tr>
                    	<c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	            <c:if test = "${salary > 2000}">
	    	                <c:set var="contador" value="${contador + 1}" />    	                
		    	              
	    	                <td>${contador}</td>
                    		<td>${factura.numerofactura}</td>
                    		<td>${factura.cliente}</td>	
                        	<td>${factura.tipofactura}</td>
                        	<td>$${factura.total}</td>
                        	<td>${factura.fechafactura}</td>
                        	</c:if>	
                        	<sec:authorize access="hasRole('ADMINISTRADOR')">                     
                        	<td><a href="<c:url value='/factura-detalle-${factura.idfactura}'/>"  class="btn btn-danger custom-width">Eliminar</a></td>
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