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
 				document.getElementById('existencia1').innerHTML = existencia1;
 				
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
<body>
	<div class="row"><%@include file="page_head.jsp"%></div>
	<div class="container">
		<div class="row"><%@include file="menu.jsp"%></div>
		<div class="col-md-12">
			<div class="well lead">Agregar Transferencia</div>
			<form:form method="POST" modelAttribute="detalletransferencia"
				class="form-horizontal">
				<form:input type="hidden" path="codDetalleTransferencia"
					id="codDetalleTransferencia" />

				<table class="col-sm-12 col-md-12">
					<tr>
						<td>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-5 control-lable" for="nombr">Transferencia #:</label>
									<div class="col-md-6">
										<form:input type="text" path="codTransferencia" id="codTransferencia" class="form-control input-sm" value='<%=session.getAttribute("codigo1")%>' />
										<div class="has-error">
											<form:errors path="codTransferencia" class="help-inline" />
										</div>
									</div>
								</div>
							</div>

						</td>

						<td>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-4 control-lable" for="nombr">Origen:</label>
									<div class="col-md-7">
										<!-- <input type="text" name="origen" id="origen" class="form-control input-sm" onchange="sesion();" />-->
										<SELECT name="origen" id="origen" class="form-control input-sm" onchange="sesion();">
											<OPTION VALUE="SV-SS">San Salvador</OPTION>
											<OPTION VALUE="SV-SA">Santa Ana</OPTION>
											<OPTION VALUE="SV-SM">San Miguel</OPTION>
											<OPTION VALUE="SV-SV">San Vicente</OPTION>
										</SELECT>
									</div>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-5 control-lable" for="nombr">Fecha Transferencia:</label>
									<div class="col-md-6">
										<input type="date" id="fechaTransferencia" name="fechaTransferencia" class="form-control input-sm" onchange="sesion();" />
									</div>
								</div>
							</div>
						</td>

						<td>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-4 control-lable" for="nombr">Destino:</label>
									<div class="col-md-7">
										<!-- <input type="text" name="destino" id="destino" class="form-control input-sm" onchange="sesion();" />-->
										<SELECT name="destino" id="destino" class="form-control input-sm" onchange="sesion();">
											<OPTION VALUE="SV-SS">San Salvador</OPTION>
											<OPTION VALUE="SV-SA">Santa Ana</OPTION>
											<OPTION VALUE="SV-SM">San Miguel</OPTION>
											<OPTION VALUE="SV-SV">San Vicente</OPTION>
										</SELECT>
									</div>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<th>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-5 control-lable" for="nombr">De:</label>
									<div class="col-md-6">
										<!--<input type="text" name="tipoTransferencia" id="tipoTransferencia" class="form-control input-sm" onchange="sesion();" />-->
										<SELECT name="tipoTransferencia" id="tipoTransferencia" class="form-control input-sm" onchange="sesion();">
											<OPTION VALUE="Salidas">Salidas</OPTION>
											<OPTION VALUE="Ingresos">Ingresos</OPTION>
										</SELECT>
									</div>
								</div>
							</div>
						</th>

						<th>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-4 control-lable" for="nombr">Utilidad:</label>
									<div class="col-md-7">
										<form:input type="text" path="utilidad" id="utilidad" class="form-control input-sm" onchange="sesion();" />
										<div class="has-error">
											<form:errors path="utilidad" class="help-inline" />
										</div>
									</div>
								</div>
							</div>
						</th>
					</tr>

				</table>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="tags">Codigo:</label>
						<div class="col-md-3">
							<form:input type="text" path="codProducto" id="codProducto" class="form-control input-sm" onchange='producto1();' />
							<div class="has-error">
								<form:errors path="codProducto" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<table class="col-sm-12 col-md-12">
					<tr>
						<th>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-4 control-lable" for="nombr">Titulo:</label>
									<div class="col-md-7">
										<input type="text" name="nomProducto" id="nomProducto" class="form-control input-sm"  />
									</div>
								</div>
							</div>
						</th>
						
						<th>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-4 control-lable" >Existencias:</label>
									<div class="col-md-7">  
										<table class="table table-striped ">
											<td><label class="col-md-3 control-lable" for="existencia1" id="existencia1"></label></td>					                   
					    				</table>   
									</div>
								</div>
							</div>
						</th>
					</tr>
				</table>

				<table class="col-sm-12 col-md-12">
					<tr>
						<th>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-4 control-lable" for="nombr">Cantidad:</label>
									<div class="col-md-7">
										<form:input type="text" path="cantidadProducto" id="cantidadProducto" class="form-control input-sm" onchange="addIt('cantidadProducto')" />
										<div class="has-error">
											<form:errors path="cantidadProducto" class="help-inline" />
										</div>
										<span class="help-block"></span>
									</div>
								</div>
							</div>
						</th>
						
						<th>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-4 control-lable" for="nombr">Costo:</label>
									<div class="col-md-7">
										<form:input type="text" path="costoProducto" id="costoProducto" class="form-control input-sm" onchange="addIt('costoProducto');" value='0' />
										<div class="has-error">
											<form:errors path="costoProducto" class="help-inline" />
										</div>
										<span class="help-block"></span>
									</div>
								</div>
							</div>
						</th>
						
						<th>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-4 control-lable" for="nombr">Precio:</label>
									<div class="col-md-7">
										<form:input type="text" path="precioProducto" id="precioProducto" class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="precioProducto" class="help-inline" />
										</div>
									</div>
								</div>
							</div>
						</th>
						
						<th>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-4 control-lable" for="nombr">SubTotal:</label>
									<div class="col-md-7">
										<form:input type="text" path="subTotal" id="subTotal" class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="subTotal" class="help-inline" />
										</div>
									</div>
								</div>
							</div>
						</th>
				
					</tr>
				</table>
				

				<div class="row">
					<div class="form-group col-md-12" style="display: none">
						<label class="col-md-3 control-lable" for="nombr">EXISTENCIA
							ANTERIOR</label>
						<div class="col-md-7">
							<form:input type="text" path="existenciaAnterior"
								id="existenciaAnterior" class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="existenciaAnterior" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12" style="display: none">
						<label class="col-md-3 control-lable" for="nombr">Costo
							ANTERIOR</label>
						<div class="col-md-7">
							<form:input type="text" path="costoAnterior" id="costoAnterior"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="costoAnterior" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12" style="display: none">
						<label class="col-md-3 control-lable" for="nombr">Precio
							ANTERIOR</label>
						<div class="col-md-7">
							<form:input type="text" path="precioAnterior" id="precioAnterior"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="precioAnterior" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-actions floatRight">
						<c:choose>
							<c:when test="${edit}">
								<input type="submit" value="Actualizar" class="btn btn-primary btn-sm" /> ó <a href="<c:url value='/detalletransferencia-list' />">Cancelar</a>
							</c:when>
							<c:otherwise>
								<input type="submit" value="Agregar" class="btn btn-primary btn-sm" /> ó <a href="<c:url value='/detalletransferencia-list' />">Cancelar</a>
                            	ó <a href="<c:url value='/finalizar1' />">Finalizar</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				<table class="table table-striped ">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Titulo</th>
							<th>Cantidad</th>
							<th>Costo</th>
							<th>Precio</th>
							<th>SubTotal</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${transferencia2}" var="transferencias">
							<tr>
								<c:set var="salary" scope="session" value="${2000*2}" />
								<c:if test="${salary > 2000}">
									<td>${transferencias.codProducto}</td>
									<td>${transferencias.nomProducto}</td>
									<td>${transferencias.cantidadProducto}</td>
									<td>${transferencias.costoProducto}</td>
									<td>${transferencias.precioProducto}</td>
									<td>${transferencias.subTotal}</td>
								</c:if>

								<sec:authorize access="hasRole('ADMINISTRADOR')">
									<td><a
										href="<c:url value='/delete-detalleTransferencia-${transferencias.codDetalleTransferencia}' />"
										class="btn btn-danger custom-width">Eliminar</a></td>
								</sec:authorize>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					
			</form:form>
		</div>
	</div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>