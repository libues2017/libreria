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
		<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/select/1.2.3/js/dataTables.select.min.js"></script>
		
	     <script type="text/javascript">

			    var dataSet = [];
			    var sessionId = [];
			    var sessionId1 = [];
			    var sessionId2 = [];
			    var sessionId3 = [];
			    var i=0;
			    
			    <c:forEach items="${detalleretaceo}"   var="current">

			   
			     dataSet[i] = [ "${current.codigoretaceo}","${current.codigoproducto}", "${current.precioproducto}", "${current.cantidadproducto}" ] ;
			     i=i+1;
			    
			    </c:forEach>
			    
			 //   dataSet =  [ "Tiger Nixon" ];
			    
			    $(document).ready(function() {
			    	var tabla = $('#example').DataTable( {
			            data:  dataSet,
			            columns: [
			            	 { title: "Codigo de Retaceo" },
			               { title: "Codigo de Producto" },			            
			                { title: "Precio de Producto" },
			               { title: "Cantidad de Producto" }
			            ]
			        
			        } );			        
			        
			        $('#example tbody').on( 'click', 'tr', function () {
			    		
		    	        if ( $(this).hasClass('selected') ) {
		    	            $(this).removeClass('selected');
		    	            dato = "";
		    	            codigoproducto = "";
		    	           
		    	        }
		    	        else {
		    	            tabla.$('tr.selected').removeClass('selected');
		    	            $(this).addClass('selected');
		    	            dato = $(this).find("td:eq(0)").text();	
		    	            codigoproducto= $(this).find("td:eq(1)").text();	
		    	            var h1 = document.createElement("hola");
		    	            var h2 = document.createElement("hola");			    	            
		    	          var res = "http://localhost:8080/TAG_LIBUES/edit-detalleRetaceo-";    	         
		    	         
		    	         var res1=dato;
		    	         var res12="-";	
		    	         var res123=codigoproducto;	
		    	         var res2=res.concat(res1);//link editar			    	         
		    	         var res2=res2.concat(res12);  
		    	         var res2=res2.concat(res123);
		    	         
		    	         var str = "Editar";
		    	      
		    	        var result = str.link(res2);		    	      
		    	     
		    	          document.getElementById("devolver").innerHTML = result;
		    	          
		    	      }	  
		    	    } );    
			        
			        
			        
			    } );
			    
			    
			</script>
			
</head>
<body>



<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<div class="row">
<!--<h1>Areas</h1>-->
<sec:authorize access="hasRole('ADMINISTRADOR')">
			    <div class="well" align="center">
                <a href="<c:url value='/detalleretaceo-agregar' />" class="btn btn-primary">Nuevo retaceo</a> 
                <a href="<c:url value='/index' />"> Regresar</a>
                
                 <p>OPCIONES</p>
                <p id="devolver" class="btn btn-success"></p> 
               
                
            </div>
        </sec:authorize>
<!--<div class="col-xs-8">-->
	
	
	
	 <div class="row col-md-10">
			        <div class="panel panel-default">
			              <!-- Default panel contents -->
			            <div class="panel-heading"><span class="lead">Retaceo</span></div>
			<table id="example" class="table table-striped ">
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
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
</body>
</html>

