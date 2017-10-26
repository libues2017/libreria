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
			               { title: "CONTACTO PROVEEDOR" }]
			        
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
		    	          var res3 = "http://localhost:8080/TAG_LIBUES//delete-proveedor-";			    	         
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
                <p id="devolver" class="btn btn-success"></p> ||
                <p id="devolver1" class="btn btn-warning"></p>
             
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
<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
<div class="row"><%@include file="foot.jsp" %></div>
</body>
</html>