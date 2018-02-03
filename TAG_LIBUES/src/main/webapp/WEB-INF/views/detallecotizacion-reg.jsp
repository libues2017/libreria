<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.io.*" %> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Realizar Cotización</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	
	<%
		// Quiero la fecha actual para ponerla por defecto 
		String fecha="";
    	String sAhora = "";
			
		if(session.getAttribute("fechaCotizacion")!=null){
			fecha=session.getAttribute("fechaCotizacion").toString();
		}
        if(fecha==""){
        	Calendar ahora = Calendar.getInstance();
     		int anyo = ahora.get(Calendar.YEAR);
     		int mes = ahora.get(Calendar.MONTH) +1; 
     		int dia = ahora.get(Calendar.DAY_OF_MONTH);
     					
     		if (mes < 10) {
     			sAhora = anyo + "-0" + mes;
     		} else {
     			sAhora = anyo + "-" + mes;
     			}
     			if (dia < 10) {
     				sAhora += "-0" + dia;
     			}
     			else {
     				sAhora += "-"+dia;
     			} 
                  	 
           	}
                     
            else{
                    	 
            sAhora=fecha;
		}
	%>
	
	<script type="text/javascript">

		function producto2(){
			var nombreProducto1 = [];			
			var valorUnitario1 = [];	
			var Id = document.getElementById("codigoProducto").value;
	
			<c:forEach items="${producto}" var="current" >
		
		  		if( ${current.correlativo} == Id) {	    	 		  
		    	
		  			nombreProducto1.push("${current.nombreProducto}");
		      		document.getElementById('nombreProducto').value = nombreProducto1;
		      	      	   		      		      
		      		valorUnitario1.push("${current.precio}");
		      		document.getElementById('valorUnitario').value = valorUnitario1;
		    	}
			</c:forEach>              		
      		return true;					
			alert();
     	}
    
	
    	function sesion(){		
      		var nombreCliente1 = document.getElementById('nombreCliente').value;
      		var telefono = document.getElementById('telefono').value;
      		var correo = document.getElementById('correo').value;
      	
      		var nombreCli1 = "nombreCli";
      		var tel1 = "tele";
      		var corre1 = "corre"
      	
      		sessionStorage[nombreCli1] = nombreCliente1;  
      		sessionStorage[tel1] = telefono;
      		sessionStorage[corre1] = correo;
    	}	
	</script>
	
	<script>
		$( function() {		
			var a1;
			var a2;
			var a3;
			var a4;
	
			for(var i = 0; i < sessionStorage.length; i++){	
				a1 = sessionStorage.getItem('nombreCli');
				a2 = sessionStorage.getItem('tele');
				a3 = sessionStorage.getItem('corre');
			}
			document.getElementById("nombreCliente").value=a1;
			document.getElementById("telefono").value=a2;
			document.getElementById("correo").value=a3;
		} );
	</script>
	
	<script>
		$( function() {
			var sessionId1 = [];
			<c:forEach items="${producto}" var="current">								
				sessionId1.push("${current.correlativo}");						
			</c:forEach>					    
	
			$( "#codigoProducto" ).autocomplete({
				// source: availableTags
				source: sessionId1
			});
		} );
	</script>
	
	<script>
		function cotizacion2(){
			var cantidad2 = parseInt(document.getElementById("cantidad").value);
			var valorUnitario = document.getElementById("valorUnitario").value;
			var valorTotal = document.getElementById('valorTotal').value = parseFloat(valorUnitario)*(parseInt(cantidad2));
			if(cantidad2 != null){
				$("#agrega").focus();
			}
			
		}
		
		function saltar1(){
			var nombre = document.getElementById("nombreCliente").value;
			if(nombre != null){
				$("#telefono").focus();
			}
			
		}
		
		function saltar2(){
			var telefono = document.getElementById("telefono").value;
			if(telefono != null){
				$("#correo").focus();
			}
			
			
		}
		
		function saltar3(){
			var correo = document.getElementById("correo").value;
			if(correo != null){
				$("#codigoProducto").focus();
			}
			
			
		}
		
		function saltar4(){
			var codigo = document.getElementById("codigoProducto").value;
			if(codigo != null){
				$("#cantidad").focus();
			}
			
			
		}
	</script>
	
