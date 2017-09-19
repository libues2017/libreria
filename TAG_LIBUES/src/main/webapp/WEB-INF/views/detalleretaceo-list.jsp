<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Libre�a UES</title>
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
			    var i=0;
			    
			    <c:forEach items="${detalleretaceo}"   var="current">

			     dataSet[i] = [ "${current.codigoproducto}", "${current.codigoproveedor}", "${current.precioproducto}", "${current.cantidadproducto}" ] ;
			     
			     i=i+1;
			    
			    </c:forEach>
			    
			 //   dataSet =  [ "Tiger Nixon" ];
			    
			    $(document).ready(function() {
			        $('#example').DataTable( {
			            data:  dataSet,
			            columns: [
			               { title: "Codigo de Producto" },
			                { title: "Codigo de Proveedor" },
			                { title: "Precio de Producto" },
			               { title: "Cantidad de Producto" }
			            ]
			        
			        } );
			    } );
			    
			    
			</script>
			
		  <spring:url value="/report" var="reportLink" />
  	

</head>
<body>


         <div class="well">
                <a href="<c:url value='/reporte' />" class="btn btn-primary">reporte</a> 
                
            </div>
       



<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<div class="row">
<!--<h1>Areas</h1>-->
<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well">
                <a href="<c:url value='/detalleretaceo-agregar' />" class="btn btn-primary">Nuevo retaceo</a> 
                <a href="<c:url value='/index' />"> Regresar</a>
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

