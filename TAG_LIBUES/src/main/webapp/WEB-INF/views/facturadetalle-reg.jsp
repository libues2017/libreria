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
		      document.getElementById('sala').innerHTML = sala;
		      
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
function add(campo) {
	var cantidad=document.getElementById('cantidad').value;
	var precio=document.getElementById('precio').value;
	var subtotal = document.getElementById('subtotalfactura').value=parseFloat(precio)*(parseInt(cantidad));
}
</script>

</head>

<body Style="background-color:#97965B">
<div class="row"><%@include file="page_head.jsp"%></div>
	<div class="container">

		<div class="row"> </div>
		<div class="col-xs-12">
			<div class="well lead"><center>Facturación</center></div>
			<form:form method="POST" modelAttribute="facturadetalle"
				class="form-horizontal">
				<form:input type="hidden" path="idfacturadetalle" id="idfacturadetalle" />

				<td>
				<div class="row">
					<div class="form-group col-md-12"  style="display:none">
						<label class="col-md-5 control-lable" for="codigo">ID #:</label>
						<div class="col-md-6">
							<form:input type="text" path="idfactura" id="idfactura" class="form-control input-sm"  value='<%=session.getAttribute("codigofact")%>'/>							
						</div>
					</div>
				</div>
				</td>
			
			<table class="col-sm-12 col-md-12">
				<tr>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-2 control-lable" for="fecha">Fecha:</label>
						<div class="col-md-5">
							<input type="date" id="fechafactura" name="fechafactura" class="form-control input-sm" onchange="sesion();" />
						</div>
					</div>
				</div>
				</td>
				
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="factura">Factura #:</label>
						<div class="col-md-5">
							<input type="text" id="numerofactura" name="numerofactura" class="form-control input-sm" onchange="sesion();" />
						</div>
					</div>
				</div>
				</td>
				
				</tr>
			</table>	
				
				
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-1 control-lable" for="tags">Codigo:</label>
						<div class="col-md-2">
							<form:input type="text" path="codigoproducto" id="codigoproducto" placeholder="DIGITAR" class="form-control input-sm" onchange='producto();' />
							<div class="has-error">
								<form:errors path="codigoproducto" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-1 control-lable" for="nombr">Titulo:</label>
						<div class="col-md-8">
							<form:input type="text" path="nombreproducto" id="nombreproducto" placeholder="AUTOMATICO" class="form-control input-sm" />
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-1 control-lable" >Existencia:</label>
						<div class="col-md-2">  
						<table class="table table-striped ">
						<td><label class="col-md-3 control-lable" for="sala" id="sala"></label></td>					                   
					    </table>   
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-1 control-lable" for="precio">Precio$:</label>
						<div class="col-md-2">
							<form:input type="text" path="precio" id="precio" placeholder="AUTOMATICO" class="form-control input-sm" />							
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-1 control-lable" for="cantidad">Cantidad:</label>
						<div class="col-md-2">
							<form:input type="number" min="0" path="cantidad" id="cantidad" placeholder="DIGITAR" class="form-control input-sm" onchange="add('cantidad')" />
							<div class="has-error">
								<form:errors path="cantidad" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
								
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-1 control-lable" for="subtotal">Subtotal:</label>
						<div class="col-md-2">
							<form:input type="text" path="subtotalfactura" id="subtotalfactura" placeholder="AUTOMATICO" class="form-control input-sm" />							
						</div>
					</div>
				</div>
				<center>	
				<div class="row">					
					<input type="submit" value="Registrar" class="btn btn-primary btn-sm" /> |||||					
					<a href="<c:url value='/index' />" class="btn btn-primary btn-sm" >Cancelar</a>
				</div> <hr>
				</center>
			
			<table class="table table-striped ">
				<thead>
		    		<tr >	
		    						    			
			      			<th>Codigo</th>
			      			<th>Titulo</th>	      			
			      			<th>Cantidad</th>
			      			<th>Precio</th>
			      			<th>Subtotal</th>	
		    		</tr>
		    	</thead>
		    	<tbody>
		    	      
				    	<c:forEach items="${facturas}" var="facturas" >
				    		<tr >
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
	    <center>
		    <button type="button" class="btn btn-primary btn-sm" data-toggle="collapse" data-target="#contado">Contado</button> |||||
		    <button type="button" class="btn btn-primary btn-sm" data-toggle="collapse" data-target="#credito">Credito</button>
		</center>
		<div id="contado" class="collapse">
		
  		</div>
  		<div id="credito" class="collapse">
  		
  		</div>
  		
			</form:form>
		</div>
	</div>

 <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <!--  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script> -->
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>