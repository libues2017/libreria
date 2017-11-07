<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librer�a UES</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>


<Style>
.control-label {
	text-align: left;
}

invalid {
border: 2px solid #ff0000;
}
</Style>

<script type="text/javascript">

	function producto(){
	
		var nombre = [];
		var bodega = [];
		var sala = [];
		var precio = [];
		var costo = [];
		
		var Id = document.getElementById("codigoproducto").value;
	
		<c:forEach items="${producto}" var="current" >
		
		  if( ${current.correlativo} == Id) {
		    	 		  
		      nombre.push("${current.nombreProducto}");
		      document.getElementById('nombreproducto').value = nombre;
		      
		      bodega.push("${current.existencia}");
   		      document.getElementById('bodega').value = bodega;
   		      
   		      sala.push("${current.sala}");
		      document.getElementById('sala').value = sala;
   		      
		      costo.push("${current.costounitario}");
		      document.getElementById('costo').value = costo;
		      
		      precio.push("${current.precio}");
		      document.getElementById('precio').value = precio;
		    }
		</c:forEach>              		
      return true;					
		alert();
     }
    
	
    function sesion(){
		var fecharequisicion=document.getElementById("fecharequisicion").value;
      	var destino = document.getElementById('destino').value;
      	
      	var fecha="f";
      	var destino1="dest";
      				
      	sessionStorage[fecha]=fecharequisicion;
      	sessionStorage[destino1]=destino;      	
    }
	
</script>

<script>
	$( function() {
		var p;
		var p1;
		
		for(var i=0;i<sessionStorage.length;i++)
		{						                
			p=sessionStorage.getItem('f');
			p1=sessionStorage.getItem('dest');
		}
		document.getElementById("fecharequisicion").value=p;
		document.getElementById("destino").value=p1;			    
	} );
</script>

<script>
$( function() {
	var sessionId1 = [];
	
	<c:forEach items="${producto}" var="current">								
	sessionId1.push("${current.correlativo}");						
	</c:forEach>					    
	
	$( "#codigoproducto" ).autocomplete({
	// source: availableTags
	source: sessionId1
	});
} );
</script>

<script>
function validar2() {
	var destino1 = document.getElementById("destino").value;
	var sala1 = parseInt(document.getElementById("sala").value);
	var bodega1 = parseInt(document.getElementById("bodega").value);
	var cantidad1 = parseInt(document.getElementById("cantidad").value);	
	var precio=document.getElementById('precio').value;
	
	
	if(destino1 == 'SALA')
    {
		if(bodega1 < cantidad1){
			alert('No hay suficiente producto en BODEGA');
		}
		else {
			var subtotal = document.getElementById('subtotal').value=parseFloat(precio)*(parseInt(cantidad1));
			$("#agrega").focus();
		}
    }
	else
		if(sala1 < cantidad1){
			alert('No hay suficiente producto en SALA');
		}
		else {
			var subtotal = document.getElementById('subtotal').value=parseFloat(precio)*(parseInt(cantidad1));
			$("#agrega").focus();
		}
}
</script>

<script>
	// Focus = Changes the background color of input to yellow
	function focusF() {
	    document.getElementById("destino").style.background = "#E3ECEF";	    
	}
	function focusF1() {
		document.getElementById("codigoproducto").style.background = "#E3ECEF";
	}
	function focusF2() {
		document.getElementById("cantidad").style.background = "#E3ECEF";
	}
	
	// No focus = Changes the background color of input to red
	function blurF() {
	    document.getElementById("destino").style.background = "#DBE1E3";
	}
	function blurF1() {
		document.getElementById("codigoproducto").style.background = "#DBE1E3";
	}
	function blurF2() {
		document.getElementById("cantidad").style.background = "#DBE1E3";
	}
</script>

<script>
function cambiar(){
	var Elt = document.getElementById("codigoproducto").value;
	var Elt2 = document.getElementById("cantidad");
	
		if(Elt != null)
        {
        	$("#cantidad").focus();
        	}
}
</script>
</head>

