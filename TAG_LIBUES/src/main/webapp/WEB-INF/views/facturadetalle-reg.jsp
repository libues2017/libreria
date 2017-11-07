<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script type="text/javascript">

	function producto(){
	
		var nombre = [];		
		var sala = [];
		var precio = [];  
		
		
		var Id = document.getElementById("codigoproducto").value;
	
		<c:forEach items="${producto}" var="current" >
		
		  if( ${current.correlativo} == Id ) {
		    	 		  
		      nombre.push("${current.nombreProducto}");
		      document.getElementById('nombreproducto').value = nombre;
		      
   		      sala.push("${current.sala}");
		      document.getElementById('sala').value = sala;
		      
		      precio.push("${current.precio}");
		      document.getElementById('precio').value = precio;
		    }
		</c:forEach>              		
      return true;					
		alert();
     }

	function sesion(){
		var fecha=document.getElementById("fechafactura").value;
      	var numero = document.getElementById('numerofactura').value;
      	
      	var fecha1="f";
      	var numero1="num";
      				
      	sessionStorage[fecha1]=fecha;
      	sessionStorage[numero1]=numero;
    }
	
</script>
<script>
	$( function() {
		var p;
		var p1;
		
		for(var i=0;i<sessionStorage.length;i++)
		{						                
			p=sessionStorage.getItem('f');
			p1=sessionStorage.getItem('num');
		}
		document.getElementById("fechafactura").value=p;
		document.getElementById("numerofactura").value=p1;			    
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
function cambiar(){
	var codigo = document.getElementById("codigoproducto").value;	
		if(codigo != null)
        {
        	$("#cantidad").focus();
        	}
}

</script>

<script>
function validar() {	
	var sala = parseInt(document.getElementById("sala").value);	
	var cantidad = parseInt(document.getElementById("cantidad").value);	
	var precio=document.getElementById('precio').value;
	
		if(sala < cantidad){
			alert('NO HAY SUFICIENTE PRODUCTO');
		}
		else {
			var subtotal = document.getElementById('subtotalfactura').value=parseFloat(precio)*(parseInt(cantidad));
			$("#agregar").focus();
		}
}
</script>

</head>

<body >
<div class="row"><%@include file="page_head_2.jsp"%></div>
<div class="container">
<div class="well lead" align="center">FACTURACION</div>
	<form:form method="POST" name="factura" modelAttribute="facturadetalle" class="form-horizontal">
		<form:input type="hidden" path="idfacturadetalle" id="idfacturadetalle" /> 
								    			
		<div class="panel-group">			
			<div class="panel panel-default">
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-2">	
						<label class="form-control" for="codigo">ID #:</label>						
						<form:input type="text" path="idfactura" id="idfactura" class="form-control input-sm"  value='<%=session.getAttribute("codigofact")%>'/>
						</div>
						<div class="col-xs-3">		
						<label class="form-control" for="fecha">Fecha:</label>
						<input type="date" id="fechafactura" name="fechafactura" class="form-control input-sm" onchange="sesion();" />
						</div>
						<div class="col-xs-2">	
						<label class="form-control" for="factura">Factura #:</label>						
						<input type="text" maxlength="10" id="numerofactura" name="numerofactura" class="form-control input-sm" onchange="sesion();" />
						</div>
					</div>
				</div>
			</div>			
					
			<div class="panel panel-success">	
				<div class="form-group row">
					<div class="panel-body">
						<div class="col-xs-2">
							<label class="form-control" for="codigo">Codigo:</label>
							<form:input type="number" path="codigoproducto" id="codigoproducto" placeholder="DIGITAR" class="form-control input-sm" 
										onchange='producto(); cambiar();' />
						</div>	
						<div class="col-xs-8" align="center">
							<label class="form-control" for="nombr">Titulo:</label>
							<form:input type="text" path="nombreproducto" id="nombreproducto" placeholder="AUTOMATICO" class="form-control input-sm" />
						</div>
						<div class="col-xs-2">
							<label class="form-control" for="sala">Existencia:</label>
							<form:input type="number" path="sala" id="sala" placeholder="AUTOMATICO" class="form-control input-sm"  />
						</div>
					</div>
				</div>
				<div class="form-group row" >
					<div class="panel-body" >
						<div class="col-xs-2" >	
							<label class="form-control" for="precio">Precio $:</label>
							<form:input type="text" path="precio" id="precio" placeholder="AUTOMATICO" class="form-control input-sm" />
						</div>							
						<div class="col-xs-2">
							<label class="form-control" for="cantidad">Cantidad:</label>
							<form:input type="number" min="1" path="cantidad" id="cantidad" placeholder="DIGITAR" class="form-control input-sm" onchange="validar();" />
						</div>
						<div class="col-xs-2">	
							<label class="form-control" for="subtotal">Subtotal:</label>
							<form:input type="text" path="subtotalfactura" id="subtotalfactura" placeholder="AUTOMATICO" class="form-control input-sm" />
						</div>
						
						<div class="col-xs-2">
							<input type="button" value="Agregar a Factura" id="agregar" class="btn btn-primary btn-sm" onclick="factura.submit()" onkeypress="factura.submit()"/>
						</div>
						<div class="col-xs-2">
							<a href="<c:url value='/index' />" class="btn btn-primary btn-sm" >Cancelar Facturación</a>
						</div>
						
					</div>
				</div>							
			</div>			
		</div>			
				
			<table class="table table-striped">
				<thead>
		    		<tr class="success">			
			      			<th>Codigo</th>
			      			<th>Titulo</th>	      			
			      			<th>Cantidad</th>
			      			<th>Precio</th>
			      			<th>Subtotal</th>
			      			<sec:authorize access="hasRole('ADMINISTRADOR')">
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
				    			
                        	<sec:authorize access="hasRole('ADMINISTRADOR')">
                            	<td><a href="<c:url value='/delete-detallefactura-${facturas.idfacturadetalle}' />" class="btn btn-danger custom-width">Eliminar</a></td>
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
                    		value="$ ${total}" />                           
                    </div>
                </div>
            </div>	
	    
	     
	    <div class="well lead" align="center">
		    <button type="button" class="btn btn-primary btn-sm" data-toggle="collapse" data-target="#contado">Contado</button> |||||||||
		    <button type="button" class="btn btn-primary btn-sm" data-toggle="collapse" data-target="#credito">Credito</button>
		</div>
		<div id="contado" class="collapse">
		
			<div class="panel-group">			
			<div class="panel panel-default">
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-6">		
						<label class="form-control" for="cliente">Cliente:</label>
						<input type="text" id="cliente" name="cliente" class="form-control input-sm" />
						</div>
						<div class="col-xs-6">	
						<label class="form-control" for="direccion">Direccion:</label>						
						<input type="text" id="direccion" name="direccion" class="form-control input-sm" />
						</div>
					</div>
				</div>
				<div align="center">
				<a href="<c:url value='/facturar-contado' />" class="btn btn-primary btn-sm" >Facturar</a>
				</div>
			</div>
			</div>
			
  		</div>
  		
  		<div id="credito" class="collapse">
  		
  			<div class="panel-group">			
			<div class="panel panel-default">
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-6">		
						<label class="form-control" for="cliente">Cliente:</label>
						<input type="text" id="cliente" name="cliente" class="form-control input-sm" />
						</div>
						<div class="col-xs-6">	
						<label class="form-control" for="direccion">Direccion:</label>						
						<input type="text" id="direccion" name="direccion" class="form-control input-sm" />
						</div>
					</div>
				</div>
				
				<div class="form-group row">		
					<div class="panel-body">
						<div class="col-xs-6">		
						<label class="form-control" for="documento">Documento:</label>
						<input type="text" id="documento" name="documento" class="form-control input-sm" />
						</div>
						<div class="col-xs-6">	
						<label class="form-control" for="tipocredito">Tipo de Credito:</label>						
						<input type="text" id="tipocredito" name="tipocredito" class="form-control input-sm" />
						</div>
					</div>
				</div>
				<div align="center">
				<a href="<c:url value='/facturar-credito' />" class="btn btn-primary btn-sm" >Facturar</a>
				</div>
			</div>
			</div>
  		
  		</div>
  		
	</form:form>

</div>


 <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>