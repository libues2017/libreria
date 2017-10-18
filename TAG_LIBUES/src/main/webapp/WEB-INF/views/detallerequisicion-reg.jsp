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
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

<body Style="background-color:#97965B">

	<div class="row"><%@include file="page_head_2.jsp"%></div>
	<div class="container">
		<div class="well lead" align="center">Realizar Requisición</div>
		<form:form method="POST" modelAttribute="detallerequisicion" class="form-horizontal">
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
						<SELECT name="destino" id="destino" class="form-control input-sm" onchange="sesion();">
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
						<label class="form-control" for="tags">Codigo:</label>
						<form:input type="number" path="codigoproducto" id="codigoproducto" name="codigo-producto" placeholder="DIGITAR (99999)" class="form-control input-sm" onchange='producto();'/>
						</div>
						<div class="col-xs-6">
						<label class="form-control" for="nombr">Titulo:</label>
						<form:input type="text" path="nombreproducto" id="nombreproducto" placeholder="AUTOMATICO" class="form-control input-sm" />
						</div>
						<div class="col-xs-2">
						<label class="form-control" for="nombr">Bodega:</label>
						<form:input type="text" path="bodega" id="bodega" placeholder="AUTOMATICO" class="form-control input-sm" />							
						</div>
						<div class="col-xs-2">
						<label class="form-control" for="nombr">Sala:</label>
						<form:input type="text" path="sala" id="sala" placeholder="AUTOMATICO" class="form-control input-sm"/>							
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="panel-body">
						<div class="col-xs-3">
						<label class="form-control" for="costo">Costo #:</label>
						<form:input type="text" path="costo" id="costo" placeholder="AUTOMATICO" class="form-control input-sm" />							
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="precio">Precio $:</label>
						<form:input type="text" path="precio" id="precio" placeholder="AUTOMATICO" class="form-control input-sm" />							
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Cantidad:</label>
						<form:input type="number" path="cantidad" id="cantidad" placeholder="DIGITAR (999)" class="form-control input-sm" onchange="add('cantidad')" />
						</div>
						<div class="col-xs-3">
						<label class="form-control" for="nombr">Subtotal $:</label>
						<form:input type="text" path="subtotal" id="subtotal" placeholder="AUTOMATICO" class="form-control input-sm" />							
			 			</div>
			 		</div>
			 	</div>
			 	<div class="form-group row" align="center">
				 	<input type="submit" value="AGREGAR" class="btn btn-primary btn-sm" /> |||||||||| 								
					<a href="<c:url value='/requisicion-list' />"  class="btn btn-primary btn-sm" >CANCELAR</a>					
				</div>
			</div>
		</div>
 		<table class="table table-striped ">
				<thead>
		    		<tr class="success">
		    				<th>ITEM</th>		    			
			      			<th>Codigo</th>
			      			<th>Titulo</th>	      			
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
		<div class="well lead" align="center">
			<a href="<c:url value='/guardar' />" class="btn btn-primary btn-sm" >GUARDAR REQUISICION</a>
		</div>
	</form:form>
</div>

	

<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<!--  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script> -->
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>