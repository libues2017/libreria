<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.io.*" %> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Modificar Transferencia</title>
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


<%-- 
<%
	// Quiero la fecha actual para ponerla por defecto 
	String fecha="";
    String sAhora = "";
			
		if(session.getAttribute("fechaTransferencia")!=null){
			fecha=session.getAttribute("fechaTransferencia").toString();
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
--%>

<script type="text/javascript">
	function producto1(){
		
		var existencia1 = [];
    	var nombre1 = [];
    	var costo1 = [];
    	var precio1 = [];
    	
		
    	var Id = document.getElementById("codProducto").value;
    	var Id1 = document.getElementById("tipoTransferencia").value;
   	 	
		<c:forEach items="${producto}" var="current">

  			if(${current.correlativo} == Id){
   				nombre1.push("${current.nombreProducto}");
   				document.getElementById('nomProducto').value = nombre1;
 				
   				existencia1.push("${current.existencia}");
 				document.getElementById('existencia1').value = existencia1;
 				
 				if(Id1 == "Salidas"){
 					costo1.push("${current.costounitario}");
 	 			    document.getElementById('costoProducto').value = costo1;
 	 			    
 	 				precio1.push("${current.precio}");
 	 			    document.getElementById('precioProducto').value = precio1;
 				}
 				
 			    
  			}
		</c:forEach>
		return true;
		alert();			  	
	}
	
	function sesion(){		
		var tipo = document.getElementById('tipoTransferencia').value;
		var numero = document.getElementById('numeroTransferencia').value;
		var sucursal = document.getElementById("sucursal").value;
		var utilidad = document.getElementById('utilidad').value;		
		
		var tipo1 = "tp1";
		var numero1 = "num1";
		var sucursal1 = "sucu1";
		var utilidad1 = "uti1";
		
		sessionStorage[tipo1] = tipo;
		sessionStorage[numero1] = numero;
		sessionStorage[sucursal1] = sucursal;
		sessionStorage[utilidad1] = utilidad;
	}

</script>

<script>
	$( function() {		
		var p1;
		var p2;
		var p4;
		var p5;
	
		for(var i = 0; i < sessionStorage.length; i++)
		{	
			p1 = sessionStorage.getItem('tp1');
			p2 = sessionStorage.getItem('sucu1');
			p4 = sessionStorage.getItem('uti1');
			p5 = sessionStorage.getItem('num1');
		}
		document.getElementById("tipoTransferencia").value=p1;
		document.getElementById("sucursal").value=p2;
		document.getElementById("utilidad").value=p4;
		document.getElementById("numeroTransferencia").value=p5;
	} );

</script>


<script>
	
	function addIt(campo) {
	/* Aquí se detallan las siglas de las variables utilizadas en el cálculo: 
		
			Cantidad de Productos en existencia = PEX 
			Cantidad de Productos de entrada = PE 
			Costo Productos en Existencia = CPEX
			Costo Productos de entrada = CPE
			Costo Promedio Unitario = CPU
			Precio de Venta = PV 
			Total de Costo = TC
			Total de Artículos = TA  
			precio de venta anterior=PVA	
			
	La fórmula para el cálculo del costo promedio es la siguiente: 	
		
			TC = (PEX*CPEX) +(PE*CPE) 
			TA = PEX+PE 
            CPU=TC/TA 
			PV=CPU+(CPU*0.20). 		
			
	*/
	
	 numero=document.getElementById(campo).value;
	 // campo="costoproducto";
	  
	 if (!/^([0-9])*[.]?[0-9]*$/.test(numero) ){
		 	//alert("El valor " + campo + " no es un número valido");
	   		$("#glypcn"+campo).remove();
            //$('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
            //$('#'+campo).parent().children('span').text("no es un numero").show();
            $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            return false;
	 }  
        
     else{
    	 	var comparar = document.getElementById("tipoTransferencia").value;
    	 	if(comparar == "Ingresos"){
	    	 	$("#glypcn"+campo).remove();
				//$('#'+campo).parent().parent().attr("class", "form-group has-success has-feedback");
				$('#'+campo).parent().children('span').hide();
				$('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-ok form-control-feedback'></span>");
				
				var existencia = 0;
	    		var costoexistencia = 0.0;
	    		var precioventa = 0.0;
				var Id=document.getElementById("codProducto").value;
				var PEX; 
				var CPEX;		
				var CPU;
	    		var PV;
	    		var TC;
	    		var TA;
	    		var PE;
	    		var CPE;
	    		var PVA;
		
	 			<c:forEach items="${producto}" var="current">	
		   		    if(${current.correlativo}==Id)	
					{
		                existencia=${current.existencia};//2
		          		costoexistencia=${current.costounitario};//2
		          		precioventa=${current.precio};
		          		PVA=parseFloat(precioventa);//2.4
		          		PEX=parseInt(existencia);//2
		          		//PEX=existencia;
		          		CPEX=parseFloat(costoexistencia);//2
		          		//PVA=parseFloat(precio);			              		
		  		    }
		   		</c:forEach>
		   
		  		// alert(PEX);
	      		var cantidad=document.getElementById('cantidadProducto').value;//2
	    		PE=parseInt(cantidad);
	    		var costo=document.getElementById('costoProducto').value;//2
	    		CPE=parseFloat(costo);
		
		   		if(PEX==0){
			  		// alert();
			   		CPEX=CPE;   
			 		//PEX=1;
				}
		
			 	TC = (PEX*CPEX) +(PE*CPE) ;//(2*2) + (2*2)=8
		 		TA = PEX+PE ;//2+2=4	
		 
	     		CPU=TC/TA; //8/4                             
	     
		  		var utilidad=document.getElementById("utilidad").value;
		  		var utilidad1=0.0;
		      	utilidad1= parseInt(utilidad)/100;
		  
		 		// alert(PVA);
		 		PV=parseFloat(CPU)+(parseFloat(CPU)*utilidad1);  //
			   
		  		var costoproducto = document.getElementById('costoProducto').value;
		  		var cantidad=document.getElementById('cantidadProducto').value;								
		  		var cla2 = document.getElementById('precioProducto').value=PV;
		  		if(cantidad<0){
		  			alert('Digite un Valor Positivo');
		  		}
		  		else{
		  			var cla3 = document.getElementById('subTotal').value=parseFloat(costoproducto)*(parseInt(cantidad));
		  			$("#agregar").focus();
		  		}
		 		
		  		var cla4 = document.getElementById('existenciaAnterior').value=PEX;
		  		var cla5 = document.getElementById('costoAnterior').value=CPEX;
		  		var cla6 = document.getElementById('precioAnterior').value=PVA;
		  		
		  		var boton3 = document.getElementById("agregar");
		  		if(cantidad > 0 && costoproducto > 0){
		  			document.getElementById("agregar").style.display ='block';
					document.getElementById("validar").style.display ='none';
		  		}
		  		
		  		else{
		  			document.getElementById("validar").style.display ='block';
					document.getElementById('validar').innerHTML = 'Por favor, llenar y seleccionar todos los campos que se le piden en el formulario'
		  		}
		  		
		  		//alert(CPEX);
		  
		 		/* return true;
		  		alert();	*/
		  		return true;
     		}
    	 	
    	 	else{
    	 		
    	 		$("#glypcn"+campo).remove();
				//$('#'+campo).parent().parent().attr("class", "form-group has-success has-feedback");
				$('#'+campo).parent().children('span').hide();
				$('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-ok form-control-feedback'></span>");
				
				var existencia = 0;
	    		var costoexistencia = 0.0;
	    		var precioventa = 0.0;
				var Id=document.getElementById("codProducto").value;
				var PEX; 
				var CPEX;		
				var CPU;
	    		var PV;
	    		var TC;
	    		var TA;
	    		var PS;
	    		var CPS;
	    		var PVA;
		
	 			<c:forEach items="${producto}" var="current">	
		   		    if(${current.correlativo}==Id)	
					{
		                existencia=${current.existencia};
		          		costoexistencia=${current.costounitario};
		          		precioventa=${current.precio};
		          		PVA=parseFloat(precioventa);
		          		PEX=parseInt(existencia);
		          		CPEX=parseFloat(costoexistencia);//2			              		
		  		    }
		   		</c:forEach>
		   
	      		var cantidad = document.getElementById('cantidadProducto').value;//2
	    		PS = parseInt(cantidad);
	    		var costo = document.getElementById('costoProducto').value;//2
	    		CPS = parseFloat(costo);
		
		   		if(PEX == 0){
			   		CPEX = CPS;   
				}
		
			 	TC = (PEX*CPEX) +(PS*CPS) ;
		 		
			 	TA = PEX-PE ;	
		                             
		  		var utilidad = document.getElementById("utilidad").value;
		  		var utilidad1 = 0.0;
		      	utilidad1 = parseInt(utilidad)/100;
		  
		 		PV=parseFloat(PVA);
			   
		 		var existencia1 = parseInt(document.getElementById("existencia1").value);
		 		var costoproducto = document.getElementById('costoProducto').value;
		  		var cantidad=document.getElementById('cantidadProducto').value;								
		  		var cla2 = document.getElementById('precioProducto').value=PV;
		  		if(cantidad > existencia1){
		  			alert('No hay suficiente Producto en Bodega para Transferir');
		  		}
		  		else{
		  			var cla3 = document.getElementById('subTotal').value=parseFloat(costoproducto)*(parseInt(cantidad));
		  			$("#agregar").focus();
		  		}
		 		
				var boton2 = document.getElementById("agregar");
		  		
		  		if(cantidad > 0){
		  			document.getElementById("agregar").style.display ='block';
					document.getElementById("validar").style.display ='none';
		  		}
		  		else{
		  			document.getElementById("validar").style.display ='block';
					document.getElementById('validar').innerHTML = 'Por favor, llene y seleccione todos los campos que se le piden en el formulario'
		  		}
		  		
		  		var cla4 = document.getElementById('existenciaAnterior').value=PEX;
		  		var cla5 = document.getElementById('costoAnterior').value=CPEX;
		  		var cla6 = document.getElementById('precioAnterior').value=PVA;
		  		
		  		return true;
    	 		
    	 	}
  
		}//fin else
	}

</script>

<script>
	$( function() {
		var sessionId1 = [];
	
		<c:forEach items="${producto}" var="current">								
			sessionId1.push("${current.correlativo}");						
		</c:forEach>					    
	
		$( "#codProducto" ).autocomplete({
			// source: availableTags
			source: sessionId1
		});
	} );
</script>  
<script>
function cambiar(){
	var numero = document.getElementById("numeroTransferencia").value;	
	
		if(numero != null)
        {
        	$("#tipoTransferencia").focus();
        	}
}
function cambiar1(){
	var tipo = document.getElementById("tipoTransferencia").value;	
	
		if(tipo != null)
        {
        	$("#sucursal").focus();
        	}
}
function cambiar3(){
	var codigo = document.getElementById("codProducto").value;	
	
		if(codigo != null)
        {
        	$("#cantidadProducto").focus();
        	}
}
</script>

</head>
<body>
	<div class="row"><%@include file="page_head_2.jsp"%></div>
	<div class="container">
		<div class="well lead" align="center">MODIFICAR TRANSFERENCIA</div>
			<form:form method="POST" name="trans" modelAttribute="detalletransferencia"	class="form-horizontal">
			<form:input type="hidden" path="codDetalleTransferencia" id="codDetalleTransferencia" />
		
		<div class="panel-group">			
			<div class="panel panel-default">
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-3" style="display:none ">
							<label class="form-control" for="nombr">ID</label>
							<form:input type="text" path="codTransferencia" id="codTransferencia" class="form-control input-sm" value='<%=request.getAttribute("codTransferencia").toString()%>' />
						</div>
						
						<div class="col-xs-3" style="display:none">
							<label class="form-control" for="nombr">Transferencia #:</label>
							<input type="text" name="numeroTransferencia" id="numeroTransferencia" class="form-control input-sm" value='${numeroTransferencia}'/>
						</div>
						
						<div class="col-xs-3">
							<label class="form-control" for="nombr">Transferencia #:</label>
							<input type="text" name="numeroTransferencia" id="numeroTransferencia" class="form-control input-sm" value='${numeroTransferencia}' disabled="disabled"/>
						</div>
						
						<div class="col-xs-2" style="display:none">			
							<label class="form-control" for="nombr">De:</label>
							<input type="text" name="tipoTransferencia" id="tipoTransferencia" class="form-control input-sm" value ='${tipoTransferencia}'>
						</div>
						
						<div class="col-xs-2">			
							<label class="form-control" for="nombr">De:</label>
							<input type="text" name="tipoTransferencia" id="tipoTransferencia" class="form-control input-sm" value ='${tipoTransferencia}' disabled="disabled">
						</div>
						
						<div class="col-xs-3" style="display:none">			
							<label class="form-control" for="nombr">Fecha:</label>
							<input type="date" id="fechaTransferencia" name="fechaTransferencia" class="form-control input-sm" value ='${fechaTransferencia}' />
						</div>
						
						<div class="col-xs-3">			
							<label class="form-control" for="nombr">Fecha:</label>
							<input type="date" id="fechaTransferencia" name="fechaTransferencia" class="form-control input-sm" value='${fechaTransferencia}' disabled="disabled"/>
						</div>
						
						<div class="col-xs-2" style="display:none">			
							<label class="form-control" for="nombr">Sucursal:</label>
							<input type="text" name="sucursal" id="sucursal" class="form-control input-sm" value ='${sucursal}'>
						</div>
						
						<div class="col-xs-2">			
							<label class="form-control" for="nombr">Sucursal:</label>
							<input type="text" name="sucursal" id="sucursal" class="form-control input-sm" value ='${sucursal}' disabled="disabled">
						</div>
						
						<div class="col-xs-2" style="display:none">
							<label class="form-control" for="nombr">Utilidad:</label>
							<form:input type="text" min="0" path="utilidad" id="utilidad" name="utilidad" class="form-control input-sm" value='${utilidad}'/>
						</div>
						
						<div class="col-xs-2">
							<label class="form-control" for="nombr">Utilidad:</label>
							<form:input type="text" min="0" path="utilidad" id="utilidad" name="utilidad" class="form-control input-sm" value='${utilidad}' disabled="disabled"/>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="form-group row">		
					<div class="panel-body">
						
						<div class="col-xs-2">			
							<label class="form-control" for="tags">Código:</label>
							<form:input type="text" path="codProducto" id="codProducto" class="form-control input-sm" onchange='producto1(); cambiar3();' placeholder="Digitar"
							title="Digite el Código de Producto" />
						</div>
						
						<div class="col-xs-8">
							<label class="form-control" for="nombr">Título:</label>
							<input type="text" name="nomProducto" id="nomProducto" class="form-control input-sm" placeholder="Automático"
							title="Muestra el Titulo del Producto" />
						</div>
						
						<div class="col-xs-2">		
							<label class="form-control" for="existencia1" >Existencias:</label>
							<input type="text" name="existencia1" id="existencia1" class="form-control input-sm" placeholder="Automático" 
							title="Indica la cantidad de productos existentes en bodega" />					                   
						</div>
					
					</div>
				</div>
				<div class="form-group row">
					<div class="panel-body">		
						<div class="col-xs-2">
							<label class="form-control" for="nombr">Cantidad:</label>
							<form:input type="number" min="1" path="cantidadProducto" id="cantidadProducto" class="form-control input-sm" onchange="addIt('cantidadProducto');" 
							placeholder="Digitar" title="El Valor debe ser entero"/>
						</div>
						<div class="col-xs-2">
							<label class="form-control" for="nombr">Costo:</label>
							<form:input type="text" path="costoProducto" id="costoProducto" class="form-control input-sm" onchange="addIt('costoProducto');" value='0' 
							title="Si la Transferencia es de Ingresos digite el costo, de lo contrario se llena Automáticamente" />
						</div>
						<div class="col-xs-2">		
							<label class="form-control" for="nombr">Precio:</label>
							<form:input type="text" path="precioProducto" id="precioProducto" class="form-control input-sm" placeholder="Automático"
							title="Este campo es Calculado"/>
						</div>
						<div class="col-xs-2">
							<label class="form-control" for="nombr">SubTotal:</label>
							<form:input type="text" path="subTotal" id="subTotal" class="form-control input-sm" placeholder="Automático"
							title="Este Valor es Calculado"/>
						</div>
						
						<div class="col-xs-2" style="display: none">
							<label class="col-md-3 control-lable" for="nombr">EXISTENCIA ANTERIOR</label>
							<form:input type="text" path="existenciaAnterior" id="existenciaAnterior" class="form-control input-sm" />
						</div>
						<div class="col-xs-2" style="display: none">
							<label class="col-md-3 control-lable" for="nombr">Costo	ANTERIOR</label>
							<form:input type="text" path="costoAnterior" id="costoAnterior" class="form-control input-sm" />
						</div>
						<div class="col-xs-2" style="display: none">
							<label class="col-md-3 control-lable" for="nombr">Precio ANTERIOR</label>
							<form:input type="text" path="precioAnterior" id="precioAnterior" class="form-control input-sm" />
						</div>	
						
						<div class="col-xs-2">
							<input type="button" value="Agregar"  id="agrega" class="btn btn-primary btn-sm" onclick="trans.submit()" title="Agrega Producto a La Transferencia"/>
						</div>
						<div class="col-xs-2">
							<a href="<c:url value='/transferencia-list' />"  class="btn btn-primary btn-sm" title="Descartar Transferencia">Cancelar</a>
						</div>
					</div>
				</div>
			</div>
		</div>								
	
		<p class="thick" align="center">DETALLE DE LOS PRODUCTOS A TRANSFERIR</p>
				<table class="table table-striped ">
					<thead>
						<tr class="success">
							<th>Ítem</th>
							<th>Código</th>
							<th>Título</th>
							<th>Cantidad</th>
							<th>Costo</th>
							<th>Precio</th>
							<th>SubTotal</th>
							<th>ELIMINAR</th>
						</tr >
					</thead>
					
					<tbody>
						<c:set var="contador2" value="${0}"/>
						<c:forEach items="${transferencia2}" var="transferencias">
							<tr class="info">
								<c:set var="salary" scope="session" value="${2000*2}" />
								<c:if test="${salary > 2000}">
								<c:set var="contador2" value="${contador2 + 1}" />
									<td>${contador2}</td>
									<td>${transferencias.codProducto}</td>
									<td>${transferencias.nomProducto}</td>
									<td>${transferencias.cantidadProducto}</td>
									<td>$${transferencias.costoProducto}</td>
									<td>$${transferencias.precioProducto}</td>
									<td>$${transferencias.subTotal}</td>
								</c:if>

								<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO')">
									<td><a href="<c:url value='/delete-detalleTransferencia-${transferencias.codDetalleTransferencia}' />"
										class="btn btn-danger custom-width">Eliminar</a></td>
								</sec:authorize>
							</tr>
						</c:forEach>
						
						<tr class="alert alert-success lead">
						    	        <td></td>
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
				<a href="<c:url value='/finalizar-update' />" class="btn btn-primary btn-sm">Guardar Transferencia</a>
			</div>			
		</form:form>
</div>

<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>