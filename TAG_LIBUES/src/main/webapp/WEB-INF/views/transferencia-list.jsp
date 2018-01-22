<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lista de Transferencias</title>
    <link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet"></link>
    <!-- <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link> -->
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
		<c:forEach items="${transferencias}"   var="current">
		<c:set var = "salary" scope = "session" value = "${2000*2}"/>
            <c:if test = "${current.total > 0}">
	            <c:set var="contador" value="${contador + 1}" />
	             
			dataSet[i] = [ "${contador}", "${current.codTransferencia}", "${current.numeroTransferencia}", "${current.tipoTransferencia}", "${current.sucursal}", '<fmt:formatDate pattern = "dd-MM-yyyy" 
		         value = "${current.fechaTransferencia}" />', "$ ${current.total}"] ;
			i=i+1;
			</c:if>
		</c:forEach>
						    
		$(document).ready(function() {
			var tabla =  $('#transf').DataTable( {
				data:  dataSet,
			    columns: [
			    	{ title: "Ítem" },
			    	{ title: "Código" },
			    	{ title: "# Transferencia" },
			        { title: "Tipo" },
			    	{ title: "Sucursal" },
			    	{ title: "Fecha" },
			    	{ title: "Total" }
			    ],
			    "language": idioma_espanol
			} );
			
			
			
			$('#transf tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
			   		$(this).removeClass('selected');
			    	dato = "";			    	           
			   	}
			   	else {
			   		tabla.$('tr.selected').removeClass('selected');
			    	$(this).addClass('selected');
			    	dato = $(this).find("td:eq(1)").text();		
			    	var h1 = document.createElement("hola");
			    	var h2 = document.createElement("hola");
			    	var h3 = document.createElement("hola");
			    	var res = "/TAG_LIBUES/edit-detalleTransferencia-";
			    	var res3 = "/TAG_LIBUES/delete-transferencia-";
			    	var res5 = "/TAG_LIBUES/transferencia-detalle-";
			    	         
			    	var res1=dato;
			    	var res2=res.concat(res1);//link editar			    	         
			    	var res4=res3.concat(res1);//link eliminar
			    	var res6=res5.concat(res1);//link ver
			    	var str = "Editar";
			    	var str1 = "Aceptar";
			    	var str2 = "Ver Transferencia";
			    	var result = str.link(res2);
			    	var result1 = str1.link(res4);
			    	var result2 = str2.link(res6);
			    	     
			    	document.getElementById("devolver").innerHTML = result;//editar
			    	document.getElementById("devolver1").innerHTML = result1;//eliminar
			    	document.getElementById("devolver2").innerHTML = result2;//ver
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
					<button  id="devolver1" type="button" class="btn btn-default" id="confirmOk">Sí</button>
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
      					<div class="panel-heading" ><h4>TRANSFERENCIAS</h4></div>
			      		<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('BODEGUERO') or hasRole('DBA')" >
				      		<div class="panel-body">
				      			<a href="<c:url value='/detalletransferencia-agregar' />" class="btn btn-primary">Nueva Transferencia</a> --- 
				                <button  id="devolver" type="button" class="btn btn-success" id="confirmOk">Editar</button> 
				               	<sec:authorize access="hasRole('ADMINISTRADOR')">
				               	--- <button type="button" class="btn btn-warning" id="btnDelete"> Eliminar</button>  
				               	</sec:authorize>
				               	--- <button type="button" id="devolver2" class="btn btn-success" > Ver Transferencia</button> 
				      		</div>
			      		 </sec:authorize>
    				</div>
        		</div>    
    		</div>
    		    	
			<div class="row col-md-13">
		    	<div class="panel panel-default">        
		        	<div class="panel-heading" align="center"><span class="lead">LISTA DE TRANSFERENCIAS</span></div>			
					<table id="transf" class="display" >					
					</table><br/>
				</div>
			</div>
		<div class="well" align="center">
		<a href="<c:url value='/index'/>" class="btn btn-primary"> REGRESAR</a>
		</div>
		</div>

  <div class="row"><%@include file="foot.jsp" %></div>
  <script src="<c:url value='/static/js/jquery.dataTables.min.js' />"></script>
  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
</body>
<script>
var YOUR_MESSAGE_STRING_CONST = "¿Esta seguro que quiere Eliminar este Registro?";
$('#btnDelete').on('click', function(e){
		confirmDialog(YOUR_MESSAGE_STRING_CONST, function(){
			//alert();//My code to delete
		});
	});

  function confirmDialog(message, onConfirm){
	    var fClose = function(){
			modal.modal("hide");
	    };
	    var modal = $("#confirmModal");
	    modal.modal("show");
	    $("#confirmMessage").empty().append(message);
	    $("#confirmOk").one('click', onConfirm);
	    $("#confirmOk").one('click', fClose);
	    $("#confirmCancel").one("click", fClose);
  }
  </script>
</html>