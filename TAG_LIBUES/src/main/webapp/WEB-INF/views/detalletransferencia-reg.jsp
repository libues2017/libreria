<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Agregar Transferencia</title>
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

<Style>
	h1.hidden {
    	visibility: hidden;
    }
</Style>

<Style>
	.control-label{
		text-align: left;
	}
</Style>

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
 	 			    document.getElementById('precioProducto').value = costo1;
 				}
 				
 			    
  			}
		</c:forEach>
		return true;
		alert();			  	
	}
	
	function sesion(){
		var fechaTransferencia = document.getElementById("fechaTransferencia").value;
		var tipo = document.getElementById('tipoTransferencia').value;
		var origen = document.getElementById("origen").value;
		var destino = document.getElementById('destino').value;
		var utilidad = document.getElementById('utilidad').value;
		
		var fecha = "f1";
		var tipo1 = "tp1";
		var origen1 = "orig1";
		var destino1 = "dest1";
		var utilidad1 = "uti1";
		
		sessionStorage[fecha] = fechaTransferencia;
		sessionStorage[tipo1] = tipo;
		sessionStorage[origen1] = origen;
		sessionStorage[destino1] = destino;
		sessionStorage[utilidad1] = utilidad;
	}

</script>

<script>
	$( function() {
		var p;
		var p1;
		var p2;
		var p3;
		var p4;
	
		for(var i = 0; i < sessionStorage.length; i++)
		{						                
			p = sessionStorage.getItem('f1');
			p1 = sessionStorage.getItem('tp1');
			p2 = sessionStorage.getItem('orig1');
			p3 = sessionStorage.getItem('dest1');
			p4 = sessionStorage.getItem('uti1');
		}
		document.getElementById("fechaTransferencia").value=p;
		document.getElementById("tipoTransferencia").value=p1;
		document.getElementById("origen").value=p2;
		document.getElementById("destino").value=p3;
		document.getElementById("utilidad").value=p4;
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
	     	//alert("El valor " + campo + " no es un número");
	   		$("#glypcn"+campo).remove();
            $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
            $('#'+campo).parent().children('span').text("no es un numero").show();
            $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            return false;
	 }  
        
     else{
    	 	var comparar = document.getElementById("tipoTransferencia").value;
    	 	if(comparar == "Ingresos"){
	    	 	$("#glypcn"+campo).remove();
				$('#'+campo).parent().parent().attr("class", "form-group has-success has-feedback");
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
		 		var cla3 = document.getElementById('subTotal').value=parseFloat(costoproducto)*(parseInt(cantidad));
		  		var cla4 = document.getElementById('existenciaAnterior').value=PEX;
		  		var cla5 = document.getElementById('costoAnterior').value=CPEX;
		  		var cla6 = document.getElementById('precioAnterior').value=PVA;
		  		//alert(CPEX);
		  
		 		/* return true;
		  		alert();	*/
		  		return true;
     		}
    	 	
    	 	else{
    	 		
    	 		$("#glypcn"+campo).remove();
				$('#'+campo).parent().parent().attr("class", "form-group has-success has-feedback");
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
			   
		  		var costoproducto = document.getElementById('costoProducto').value;
		  		var cantidad=document.getElementById('cantidadProducto').value;								
		  		var cla2 = document.getElementById('precioProducto').value=PV;								
		 		var cla3 = document.getElementById('subTotal').value=parseFloat(costoproducto)*(parseInt(cantidad));
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

</head>
<body Style="background-color:#97965B">
	<div class="row"><%@include file="page_head_2.jsp"%></div>
	<div class="container">
		<div class="well lead">Agregar Transferencia</div>
			<form:form method="POST" modelAttribute="detalletransferencia"	class="form-horizontal">
			<form:input type="hidden" path="codDetalleTransferencia" id="codDetalleTransferencia" />
		
		<div class="panel-group">			
			<div class="panel panel-default">
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-2">
							<label class="form-control" for="nombr">Doc. #:</label>
							<form:input type="text" path="codTransferencia" id="codTransferencia" class="form-control input-sm" value='<%=session.getAttribute("codigo1")%>' />
						</div>
						<div class="col-xs-2">			
							<label class="form-control" for="nombr">Origen:</label>
							<SELECT name="origen" id="origen" class="form-control input-sm" onchange="sesion();">
								<OPTION VALUE="SV-SS">San Salvador</OPTION>
								<OPTION VALUE="SV-SA">Santa Ana</OPTION>
								<OPTION VALUE="SV-SM">San Miguel</OPTION>
								<OPTION VALUE="SV-SV">San Vicente</OPTION>
							</SELECT>
						</div>
						<div class="col-xs-2">			
						<label class="form-control" for="nombr">Fecha:</label>
						<input type="date" id="fechaTransferencia" name="fechaTransferencia" class="form-control input-sm" onchange="sesion();" />
						</div>
						<div class="col-xs-2">			
							<label class="form-control" for="nombr">Destino:</label>
							<SELECT name="destino" id="destino" class="form-control input-sm" onchange="sesion();">
								<OPTION VALUE="SV-SS">San Salvador</OPTION>
								<OPTION VALUE="SV-SA">Santa Ana</OPTION>
								<OPTION VALUE="SV-SM">San Miguel</OPTION>
								<OPTION VALUE="SV-SV">San Vicente</OPTION>
							</SELECT>
						</div>
						<div class="col-xs-2">			
							<label class="form-control" for="nombr">De:</label>
							<SELECT name="tipoTransferencia" id="tipoTransferencia" class="form-control input-sm" onchange="sesion();">
								<OPTION VALUE="Salidas">Salidas</OPTION>
								<OPTION VALUE="Ingresos">Ingresos</OPTION>
							</SELECT>
						</div>
						<div class="col-xs-2">
							<label class="form-control" for="nombr">Utilidad:</label>
							<form:input type="number" min="0" path="utilidad" id="utilidad" class="form-control input-sm" onchange="sesion();" />
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-2">			
							<label class="form-control" for="tags">Codigo:</label>
							<form:input type="text" path="codProducto" id="codProducto" class="form-control input-sm" onchange='producto1();' />
						</div>
						<div class="col-xs-8">
							<label class="form-control" for="nombr">Titulo:</label>
							<input type="text" name="nomProducto" id="nomProducto" class="form-control input-sm"  />
						</div>
						<div class="col-xs-2">		
							<label class="form-control" for="existencia1" >Existencias:</label>
							<input type="text" name="existencia1" id="existencia1" class="form-control input-sm"  />					                   
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="panel-body">		
						<div class="col-xs-2">
							<label class="form-control" for="nombr">Cantidad:</label>
							<form:input type="number" min="1" path="cantidadProducto" id="cantidadProducto" class="form-control input-sm" onchange="addIt('cantidadProducto')" />
						</div>
						<div class="col-xs-2">
							<label class="form-control" for="nombr">Costo:</label>
							<form:input type="text" path="costoProducto" id="costoProducto" class="form-control input-sm" onchange="addIt('costoProducto');" value='0' />
						</div>
						<div class="col-xs-2">		
							<label class="form-control" for="nombr">Precio:</label>
							<form:input type="text" path="precioProducto" id="precioProducto" class="form-control input-sm" />
						</div>
						<div class="col-xs-2">
							<label class="form-control" for="nombr">SubTotal:</label>
							<form:input type="text" path="subTotal" id="subTotal" class="form-control input-sm" />
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
							<input type="submit" value="Agregar" class="btn btn-primary btn-sm" />
						</div>
						<div class="col-xs-2">
							<a href="<c:url value='/transferencia-list' />"  class="btn btn-primary btn-sm" >Cancelar</a>
						</div>
					</div>
				</div>
			</div>
		</div>								
	
				<table class="table table-striped ">
					<thead>
						<tr class="success">
							<th>Codigo</th>
							<th>Titulo</th>
							<th>Cantidad</th>
							<th>Costo</th>
							<th>Precio</th>
							<th>SubTotal</th>
							<th>ELIMINAR</th>
						</tr >
					</thead>
					
					<tbody>
						<c:forEach items="${transferencia2}" var="transferencias">
							<tr class="info">
								<c:set var="salary" scope="session" value="${2000*2}" />
								<c:if test="${salary > 2000}">
									<td>${transferencias.codProducto}</td>
									<td>${transferencias.nomProducto}</td>
									<td>${transferencias.cantidadProducto}</td>
									<td>$${transferencias.costoProducto}</td>
									<td>$${transferencias.precioProducto}</td>
									<td>$${transferencias.subTotal}</td>
								</c:if>

								<sec:authorize access="hasRole('ADMINISTRADOR')">
									<td><a href="<c:url value='/delete-detalleTransferencia-${transferencias.codDetalleTransferencia}' />"
										class="btn btn-danger custom-width">Eliminar</a></td>
								</sec:authorize>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<div class="well lead" align="center">	
				<a href="<c:url value='/finalizar1' />" class="btn btn-primary btn-sm" >Guardar Transferencia</a>
			</div>			
		</form:form>
</div>

<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>