<body>

	<div class="row"><%@include file="page_head_2.jsp"%></div>
	<div class="container">
		<div class="well lead" align="center">REALIZAR REQUISICI�N</div>
		<form:form method="POST" name="req" modelAttribute="detallerequisicion" class="form-horizontal">
		<form:input type="hidden" path="codigodetalle" id="codigodetalle" />

		<div class="panel-group">			
			<div class="panel panel-default">
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Documento #:</label>
						<form:input type="text" path="codigorequisicion" id="codigorequisicion" class="form-control input-sm" value='<%=session.getAttribute("codigo2")%>' />
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Destino:</label>
						<SELECT name="destino" id="destino" class="form-control input-sm" onchange="sesion();" onfocus="focusF()" onblur="blurF()">
							<OPTION VALUE="SALA" >Sala</OPTION>
							<OPTION VALUE="BODEGA" >Bodega</OPTION>
						</SELECT>
						</div>
						<div class="col-xs-3">			
						<label class="form-control" for="nombr">Fecha:</label>
						<input type="date" id="fecharequisicion" name="fecharequisicion" class="form-control input-sm" onchange="sesion();" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="panel panel-success">
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-2">
						<label class="form-control" for="tags">C�digo:</label>
						<form:input type="number" path="codigoproducto" id="codigoproducto"  placeholder="DIGITAR (9999)" class="form-control input-sm" onfocus="focusF1()"
									onchange='producto(); cambiar();' onkeypress='producto();' title="Digitar codigo del producto, solo n�meros"  onblur="blurF1()" />
						</div>
						<div class="col-xs-6">
						<label class="form-control" for="nombr">T�tulo:</label>
						<form:input type="text" path="nombreproducto" id="nombreproducto" placeholder="AUTOMATICO" class="form-control input-sm" title="Se llena automaticamente" />
						</div>
						<div class="col-xs-2">
						<label class="form-control" for="nombr">Bodega:</label>
						<form:input type="number" path="bodega" id="bodega" placeholder="AUTOMATICO" class="form-control input-sm" title="Se llena automaticamente" />							
						</div>
						<div class="col-xs-2">
						<label class="form-control" for="nombr">Sala:</label>
						<form:input type="number" path="sala" id="sala" placeholder="AUTOMATICO" class="form-control input-sm" title="Se llena automaticamente"/>							
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="panel-body">
						<div class="col-xs-3">
						<label class="form-control" for="costo">Costo #:</label>
						<form:input type="text" path="costo" id="costo" placeholder="AUTOMATICO" class="form-control input-sm" title="Se llena automaticamente" />							
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="precio">Precio $:</label>
						<form:input type="text" path="precio" id="precio" placeholder="AUTOMATICO" class="form-control input-sm" title="Se llena automaticamente"/>							
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Cantidad:</label>
						<form:input type="number" path="cantidad" id="cantidad" placeholder="DIGITAR (9999)" class="form-control input-sm" onchange="validar2();" 
									title="Digitar cantidad a mover, solo n�meros" onfocus="focusF2()" onblur="blurF2()" autocomplete="off" min="1" />
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Subtotal $:</label>
						<form:input type="text" path="subtotal" id="subtotal" placeholder="AUTOMATICO" class="form-control input-sm" 
									title="Se llena automaticamente" />							
			 			</div>
			 		</div>
			 	</div>
			 	<div class="form-group row" align="center">
				 	<input type="button" value="AGREGAR" id="agrega" class="btn btn-primary btn-sm" onclick="req.submit()" /> |||||||||| 								
					<a href="<c:url value='/requisicion-list' />"  class="btn btn-primary btn-sm" >CANCELAR</a>					
				</div>
			</div>
		</div>
 		<table class="table table-striped ">
				<thead>
		    		<tr class="success">
		    				<th>ITEM</th>		    			
			      			<th>C�digo</th>
			      			<th>T�tulo</th>	      			
			      			<th>Cantidad</th>
			      			<th>Costo</th>
			      			<th>Precio</th>
			      			<th>Subtotal</th>			      			
			      			<th>ELIMINAR</th>	
		    		</tr>
		    	</thead>
		    	<tbody>
		    			<c:set var="contador" value="${0}" /> 
		    			
				    	<c:forEach items="${req1}" var="requisiciones" >
				    		<tr class="info">				    		
		    	            <c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	            <c:if test = "${salary > 2000}">
		    	                <c:set var="contador" value="${contador + 1}" />    	                
		    	              
		    	                <td>${contador}</td>
				    			<td>${requisiciones.codigoproducto}</td>
				    			<td>${requisiciones.nombreproducto}</td>
				    			<td>${requisiciones.cantidad}</td>
				    		    <td>$ ${requisiciones.costo}</td>
				    			<td>$ ${requisiciones.precio}</td>
				    			<td>$ ${requisiciones.subtotal}</td>
				    							    							    			 			
				    		</c:if>	
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <td><a href="<c:url value='/delete-detallerequisicion-${requisiciones.codigodetalle}' />" class="btn btn-danger custom-width">Eliminar</a></td>
                        </sec:authorize>
                        </tr>
				    	 </c:forEach>
		    	</tbody>
	    </table>
				
			<div class="row" align="right">
                <div class="form-group col-md-12">
                    <label class="col-md-9 control-lable" for="total">TOTAL:</label>
                    <div class="col-md-2">
                    <input type="text" id="total" placeholder="AUTOMATICO" class="form-control input-sm" title="Se llena automaticamente" 
                    		value='$ ${total}'/>                           
                    </div>
                </div>
            </div>	
		        
		<div class="well lead" align="center">
			<a href="<c:url value='/guardar' />" class="btn btn-primary btn-sm" >GUARDAR REQUISICI�N</a>
		</div>
	</form:form>
</div>

	

<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>   
<!--  
pages:
http://formvalidation.io/examples/changing-success-error-colors/
http://www.um.es/docencia/barzana/DAWEB/Desarrollo-de-aplicaciones-web-teoria-formularios-ejemplo-1.html
-->
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>