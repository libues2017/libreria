<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Libreía UES</title>
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
			    
			    <c:forEach items="${detallerequisiciones}"   var="current">			    
			     dataSet[i] = [ "${current.codigodetalle}", "${current.codigorequisicion}", "${current.codigoproducto}", "${current.nombreproducto}",
			    	 "${current.cantidad}", "${current.costo}", "${current.precio}"] ;			     
			     i=i+1;			    
			    </c:forEach>
			    
			 //   dataSet =  [ "Tiger Nixon" ];
			    
			    $(document).ready(function() {
			        $('#requisiciones').DataTable( {
			            data:  dataSet,
			            columns: [
			               { title: "CORRELATIVO" },
			               { title: "DOC #" },
			               { title: "CODIGO" },
			               { title: "PRODUCTO"},
			               { title: " ## "},
			               { title: "COSTO ($)"},
			               { title: "PRECIO ($)"}
			               ]
			        
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
<!--<h1>Editoriales</h1>-->
<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well">
                <a href="<c:url value='/detallerequisicion-agregar' />" class="btn btn-primary">Agregar Requisicion</a> |
                <a href="<c:url value='/index' />"> Regresar</a>
            </div>
        </sec:authorize>
 <div class="panel panel-default">
    <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Requisiciones</span></div>
<!--<div class="col-xs-8">-->
	<table id="requisiciones" class="table table-striped ">
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




