<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<Style>
.control-label {
	text-align: left;
}
</Style>

<script type="text/javascript">

      function sesion(){
				
      		var fecharequisicion=document.getElementById("fecharequisicion").value;
      		var destino = document.getElementById('destino').value;
      				
      		var fecha="f";
      		var destino1="dest";
      				
      		sessionStorage[fecha]=fecharequisicion;
      		sessionStorage[destino1]=destino;
      	}
	
</script>

 				<script>
                               $( function() {
					  
									   var p;
									   var p1;
									  
										for(var i=0;i<sessionStorage.length;i++)
										{						                
							                p=sessionStorage.getItem('f');
							                p1=sessionStorage.getItem('dest');
						                }
									   document.getElementById("fecharequisicion").value=p;
									   document.getElementById("destino").value=p1;			    
					           } );
					                  
                  </script>  
</head>




<body>

	<div class="row"><%@include file="page_head.jsp"%></div>
	<div class="container">

		<div class="row"><%@include file="menu.jsp"%></div>
		<div class="col-xs-8">
			<div class="well lead">Agregar Requisición</div>
			<form:form method="POST" modelAttribute="detallerequisicion"
				class="form-horizontal">
				<form:input type="hidden" path="codigodetalle" id="codigodetalle" />

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="nombr">Documento	#:</label>
						<div class="col-md-7">
							<form:input type="text" path="codigorequisicion" id="codigorequisicion" class="form-control input-sm" value='<%=session.getAttribute("codigo2")%>' />
							<div class="has-error">
								<form:errors path="codigorequisicion" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="nombr">Destino:</label>
						<div class="col-md-7">
							<input type="text" name="destino" id="destino" class="form-control input-sm" onchange="sesion();" />
						</div>
					</div>
				</div>



				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="nombr">Fecha	Requisicion:</label>
						<div class="col-md-7">
							<input type="date" id="fecharequisicion" name="fecharequisicion" class="form-control input-sm" onchange="sesion();" />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="tags">Codigo	Producto:</label>
						<div class="col-md-7">
							<form:input type="text" path="codigoproducto" id="codigoproducto" class="form-control input-sm" onchange='label();' />
							<div class="has-error">
								<form:errors path="codigoproducto" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<table class="table table-striped ">
							<thead>
								<tr>
									<th>Nombre Poducto:</th>
									<th>Existencia:</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><label class="col-md-3 control-lable" for="proveedor" id="lbltipAddedComment"></label></td>
									<td><label class="col-md-3 control-lable" for="proveedor" style="height: 30px; line-height: 30px; text-align: center;"
										id="lbl"></label></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>


				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="nombr">Costo:</label>
						<div class="col-md-7">
							<form:input type="text" path="costo" id="costo"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="costo" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="nombr">Precio:</label>
						<div class="col-md-7">
							<form:input type="text" path="precio" id="precio"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="precio" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="nombr">Cantidad:</label>
						<div class="col-md-7">
							<form:input type="text" path="cantidad" id="cantidad"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="cantidad" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-actions floatRight">
						<c:choose>
							<c:when test="${edit}">
								<input type="submit" value="Actualizar"
									class="btn btn-primary btn-sm" /> ó <a
									href="<c:url value='/detallerequisicion-list' />">Cancelar</a>
							</c:when>
							<c:otherwise>
								<input type="submit" value="Registrar"
									class="btn btn-primary btn-sm" /> ó <a
									href="<c:url value='/detallerequisicion-list' />">Cancelar</a>
                            ó <a href="<c:url value='/finalizar' />">Finalizar</a>
							</c:otherwise>



						</c:choose>
					</div>
				</div>

			</form:form>
		</div>

	</div>

	<div class="row"><%@include file="foot.jsp"%></div>

</body>
</html>