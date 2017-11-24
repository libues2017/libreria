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
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8" src="//editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>
	<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/select/1.2.3/js/dataTables.select.min.js"></script>
	
	
	
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
	
	
		<script type="text/javascript">
			    var dataSet = [];
			    var sessionId = [];
			    var sessionId1 = [];
			    var sessionId2 = [];
			    var sessionId3 = [];
			    var sessionId4 = [];
			    var i=0;
			    
			    <c:forEach items="${autores}"   var="current">
			    
			     dataSet[i] = [ "${current.codigoautor}", "${current.nombreautor}" ] ;
			     
			     i=i+1;
			    
			    </c:forEach>
			    
			 //   dataSet =  [ "Tiger Nixon" ];
			    
			    $(document).ready(function() {
			    	var tabla =  $('#autores').DataTable( {
			            data:  dataSet,
			            columns: [
			               { title: "CODIGO DE AUTOR" },
			               { title: "NOMBRE DE AUTOR" },   ]
			        
			        } );
			        
			        

			    	 $('#autores tbody').on( 'click', 'tr', function () {
			    		 
			    		
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
			    	          var res = "http://localhost:8080/TAG_LIBUES/edit-autor-";
			    	          var res3 = "http://localhost:8080/TAG_LIBUES//estado-borrar-autor-";			    	         
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
<!--<h1>Autores</h1>-->
<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well" align="center">
                <a href="<c:url value='/autor-agregar' />" class="btn btn-primary">Agregar Autor</a> ||||||
                <a href="<c:url value='/index' />" class="btn btn-primary"> Regresar</a>
                <p>OPCIONES</p>
                <button  id="devolver" type="button" class="btn btn-success" id="confirmOk">Editar</button> || <button type="button" class="btn btn-warning" id="btnDelete"> Eliminar</button>
               
                
             
            </div>
        </sec:authorize>
 <div class="panel panel-default">
    <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Autores</span></div>
<!--<div class="col-xs-8">-->
	<table id="autores" class="table table-striped ">
	</table><br/>
	</div>
	</div>
</div>
</div>
<br/><br/>
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
<div class="row"><%@include file="foot.jsp" %></div>
</body>

<script>
var YOUR_MESSAGE_STRING_CONST = "Quieres eliminar este dato?";
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