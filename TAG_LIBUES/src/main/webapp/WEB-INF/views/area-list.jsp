<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8" src="//editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>
	<script type="text/javascript">
					
				
	
	
	
	</script>
	
	
	
	<script type="text/javascript">
			    var dataSet = [];
			    var sessionId = [];
			    var sessionId1 = [];
			    var sessionId2 = [];
			    var sessionId3 = [];
			    var i=0;
			    
			    <c:forEach items="${areas}"   var="current">
			    
			     dataSet[i] = [ "${current.codigoarea}", "${current.nombrearea}"] ;
			     
			     i=i+1;
			    
			    </c:forEach>
			    
			 //   dataSet =  [ "Tiger Nixon" ];
			    
			    $(document).ready(function() {
			    	var tabla =  $('#areas').DataTable( {
			            data:  dataSet,
			            columns: [
			               { title: "CODIGO" },
			               { title: "NOMBRE DEL AREA" },
			             
			               {"render": function () {
			                   
			            	  
			            	   
			            	   return '<a href="<c:url value='/edit-area-101' />" class="btn btn-success custom-width">Editar</a></td>';
			               }}
			              
			              
			               
			               ]
			               /*"fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) //Inicializa los botones en todas las paginas
							{
									$( ".editar" ).button({ icons: {primary: "ui-icon-pencil" }  });
									$( ".eliminar" ).button({ icons: {primary: "ui-icon-trash" }  });


								return nRow;
							}*/
							
							
							
							
						
			        
			        } );
			    	
			    	 $('#areas tbody').on( 'click', 'tr', function () {
			    	        if ( $(this).hasClass('selected') ) {
			    	            $(this).removeClass('selected');
			    	            dato = "";
			    	            //alert(dato);
			    	        }
			    	        else {
			    	            tabla.$('tr.selected').removeClass('selected');
			    	            $(this).addClass('selected');
			    	            dato = $(this).find("td:eq(2)").text();
			    	           // var button = '<input type="submit" value="Numero parrafos" id="num_parrafos" name="Numero Parrafos"/>';
			    	           // $('#formID').append(button); o $('.formClass').append(button);
			    	            
			    	            return '<a href="<c:url value='/edit-area-dato' />" class="btn btn-success custom-width">Editar</a></td>';
			    	            //alert(dato);
			    	        }
			    	    } );
			        
			        
			    	
			        
			        
			    } );
			    
			   </script>
								   
		      

</head>

<script type="text/javascript">

			function obtenNombre(fila) 
			{ 
			    var e = document.getElementById("areas").rows[fila].cells[1].innerText; 
			    alert(e);
			    
			    //location.href = 'pagina.jsp?campo=' + x; 
			} 
</script> 


</script>




<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">
	<div class="row"><%@include file="menu.jsp" %></div>
	<div class="row">
		<!--<h1>Areas</h1>-->
		<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well">
                <a href="<c:url value='/area-agregar' />" class="btn btn-primary">Nueva Area</a> |
                <a href="<c:url value='/index' />"> Regresar</a>
            </div>
        </sec:authorize>

		<!--<div class="col-xs-8">-->
	 	<div class="row col-md-13">
        	<div class="panel panel-default">
            <!-- Default panel contents -->
            	<div class="panel-heading"><span class="lead">Areas</span></div>
				<table id="areas" class="table table-striped ">
					
				</table><br/>
			</div>
		</div>
	</div>

</div>
<br/><br/>
<div class="row"><%@include file="foot.jsp" %></div>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
</body>
</html>