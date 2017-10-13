<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<Style>
.control-label {
	text-align: left;
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
function add(campo) {
	var cantidad=document.getElementById('cantidad').value;
	var precio=document.getElementById('precio').value;
	var subtotal = document.getElementById('subtotal').value=parseFloat(precio)*(parseInt(cantidad));
}
</script>

</head>




<body>

	<div class="row"><%@include file="page_head.jsp"%></div>
	<div class="container">

		<div class="row"><%@include file="menu.jsp"%></div>
		<div class="col-xs-12">
			<div class="well lead">Agregar Requisición</div>
			<form:form method="POST" modelAttribute="detallerequisicion"
				class="form-horizontal">
				<form:input type="hidden" path="codigodetalle" id="codigodetalle" />

			<table class="col-sm-12 col-md-12">
				<tr>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-5 control-lable" for="nombr">Doc. #:</label>
						<div class="col-md-6">
							<form:input type="text" path="codigorequisicion" id="codigorequisicion" class="form-control input-sm" value='<%=session.getAttribute("codigo2")%>' />
							<div class="has-error">
								<form:errors path="codigorequisicion" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				</td>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-4 control-lable" for="nombr">Destino:</label>
						<div class="col-md-7">
						<!--  <input type="text" name="destino" id="destino" class="form-control input-sm" onchange="sesion();" /> -->	
							<SELECT name="destino" id="destino" placeholder="SELECCIONAR" class="form-control input-sm" onchange="sesion();">
										<OPTION VALUE="SALA">Sala</OPTION>
										<OPTION VALUE="BODEGA">Bodega</OPTION>
							</SELECT>
						</div>
					</div>
				</div>
				</td>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-4 control-lable" for="nombr">Fecha:</label>
						<div class="col-md-8">
							<input type="date" id="fecharequisicion" name="fecharequisicion" class="form-control input-sm" onchange="sesion();" />
						</div>
					</div>
				</div>
				</td>
				</tr>
				
				<tr>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-5 control-lable" for="tags">Codigo	Producto:</label>
						<div class="col-md-6">
							<form:input type="text" path="codigoproducto" id="codigoproducto" placeholder="DIGITAR" class="form-control input-sm" onchange='producto();' />
							<div class="has-error">
								<form:errors path="codigoproducto" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				</td>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-4 control-lable" for="nombr">Nombre Producto:</label>
						<div class="col-md-7">
							<form:input type="text" path="nombreproducto" id="nombreproducto" placeholder="AUTOMATICO" class="form-control input-sm" />
						</div>
					</div>
				</div>
				</td>
				<tr>
			<!--  	
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" >Existencia Total:</label>
						<div class="col-md-7">  
						<table class="table table-striped ">
						<td><label class="col-md-3 control-lable" for="existencia" id="existencia"></label></td>					                   
					    </table>   
						</div>
					</div>
				</div>
			-->	
				<tr>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-5 control-lable" for="nombr">Bodega:</label>
						<div class="col-md-6">
							<form:input type="text" path="bodega" id="bodega" placeholder="AUTOMATICO" class="form-control input-sm" />							
						</div>
					</div>
				</div>
				</td>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-4 control-lable" for="nombr">Sala:</label>
						<div class="col-md-7">
							<form:input type="text" path="sala" id="sala" placeholder="AUTOMATICO" class="form-control input-sm"/>							
						</div>
					</div>
				</div>
				</td>
				</tr>
				
				<tr>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-5 control-lable" for="nombr">Costo #:</label>
						<div class="col-md-6">
							<form:input type="text" path="costo" id="costo" placeholder="AUTOMATICO" class="form-control input-sm" />							
						</div>
					</div>
				</div>
				</td>
				
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-4 control-lable" for="nombr">Precio $:</label>
						<div class="col-md-7">
							<form:input type="text" path="precio" id="precio" placeholder="AUTOMATICO" class="form-control input-sm" />							
						</div>
					</div>
				</div>
				</td>
				</tr>
				
				<tr>
				<td>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-5 control-lable" for="nombr">Cant Mover:</label>
						<div class="col-md-6">
							<form:input type="number" path="cantidad" id="cantidad" placeholder="DIGITAR" class="form-control input-sm" onchange="add('cantidad')" />
							<div class="has-error">
								<form:errors path="cantidad" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				</td>
				<td>				
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-4 control-lable" for="nombr">Subtotal:</label>
						<div class="col-md-7">
							<form:input type="text" path="subtotal" id="subtotal" placeholder="AUTOMATICO" class="form-control input-sm" />							
						</div>
					</div>
				</div>
				</td>
				</tr>
		</table> 	
				<div class="row">					
					<input type="submit" value="Registrar" class="btn btn-primary btn-sm" /> |||||								
					<a href="<c:url value='/requisicion-list' />"  class="btn btn-primary btn-sm" >Cancelar</a> |||||
					<a href="<c:url value='/guardar' />" class="btn btn-primary btn-sm" >Guardar Requisición</a>
				</div> <hr>

 		<table class="table table-striped ">
				<thead>
		    		<tr >		    			
			      			<th>Codigo Producto</th>
			      			<th>Nombre Producto</th>	      			
			      			<th>Cantidad</th>
			      			<th>Costo</th>
			      			<th>Precio</th>
			      			<th>Subtotal</th>	
		    		</tr>
		    	</thead>
		    	<tbody>
		    	      
				    	<c:forEach items="${req1}" var="requisiciones" >
				    		<tr >
				    			<td>${requisiciones.codigoproducto}</td>
				    			<td>${requisiciones.nombreproducto}</td>
				    			<td>${requisiciones.cantidad}</td>
				    		    <td>$ ${requisiciones.costo}</td>
				    			<td>$ ${requisiciones.precio}</td>
				    			<td>$ ${requisiciones.subtotal}</td>	    			
				    			
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <td><a href="<c:url value='/delete-detallerequisicion-${requisiciones.codigodetalle}' />" class="btn btn-danger custom-width">Eliminar</a></td>
                        </sec:authorize>
                        </tr>
				    	 </c:forEach>
		    	</tbody>
	    </table>          


			</form:form>
		</div>

	</div>

<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<!--  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script> -->
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>