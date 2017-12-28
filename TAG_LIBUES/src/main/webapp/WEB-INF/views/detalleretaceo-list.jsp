<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Librería UES</title>    
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/jquery.dataTables.min.css' />" rel="stylesheet"></link> 
    <link href="<c:url value='/static/js/jquery-3.1.1.min.js' />" rel="stylesheet"></link>
    <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>
    <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>	 	
    
		<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>
			
		
	     <script type="text/javascript">

			    var dataSet = [];
			    var sessionId = [];
			    var sessionId1 = [];
			    var sessionId2 = [];
			    var sessionId3 = [];
			    var i=0;
			    
			    <c:forEach items="${retaceo}"   var="current">
			    
			    <c:if test = "${current.total > 0}">
			    
			    
				     dataSet[i] = [ "${current.codigoretaceo}","${current.codigoproveedor}", '<fmt:formatDate pattern = "dd-MM-yyyy" 
				         value = "${current.fecharetaceo}" />', "${current.codigofacturaproveedor}","$ ${current.total}" ] ;
				     i=i+1;
			   </c:if>
			 
		      </c:forEach>
			
			  
			    
			 //   dataSet =  [ "Tiger Nixon" ];
			    
			    $(document).ready(function() {
			    	var tabla = $('#example').DataTable( {
			            data:  dataSet,
			            columns: [
			            	
			            	 { title: "Numero de Retaceo" },
			               { title: "Proveedor" },			            
			                { title: "Fecha" },
			               { title: "Factura" },
			               { title: "Monto" }			             
			            ],
			            "language": idioma_espanol
			        
			        } );			        
			        
			        $('#example tbody').on( 'click', 'tr', function () {
			    		
		    	        if ( $(this).hasClass('selected') ) {
		    	            $(this).removeClass('selected');
		    	            codigodetalle="";
		    	            dato = "";
		    	            codigoproducto = "";
		    	           
		    	        }
		    	        else {
		    	            tabla.$('tr.selected').removeClass('selected');
		    	            $(this).addClass('selected');
		    	            dato = $(this).find("td:eq(0)").text();	//obtengo el codigo retaceo
		    	            codigoproducto= $(this).find("td:eq(1)").text();	
		    	            var h1 = document.createElement("hola");
		    	            var h2 = document.createElement("hola");			    	            
		    	          var res = "/TAG_LIBUES/edit-detalleRetaceo-";    
		    	          var res3 = "/TAG_LIBUES/delete-detalleRetaceoTotal-";
		    	          
		    	         
		    	         var res1=dato;
		    	         var res12="-";	
		    	         var res123=codigoproducto;	
		    	         var res2=res.concat(res1);//link editar
		    	         
		    	         var res4=res3.concat(res1);//link eliminar	
		    	        // var res2=res2.concat(res12);  
		    	         //var res2=res2.concat(res123);
		    	         
		    	         var str = "Editar";
		    	         var str1 = "Eliminar";
		    	      
		    	        var result = str.link(res2);	
		    	        var result1 = str1.link(res4);
		    	        
		    	        //alert(result1);
		    	     
		    	          document.getElementById("devolver").innerHTML = result;
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



 

<div class="row"><%@include file="page_head_2.jsp" %></div>
<div class="container">
<div class="row">
<!--<h1>Areas</h1>-->
	<sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
			    <div class="well" align="center">
                <a href="<c:url value='/detalleretaceo-agregar' />" class="btn btn-primary">Nuevo retaceo</a>
                ||||||<a href="<c:url value='/index' />" class="btn btn-primary"> Regresar</a>
                 <p>OPCIONES</p>
               	<button  id="devolver" type="button" class="btn btn-success" id="confirmOk">Editar</button>               
                
               	|||              	
                 <button type="button" class="btn btn-warning" id="devolver1"> Eliminar</button>
            </div>
   	</sec:authorize>
<!--<div class="col-xs-8">-->
	
	
	
	 <div class="panel panel-default">
			        <div class="panel panel-default">
			              <!-- Default panel contents -->
			            <div class="panel-heading"><span class="lead">Retaceo</span></div>
			<table id="example" class="display" >
					<thead>
					
				
		    		
    	</thead>
			<tbody>
			   <tr >
    		
    			<td></td>
			   </tr >
			
			</tbody>
			
			</table>
				</div>
				
			</div>
			
			</div>

</div>

<br/><br/>

<div class="row"><%@include file="foot.jsp" %></div>
<script src="<c:url value='/static/js/jquery.dataTables.min.js' />"></script>
<!--
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
-->
</body>

<script>
var YOUR_MESSAGE_STRING_CONST = "¿Esta seguro que quieres eliminar este dato?";
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

