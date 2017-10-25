<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Libreía UES</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body Style="background-color:#97965B">
<div class="row"><%@include file="page_head_2.jsp" %></div>
<div class="container">
<div class="well lead" align="center">ESTABLECER NUMERO FACTURA</div>
<form:form method="POST" modelAttribute="factura" class="form-horizontal">
		<form:input type="hidden" path="idfactura" id="idfactura" /> 
		<div class="panel-group" align="center">			
			<div class="panel panel-default" >
				<div class="form-group row" >		
					<div class="panel-body" >
						<div class="col-xs-3" >	
						<label class="form-control" for="codigo">ID #:</label>						
						<form:input type="text" path="idfactura" id="idfactura" class="form-control input-sm"  value='<%=session.getAttribute("codigofact")%>'/>
						</div>
						<div class="col-xs-3" align="center">	
						<label class="form-control" for="factura">Número de Factura:</label>						
						<input type="text" maxlength="10" id="numerofactura" name="numerofactura" class="form-control input-sm" />
						</div>
					</div>
				</div>
				<div class="form-group row" >
					<div class="panel-body" >
						<div class="col-xs-2" >
							<input type="submit" value="ESTABLECER" class="btn btn-primary btn-sm" />
						</div>
						<div class="col-xs-2" >
							<a href="<c:url value='/index' />" class="btn btn-primary btn-sm" >CANCELAR - SALIR</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</div>

<script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
</body>
</html>