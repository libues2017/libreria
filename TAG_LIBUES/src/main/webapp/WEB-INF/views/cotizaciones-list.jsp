<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Lista de Cotizaciones</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/jquery.dataTables.min.css' />" rel="stylesheet"></link> 
    <link href="<c:url value='/static/js/jquery-3.1.1.min.js' />" rel="stylesheet"></link>
   	<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>
    <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
    
    <script type="text/javascript">
    	var dataSet = [];
		var sessionId = [];
		var sessionId1 = [];
		var sessionId2 = [];
		var sessionId3 = [];
		var i=0;
		
		<c:set var="contador" value="${0}" />
		<c:forEach items="${cotizaciones}"   var="current">
			<c:set var = "salary" scope = "session" value = "${2000*2}"/>
	            <c:if test = "${current.total > 0}">
		            <c:set var="contador" value="${contador + 1}" />
		             
				dataSet[i] = [ "${contador}", "${current.codigoCotizacion}", "${current.nombreCliente}", "${current.telefono}", "${current.correo}",
					'<fmt:formatDate pattern = "dd-MM-yyyy" value = "${current.fechaCotizacion}" />', "$ ${current.total}"] ;
				i=i+1;
				</c:if>
		</c:forEach>
		
		$(document).ready(function() {
			var tabla =  $('#cotiza').DataTable( {
				data:  dataSet,
			    columns: [
			    	{ title: "Ítem" },
			    	{ title: "Cotización. #" },
			        { title: "Nombre del Cliente" },
			    	{ title: "Teléfono" },
			    	{ title: "Correo" },
			    	{ title: "Fecha" },
			    	{ title: "Total" }
			    ],
			    "language": idioma_espanol
			} );
			
			$('#cotiza tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
			   		$(this).removeClass('selected');
			    	dato = "";			    	           
			   	}
			   	else {
			   		tabla.$('tr.selected').removeClass('selected');
			    	$(this).addClass('selected');
			    	dato = $(this).find("td:eq(0)").text();		
			    	var h1 = document.createElement("hola");
			    	var h2 = document.createElement("hola");			    	            
			    	var res = "/TAG_LIBUES/edit-cotizacion-";
			    	var res3 = "/TAG_LIBUES//delete-cotizacion-";
			    	         
			    	var res1=dato;
			    	var res2=res.concat(res1);//link editar			    	         
			    	var res4=res3.concat(res1);//link eliminar			    	       
			    	var str = "Editar";
			    	var str1 = "Aceptar";
			    	var result = str.link(res2);
			    	var result1 = str1.link(res4);
			    	     
			    	document.getElementById("devolver").innerHTML = result;//editar
			    	document.getElementById("devolver1").innerHTML = result1;//eliminar
			    }	  
			} );
			        
		} );
		
		var idioma_espanol = {
			    "sProcessing":     "Procesando...",
			    "sLengthMenu":     "Mostrar _MENU_ registros",
			    "sZeroRecords":    "No se encontraron resultados",
			    "sEmptyTable":     "Ningún dato disponible en esta tabla",
			    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
			    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
			    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
			    "sInfoPostFix":    "",
			    "sSearch":         "Buscar:",
			    "sUrl":            "",
			    "sInfoThousands":  ",",
			    "sLoadingRecords": "Cargando...",
			    "oPaginate": {
			        "sFirst":    "Primero",
			        "sLast":     "Último",
			        "sNext":     "Siguiente",
			        "sPrevious": "Anterior"
			    },
			    "oAria": {
			        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
			        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
			    }
			}
    </script>
</head>