</head>
<body>
	<div class="row"><%@include file="page_head_2.jsp"%></div>
	<div class="container">
		<div class="well lead" align="center">NUEVA COTIZACIÓN</div>
		<form:form method="POST" name="cotiza" modelAttribute="detallecotizacion" class="form-horizontal">
		<form:input type="hidden" path="numeroDetalle" id="numeroDetalle" />
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="form-group row">
						<div class="panel-body">
							<div class="col-xs-3" style="display:none">
								<label class="form-control" for="nombr">Cotización #:</label>
								<form:input type="text" path="codigoCotizacion" id="codigoCotizacion" maxlength="11" class="form-control input-sm"  value='<%=session.getAttribute("codigo6")%>' />
							</div>
							<div class="col-xs-3">
								<label class="form-control" for="nombr">Cotización #:</label>
								<input type="text" title="Número de Cotización" class="form-control input-sm" value='<%=session.getAttribute("codigo6")%>' disabled="disabled" />
							</div>
							<div class="col-xs-3" style="display:none">			
								<label class="form-control" for="nombr">Fecha:</label>
								<input type="date" id="fechaCotizacion" name="fechaCotizacion" class="form-control input-sm" value="<%=sAhora %>" />
							</div>
							<div class="col-xs-3">			
								<label class="form-control" for="nombr">Fecha:</label>
								<input type="date" id="fechaCotizacion" name="fechaCotizacion" class="form-control input-sm" 
								title="Fecha de Cotización" value="<%=sAhora %>" disabled="disabled"/>
							</div>
							<div class="col-xs-6">
								<label class="form-control" for="nombr">Nombre del Cliente:</label>
								<input type="text" id="nombreCliente" name="nombreCliente" maxlength="60" class="form-control input-sm" onchange="sesion(); saltar1();" placeholder="Digitar"
								title="Digite el nombre del Cliente"/>
							</div>	
						</div>
					</div>
					<div class="form-group row">
						<div class="panel-body">
							<div class="col-xs-4">
								<label class="form-control" for="nombr">Número de Teléfono:</label>
								<input type="text" id="telefono" name="telefono" maxlength="9" class="form-control input-sm" onchange="sesion(); saltar2();" placeholder="Digitar"
								title="Digite el número de Telefono del Cliente"/>
							</div>
							<div class="col-xs-7">
								<label class="form-control" for="nombr">Correo Electrónico:</label>
								<input type="text" id="correo" name="correo" maxlength="65" class="form-control input-sm" onchange="sesion(); saltar3();" placeholder="Digitar"
								title="Digite el correo electrónico del Cliente"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel panel-success">
					<div class="form-group row">
						<div class="panel-body">
							<div class="col-xs-4">
				        		<label class="form-control" for="tags">Código de Producto:</label>
	                    		<form:input type="number" path="codigoProducto" id="codigoProducto" maxlength="11" placeholder="DIGITE"  class="form-control input-sm" onchange='producto2(); saltar4();' 
	                    	 	onkeypress='producto2();' title="Digite el Código del Producto"/>        
                    		</div>
                    		<div class="col-xs-7"> 
	                    		<label class="form-control" for="nombr">Nombre de Producto:</label>
								<form:input type="text" path="nombreProducto" id="nombreProducto" maxlength="50" placeholder="AUTOMÁTICO" class="form-control input-sm" />
							</div>
							
						</div>
						<div class="panel-body">
							<div class="col-xs-3">
								<label class="form-control" for="precio">Precio $:</label>
								<form:input type="text" path="valorUnitario" id="valorUnitario" placeholder="AUTOMÁTICO" class="form-control input-sm" title="Se llena automaticamente"/>							
							</div>
							<div class="col-xs-2">
	                    		<label class="form-control" for="nombr">Cantidad:</label>
	                    		<form:input type="number" min="1" path="cantidad" id="cantidad" maxlength="11" placeholder="DIGITE" class="form-control input-sm" title="Digite la Cantidad de producto a cotizar" onchange="cotizacion2();
	                    		saltar4();"/>
                    		</div>
                    		<div class="col-xs-3">
	                    		<label class="form-control" for="nombr">Total $:</label>
	                    		<form:input type="text" path="valorTotal" id="valorTotal" placeholder="AUTOMÁTICO" class="form-control input-sm" title="Este Valor es Calculado"/>
                    		</div>
                    		<div class="col-xs-2">
								<input type="button" value="Agregar"  id="agrega" class="btn btn-primary" onclick="cotiza.submit()" title="Agrega Producto a La Cotización"/>
							</div>
							<div class="col-xs-2">
								<a href="<c:url value='/cotizacion-list' />"  class="btn btn-primary" title="Descartar Cotización">Salir</a>
							</div>
                    	</div>
						
					</div>
				</div>
			</div>
			
			<p class="thick" align="center">DETALLE DE LOS PRODUCTOS COTIZADOS</p>
			<table class="table table-striped ">
				<thead>
					<tr class="success">		   
			    		        <th>ÍTEM</th> 			
				      			<th>Código Producto</th>
				      			<th>Nombre Producto</th>			      			      			
				      			<th>Cantidad</th>
				      			<th>Precio</th>
				      			<th>SubTotal</th>
				      			<th></th>	
			    	</tr>
				</thead>
				<tbody>
					<c:set var="contador" value="${0}"/>
					<c:forEach items="${cotiza1}" var="cotizaciones">
						<tr class="info">
							<c:set var="salary" scope="session" value="${2000*2}"/>
							<c:if test="${salary > 2000 }">
								<c:set var="contador" value="${contador + 1}" />	
			    	        		<td>${contador}</td>
					    			<td>${cotizaciones.codigoProducto}</td>				    		
					    			<td>${cotizaciones.nombreProducto}</td>
					    			<td>${cotizaciones.cantidad}</td>
					    			<td>$ ${cotizaciones.valorUnitario}</td>
					    			<td>$ ${cotizaciones.valorTotal}</td>
							</c:if>
						
							<sec:authorize access="hasRole('ADMINISTRADOR')">
	                    		<td><a href="<c:url value='/delete-detallecotizacion-${cotizaciones.numeroDetalle}' />" class="btn btn-danger custom-width">Eliminar</a></td>
	                    	</sec:authorize>
	                	</tr>
					</c:forEach>
					
					<tr class="alert alert-success lead">
						    	        <td></td>
						    			<td></td>
						    			<td></td>
						    		    <td></td>						    		  						    			
						    			<td>TOTAL</td>
						    	        <td >
		                                   $${total} 
		                                </td>
		                                <td></td>
                	</tr>
				</tbody>
			</table>
			
			<!--
			<div class="row" align="right">
            	<div class="form-group col-md-12">
                	<label class="col-md-9 control-lable" for="total">TOTAL:</label>
                    <div class="col-md-2">
                   		<input type="text" id="total" placeholder="AUTOMATICO" class="form-control input-sm" title="Se llena automaticamente" 
                    	value="$ ${total}" />                           
                    </div>
            	</div>
           </div>			
			-->
			<div class="well lead" align="center">	
				<a href="<c:url value='/finalizarCotizacion' />" class="btn btn-primary btn-sm">Terminar Cotización</a>
			</div>
			
		</form:form>
	</div>
	<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
 	<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 	<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</body>
</html>