<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.io.*" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
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
<%
	// Quiero la fecha actual para ponerla por defecto 
	String fecha="";
    String sAhora = "";
			
		if(session.getAttribute("fechafactura")!=null){
			fecha=session.getAttribute("fechafactura").toString();
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
	function producto(){
	
		var nombre = [];
		var bodega = [];
		var sala = [];
		var precio = [];  
		
		
		var Id = document.getElementById("codigoproducto").value;
	
		<c:forEach items="${producto}" var="current" >
		
		  if( ${current.correlativo} == Id ) {
		    	 		  
		      nombre.push("${current.nombreProducto}");
		      document.getElementById('nombreproducto').value = nombre;
		      
		      bodega.push("${current.existencia}");
		      document.getElementById('bodega').value = bodega;
		      
		      sala.push("${current.sala}");
		      document.getElementById('sala').value = sala;
		      
		      precio.push("${current.precio}");
		      document.getElementById('precio').value = precio;
		    }
		</c:forEach>              		
      return true;
     }
</script>	

<script>
	function nombreprod(){
		
		var codigo = [];		
		var sala1 = [];
		var precio1 = [];  
		
		
		var Id1 = document.getElementById("nombreproducto").value;
	
		<c:forEach items="${producto}" var="current" >
		
		  if( ${current.nombreProducto} == Id1 ) {
		    	 		  
		      codigo.push("${current.codigoProducto}");
		      document.getElementById('codigoproducto').value = codigo;
		      
   		      sala1.push("${current.sala}");
		      document.getElementById('sala').value = sala1;
		      
		      precio1.push("${current.precio}");
		      document.getElementById('precio').value = precio1;
		    }
		</c:forEach>              		
      return true;
     }
	
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
$( function() {
	var sessionId1 = [];
	
	<c:forEach items="${producto}" var="current">								
	sessionId1.push("${current.nombreProducto}");						
	</c:forEach>					    
	
	$( "#nombreproducto" ).autocomplete({
	// source: availableTags
	source: sessionId1
	});
} );
</script>
<script>
 function sesion(){
	 	var cliente = document.getElementById('cliente').value;
	 	var direccion = document.getElementById('direccion').value;
	 	var documento = document.getElementById('documento').value;
      	var tipocredito = document.getElementById('tipocredito').value;      	
      	
      	var cliente1="clien"
      	var direccion1="direc"
      	var documento1="doc"
      	var tipocredito1="tipoc"
      	
      	sessionStorage[cliente1]=cliente;
      	sessionStorage[direccion1]=direccion;
      	sessionStorage[documento1]=documento;
      	sessionStorage[tipocredito1]=tipocredito;
    }
	
</script>

<script>
	$( function() {		
		var p;
		var p1;
		var p2;
		var p3;
		
		for(var i=0;i<sessionStorage.length;i++)
		{	
			p1=sessionStorage.getItem("doc");
			p=sessionStorage.getItem('tipoc');
			p2=sessionStorage.getItem('clien');
			p3=sessionStorage.getItem('direc');
		}
		document.getElementById("documento").value=p1;
		document.getElementById("tipocredito").value=p;
		document.getElementById("cliente").value=p2;
		document.getElementById("direccion").value=p3;			    
	} );
</script>

<script>
function cambiar(){
	var codigo = document.getElementById("codigoproducto").value;	
		if(codigo != null)
        {
        	$("#cantidad").focus();
        	}
}
function validar() {	
	var sala = parseInt(document.getElementById("sala").value);
	var bodega = parseInt(document.getElementById("bodega").value);
	var existencia = sala + bodega
	var cantidad = parseInt(document.getElementById("cantidad").value);	
	var precio=document.getElementById('precio').value;
	
		if(sala < cantidad){
			alert('No hay suficiente producto en SALA. Se tomara de BODEGA');
			
			if(existencia < cantidad){
				alert('No hay suficiente producto para realizar la venta.');
			}
			else {
				var subtotal = document.getElementById('subtotalfactura').value=parseFloat(precio)*(parseInt(cantidad));
				$("#agregar").focus();
			}
		}
		else {
			var subtotal = document.getElementById('subtotalfactura').value=parseFloat(precio)*(parseInt(cantidad));
			$("#agregar").focus();
		}
}
function vuelto(){
	var recibe = document.getElementById("recibe").value;
	var total2 = document.getElementById("total2").value;
	
	var devolver = parseFloat(document.getElementById('devolver').value=parseFloat(recibe) - parseFloat(total2));
	
}
</script>

</head>

<body >
<div class="row"><%@include file="page_head_2.jsp"%></div>
<div class="container">
<div class="well lead" align="center">FACTURACIÓN</div>
	<form:form method="POST" name="factura" modelAttribute="facturadetalle" class="form-horizontal">
		<form:input type="hidden" path="idfacturadetalle" id="idfacturadetalle" /> 
		
		<div class="col-xs-2" style="display:none">	
			<label class="form-control" for="codigo">ID #:</label>						
			<form:input type="text" path="idfactura" id="idfactura" class="form-control input-sm"  value='<%=session.getAttribute("codigofact")%>'/>
		</div>
		
		<div class="col-xs-2" style="display:none">	
			<label class="form-control" for="codigo">Estado:</label>						
			<input type="text" id="estado" class="form-control input-sm" value="1" />
		</div>
		
	<table>	
	<tr>	
		<td><label class="col-md-1 control-lable" for="fecha">Fecha:</label></td>			
		<td><input type="date" id="fechafactura" name="fechafactura" class="form-control input-sm" value="<%=sAhora %>" /></td>	
		
		<td><label class="col-md-6 control-lable" for="factura" >Factura:</label></td>
		<td><input type="text" maxlength="10" id="numerofactura" name="numerofactura" class="form-control input-sm" value="${numero}" /></td>		
				
	</tr>	
	</table>										    			
		<div class="panel-group">
			<div class="panel panel-success">			
			<div class="panel-heading">Información del Cliente. En CRÉDITO, llenar todos los campos.</div>			
			<div class="panel-body">
			<div class="form-group row">			
				<div class="col-xs-3">
					<label class="form-control" for="cliente">Cliente:</label>
					<input type="text" id="cliente"  maxlength="50" name="cliente"  class="form-control input-sm" onchange="sesion();"/>
				</div>
				<div class="col-xs-3">
					<label class="form-control" for="direccion">Dirección:</label>	
					<input type="text" id="direccion" maxlength="80" name="direccion"  class="form-control input-sm" onchange="sesion();"/>
				</div>
				<div class="col-xs-3">
					<label class="form-control" for="documento">Documento:</label>
					<input type="text" id="documento"  maxlength="15" name="documento"  class="form-control input-sm" onchange="sesion();"/>
				</div>
				<div class="col-xs-3">
					<label class="form-control" for="tipocredito">Tipo de Crédito:</label>
					<SELECT id="tipocredito" name="tipocredito" class="form-control input-sm" onchange="sesion();">
						<OPTION VALUE=" ">NO CREDITO (Contado)</OPTION>
						<OPTION VALUE="EMPLEADOS UES" >Empleado UES</OPTION>
						<OPTION VALUE="INSTITUCIONAL" >Institucional</OPTION>
					</SELECT>
				</div>
			</div>
			</div>
			</div>					
			<div class="panel panel-success">
			<div class="panel-heading">Productos. (Solo es necesario digitar el código y la cantidad)</div>
				<div class="panel-body">	
					<div class="form-group row">
						<div class="col-xs-2">
							<label class="form-control" for="codigo">Código:</label>
							<form:input type="number" path="codigoproducto" id="codigoproducto" placeholder="DIGITAR(####)" class="form-control input-sm" 
										onchange='producto(); cambiar(); '/>
						</div>	
						<div class="col-xs-6" align="center">
							<label class="form-control" for="nombr">Titulo:</label>
							<form:input type="text" path="nombreproducto" id="nombreproducto" placeholder="AUTOMÁTICO" class="form-control input-sm" onchange="nombreprod()"/>
						</div>
						<div class="col-xs-2">
							<label class="form-control" for="sala">Bodega:</label>
							<input type="number" min="0" id="bodega" placeholder="AUTOMÁTICO" class="form-control input-sm"  />
						</div>
						<div class="col-xs-2">
							<label class="form-control" for="sala">Sala:</label>
							<form:input type="number" min="0" path="sala" id="sala" placeholder="AUTOMÁTICO" class="form-control input-sm"  />
						</div>
					
					</div>
					<div class="form-group row" >					
						<div class="col-xs-2" >	
							<label class="form-control" for="precio">Precio $:</label>
							<form:input type="text" path="precio" id="precio" placeholder="AUTOMÁTICO" class="form-control input-sm" />
						</div>							
						<div class="col-xs-2">
							<label class="form-control" for="cantidad">Cantidad:</label>
							<form:input type="number" min="1" path="cantidad" id="cantidad" placeholder="DIGITAR" class="form-control input-sm" onchange="validar();" />
						</div>
						<div class="col-xs-2">	
							<label class="form-control" for="subtotal">Subtotal $:</label>
							<form:input type="text" path="subtotalfactura" id="subtotalfactura" placeholder="AUTOMÁTICO" class="form-control input-sm" />
						</div>
						
						<div class="col-xs-2">
							<input type="button" value="Agregar a Factura" id="agregar" class="btn btn-primary btn-sm" onclick="factura.submit()" onkeypress="factura.submit()"/>
						</div>
						<div class="col-xs-2">
							<a href="<c:url value='/index' />" class="btn btn-primary btn-sm" >Regresar</a>
						</div>
						
					</div>
				</div>							
			</div>
			<div id="validar" style="display:none" class="alert alert-danger">
				<strong>Advertencia!</strong> <label  for="tags"></label>
			</div>			
		</div>			
			<p class="thick" align="center">DETALLE DE LOS PRODUCTOS</p>	
			<table class="table table-striped">
				<thead>
		    		<tr class="success">			
			      			<th>Código</th>
			      			<th>Título</th>	      			
			      			<th>Cantidad</th>
			      			<th>Precio $</th>
			      			<th>Subtotal $</th>
			      			<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('VENDEDOR')">
			      			<th>Eliminar</th>
			      			</sec:authorize>	
		    		</tr>
		    	</thead>
		    	<tbody>
		    	      
				    	<c:forEach items="${facturas}" var="facturas" >
				    		<tr class="info">
				    			<td>${facturas.codigoproducto}</td>
				    			<td>${facturas.nombreproducto}</td>
				    			<td>${facturas.cantidad}</td>				    		    
				    			<td>$ ${facturas.precio}</td>
				    			<td>$ ${facturas.subtotalfactura}</td>	    			
				    			
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('VENDEDOR')">
                            <td><a href="<c:url value='/delete-detallefactura-${facturas.idfacturadetalle}' />" class="btn btn-danger custom-width">Eliminar</a></td>
                        </sec:authorize>
                        </tr>
				    	 </c:forEach>
		    	</tbody>
	    </table>
	    
	    <div class="row" align="right">
        	<div class="form-group col-md-12">
            	<label class="col-md-10 control-lable" for="total">TOTAL:</label>
           		<div class="col-md-2">
               	<input type="text" id="total" class="form-control input-sm" title="Se llena automaticamente" value="$ ${total}" disabled="disabled" />                           
            	</div>
        	</div>
       	</div>	
	    
	<table>	
	<tr>
		<td><label for="total">Total $:</label></td>					
		<td><input type="text" id="total2"  class="form-control input-sm" value="${total}" disabled="disabled" /></td>		
		
		<td><label for="fecha">Recibe $:</label></td>			
		<td><input type="text" id="recibe"  class="form-control input-sm"  onkeypress="vuelto();"/></td>	
		
		<td><label for="factura">Devolver $:</label></td>
		<td><input type="text" id="devolver"  class="form-control input-sm" disabled="disabled"/></td>
		
	</tr>	
	</table>
	<br><br>
	
	<div class="row" align="center">
		<c:if test = "${control == 3}">	
		<a href="<c:url value='/facturar-contado' />"  class="btn btn-primary btn-sm" >Facturar Contado</a>
		</c:if>
		<c:if test = "${control == 2}">				
		<a href="<c:url value='/facturar-credito' />"  class="btn btn-primary btn-sm" >Facturar Crédito</a>
		</c:if>
	</div>		
  		
	</form:form>

</div>


 <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>