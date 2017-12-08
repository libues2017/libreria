<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Librer�a UES</title>
    <link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/jquery.dataTables.min.css' />" rel="stylesheet"></link> 
    <link href="<c:url value='/static/js/jquery-3.1.1.min.js' />" rel="stylesheet"></link>
    <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>
	
		<script type="text/javascript">
			    var dataSet = [];
			    var sessionId = [];
			    var sessionId1 = [];
			    var sessionId2 = [];
			    var sessionId3 = [];
			    var sessionId4 = [];
			    var i=0;
			   
			    <c:forEach items="${proveedores}"   var="current">
			    
			     dataSet[i] = [ "${current.codigoproveedor}", "${current.nombreproveedor}", "${current.contactoproveedor1}" ] ;
			     
			     i=i+1;
			    
			    </c:forEach>
			    
			 //   dataSet =  [ "Tiger Nixon" ];
			    
			    $(document).ready(function() {
			       var tabla = $('#proveedores').DataTable( {
			            data:  dataSet,
			            columns: [
			               { title: "CODIGO PROVEEDOR" },
			               { title: "NOMBRE PROVEEDOR" },
			               { title: "CONTACTO PROVEEDOR" }],
			       "language": idioma_espanol
			        
			        } );
			       
			       
			        $('#proveedores tbody').on( 'click', 'tr', function () {
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
		    	          var res = "http://localhost:8080/TAG_LIBUES/edit-proveedor-";
		    	          var res3 = "http://localhost:8080/TAG_LIBUES//estado-borrar-proveedor-";			    	         
		    	         var res1=dato;
		    	         var res2=res.concat(res1);//link editar			    	         
		    	         var res4=res3.concat(res1);//link eliminar			    	       
		    	         var str = "Editar";
		    	         var str1 = "Eliminar";
		    	        var result = str.link(res2);
		    	        var result1 = str1.link(res4);			    	     
		    	          document.getElementById("devolver").innerHTML = result;
		    	          document.getElementById("devolver1").innerHTML = result1;
		    	          
		    	      }	  
		    	    } );
			    } );
			    
			    var idioma_espanol = {
					    "sProcessing":     "Procesando...",
					    "sLengthMenu":     "Mostrar _MENU_ registros",
					    "sZeroRecords":    "No se encontraron resultados",
					    "sEmptyTable":     "Ning�n dato disponible en esta tabla",
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
					        "sLast":     "�ltimo",
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


    <!-- Modal confirm -->
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


<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<!-- <div class="row"> <%@include file="authheader.jsp" %></div>-->
<div class="row">
<!--<h1>Proveedores</h1>-->
<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well" align="center">
                <a href="<c:url value='/proveedor-agregar' />" class="btn btn-primary">Agregar Proveedor</a> ||||||
                <a href="<c:url value='/index' />" class="btn btn-primary"> Regresar</a>
                <p>OPCIONES</p>
                 <button  id="devolver" type="button" class="btn btn-success" id="confirmOk">Editar</button> || <button type="button" class="btn btn-warning" id="btnDelete"> Eliminar</button>
               
             
            </div>
        </sec:authorize>
 <div class="panel panel-default">
    <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Proveedores</span></div>
<!--<div class="col-xs-8">-->
	<table id="proveedores" class="table table-striped ">
	</table><br/>
	</div>
	</div>
</div>
</div>
<br/><br/>
<div class="row"><%@include file="foot.jsp" %></div>
<!--<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
-->
<script src="<c:url value='/static/js/jquery.dataTables.min.js' />"></script>
</body>

<script>
var YOUR_MESSAGE_STRING_CONST = "�Quieres eliminar este dato?";
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