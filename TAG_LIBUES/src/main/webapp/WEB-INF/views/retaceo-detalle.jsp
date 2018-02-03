<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Detalle Retaceo</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>

<style>
		p.normal {
    		font-weight: normal;
		}

		p.light {
    		font-weight: lighter;
		}

		p.thick {
    		font-weight: bold;
		}

		p.thicker {
    		font-weight: 900;
		}
	</style>
	
	<Style>
		.control-label {
			text-align: left;
		}
		
		invalid {
			border: 2px solid #ff0000;
		}
	</Style>

</head>
<body>
	<div class="row"><%@include file="page_head_2.jsp" %></div>	
	<div class="container">        
	<div class="row">		
	<div class="panel panel-default">
  				<!-- Default panel contents-->
  				<div class="panel-heading"><h3>RETACEO: ${retaceo.codigoretaceo}</h3></div>
  				<p></p>
  				<div class="panel-body">
					<div class="col-md-3"></div>
					<div class="col-md-6" align="center">
						<table class="table table-striped" >
							<tbody>
								<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
									<tr>
	       								<th scope="row"> Número Documento:</th>
	       								<td>${retaceo.codigoretaceo}</td>
	      							</tr>
      							</sec:authorize>
								<tr>
       								<th scope="row">Proveedor:</th>
       								<td>${retaceo.codigoproveedor}</td>
      							</tr>
      							<tr>
       								<th scope="row">Fecha:</th>
       								<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${retaceo.fecharetaceo}"/></td>
      							</tr>
      							<tr>
       								<th scope="row">Total:</th>
       								<td>$ ${retaceo.total}</td>
      							</tr>
      						</tbody>
      					</table>
    
  					</div>
  					
  					
  				</div>
  				<p class="thick" align="center">DETALLE RETACEO</p>
 	 <table class="table table-striped ">
				<thead>
		    		<tr class="success">		   
		    		        <th>Ítem</th> 			
			      			<th>Código Producto</th>			      			      			
			      			<th>Cantidad</th>
			      			<th>Costo $</th>
			      			<th>Precio $</th>
			      			<th>Subtotal $</th>
			      			
		    		</tr>
		    	</thead>
		    	<tbody>
		    	      <c:set var="contador" value="${0}" />
				    	<c:forEach items="${detalleretaceo}" var="retaceos" >
				    		<tr class="info">				    		
				    	 <c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	           <c:if test = "${salary > 2000}">
		    	                <c:set var="contador" value="${contador + 1}" />	
		    	                <td>${contador}</td>
				    			<td>${retaceos.codigoproducto}</td>				    		
				    			<td>${retaceos.cantidadproducto}</td>
				    		    <td>$ ${retaceos.costoproducto}</td>
				    			<td>$ ${retaceos.precioproducto}</td>
				    			<td>$ ${retaceos.subtotal}</td>	
				    					    			
				    		</c:if>
				    				
                        
                        </tr>
				    	 </c:forEach>
				    	 
				    	 <tr class="alert alert-success lead">
						    	        
						    			<td></td>
						    			<td></td>
						    		    <td></td>
						    			<td></td>
						    			<td>Total</td>
						    	        <td >
		                                   $ <fmt:formatNumber value = "${retaceo.total}" /> 
		                                </td>
		                                <td></td>
                         </tr>
		    	</tbody>
	    </table>   
      
					
			</div>
	<form class="form-horizontal" role="form" action="<c:url value="/retaceo" />" target="_blank">

            <div class="form-group">

            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-10">
                    <button type="submit" class="btn btn-primary">Imprimir Retaceo</button>
                    <a class="btn btn-danger" href="<c:url value="/detalleretaceo-list" />" role="button">Lista de Retaceos</a>
                </div>

				<input type="hidden" value="${loggedinuser}" name="usuario"/>
				<input type="hidden" value="Retaceo_filtrado.jasper" name="nombre"/>
            </div>
	</form>		
	</div>
	
	
</div>	
<div class="row"><%@include file="foot.jsp" %></div>	
</body>
</html>