<body>
	<div class="modal" id="confirmModal" style="display: none; z-index: 1050;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" id="confirmMessage">
				</div>
				<div class="modal-footer">
					<button  id="devolver1" type="button" class="btn btn-default" id="confirmOk">Ok</button>
		        	<button type="button" class="btn btn-default" id="confirmCancel">Cancel</button>
		        </div>
			</div>
		</div>
	</div>
	
	<div class="row"><%@include file="page_head_2.jsp" %></div>
	<div class="container">
		<div class="row">
			<div class="panel-group">
				<div class="panel panel-default" align="center">
				<div class="panel-heading" ><h4>COTIZACIONES</h4></div>
				<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO') or hasRole('DBA')" >
					<div class="panel-body">
				    	<a href="<c:url value='/detallecotizacion-agregar' />" class="btn btn-primary">Realizar Cotización</a> ||||||||
				        <a href="<c:url value='/index' />" class="btn btn-primary" > Menu principal</a>
				        <br></br>
				        <p>OPCIONES</p>
				        <!--  <button  id="devolver" type="button" class="btn btn-success" id="confirmOk">Editar</button> -->
				        <sec:authorize access="hasRole('ADMINISTRADOR')">
				        <button type="button" class="btn btn-warning" id="btnDelete"> Eliminar</button>
				        </sec:authorize>
				 	</div>
			     </sec:authorize>
				</div>
			</div>
		</div>
		
		<div class="row col-md-13">
		    	<div class="panel panel-default">        
		        	<div class="panel-heading"><span class="lead">Cotizaciones</span></div>			
					<table id="cotiza" class="display" >					
					</table><br/>
				</div>
			</div>
	</div>
	
	<!-- 
	<div class="container">
		<div class="panel-group">
    		<div class="panel panel-default" align="center">
      			<div class="panel-heading" ><h4>COTIZACIONES</h4></div>
      			<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO') or hasRole('USUARIO')">
      				<div class="panel-body">
	      				<a href="<c:url value='/detallecotizacion-agregar' />" class="btn btn-primary">Realizar Cotización</a> ||||||||
	                	<a href="<c:url value='/index' />" class="btn btn-primary" > Menu principal</a>
      				</div>
      			</sec:authorize>
    		</div>
        </div>
	
	
	<div class="panel panel-default">
    	
        <div class="panel-heading"><span class="lead">Lista de Cotizaciones</span></div>
        <table class="table table-hover">
        	<thead>
            	<tr>
                	<th>Ítem</th>                        
                    <th>Cotización. #</th>                        
                    <th>Nombre del Cliente</th>
                    <th>Teléfono</th>
                    <th>Correo</th>
                    <th>Fecha</th>
                    <th>Total</th>
                    <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO') or hasRole('USUARIO')">
                    	<th width="100">ELIMINAR</th>
                    </sec:authorize>     
                </tr>
            </thead>
                
            <tbody>
            	<c:set var="contador" value="${0}" /> 
               	<c:forEach items="${cotizaciones}" var="cotizacion">
                <tr>
                	<c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	    <c:if test = "${salary > 2000}">
	    	        	<c:set var="contador" value="${contador + 1}" />    	                 
	    	            	<td>${contador}</td>
                    		<td><a  href="<c:url value='/cotizacion-detalle-${cotizacion.codigoCotizacion}' />">${cotizacion.codigoCotizacion}</a></td>
                    		<td>${cotizacion.nombreCliente}</td>	
                        	<td>${cotizacion.telefono}</td>
                        	<td>${cotizacion.correo}</td>
                        	<td>${cotizacion.fechaCotizacion}</td>
                        	<td>$${cotizacion.total}</td>
                    </c:if>	
                    <sec:authorize access="hasRole('ADMINISTRADOR')  or hasRole('BODEGUERO')">                     
                    	<td><a href="<c:url value='/delete-cotizacion-${cotizacion.codigoCotizacion}'/>"  class="btn btn-danger custom-width">Eliminar</a></td>
                    </sec:authorize>
                </tr>
               	</c:forEach>
            </tbody>
       	</table>
	</div>
	</div>
	-->
	
	<div class="row"><%@include file="foot.jsp" %></div>
	<script src="<c:url value='/static/js/jquery.dataTables.min.js' />"></script>
 	<!--<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>-->
</body>
</html>