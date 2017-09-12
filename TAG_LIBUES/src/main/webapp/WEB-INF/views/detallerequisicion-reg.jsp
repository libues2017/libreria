<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    
    <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
   	<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <Style>
    .control-label{
    	text-align: left;
    	}
    </Style>

	    <script type="text/javascript">
		function label(){
			var Id=document.getElementById("codigoproducto").value;
            var sessionId = [];
            var nombre = [];
            
            <c:forEach items="${producto}" var="current">
            	if(${current.codigoProducto}==Id){
              		nombre.push("${current.nombreProducto}");
              		document.getElementById('lbltipAddedComment').innerHTML = nombre;
              		sessionId.push("${current.existencia}");
              		document.getElementById('lbl').innerHTML =sessionId;
              	}
            	</c:forEach>
              	return true;
				alert()
		}
		
		function sesion(){    		
			var fechareq=document.getElementById("fecharequisicion").value;
			
				var fecha="fechareq";
				
				sessionStorage[fecha]=fechareq;
				
		}
	</script>
	
	 <script>
	 	$( function() {
	 		var p;
			
			for(var i=0;i<sessionStorage.length;i++){
				//var producto=sessionStorage.key("f");
				p=sessionStorage.getItem('fechareq');
				
			}
			document.getElementById("fecharequisicion").value=p;
			} );
					                  
  	</script>  


</head>




<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<div class="col-xs-8">
	  <div class="well lead">Agregar Requisicion</div>
        <form:form method="POST" modelAttribute="detallerequisicion" class="form-horizontal">
            <form:input type="hidden" path="codigodetalle" id="codigodetalle"/>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Documento #:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="codigorequisicion" id="codigorequisicion" class="form-control input-sm"  />
                        <div class="has-error">
                            <form:errors path="codigorequisicion" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
             
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Destino:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="destino" id="destino" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="destino" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
           
            
            <!--  
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Fecha Requisicion:</label>
                    <div class="col-md-7">
                        <form:input type="date" path="fechaquisicion" id="fechaquisicion" name="fechaquisicion" class="form-control input-sm"   onchange="sesion();" />
                        <div class="has-error">
                            <form:errors path="fechaquisicion" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            -->
        <!--      
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Codigo Producto:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="codigoproducto" id="codigoproducto" class="form-control input-sm" onchange='label();'/>
                        <div class="has-error">
                            <form:errors path="codigoproducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            -->
       <!--       
            <div class="row">
                     <div class="form-group col-md-12">
                   <table class="table table-striped ">
                     	<thead>
                     <tr >
                    
                       <th>
                            Nombre Poducto:  
                       </th>
                       
                        <th>
                            Existencia:
                        </th>
                        
                     </tr >
                    
                    	</thead>
                    	
                    	<tbody>
                     <tr >  <td><label class="col-md-3 control-lable" for="proveedor" id="lbltipAddedComment" ></label></td>
                     <td> <label class="col-md-3 control-lable" for="proveedor" style="height:30px; line-height:30px; text-align:center;" id="lbl"></label></td>
                     </tr>
                     </tbody>
                     </table>
                  
                     </div>
            </div>
            
            -->
            
            <div class="row">
                <div class="form-actions floatRight">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar" class="btn btn-primary btn-sm"/> ó <a href="<c:url value='/detalleretaceo-list' />">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar"  class="btn btn-primary btn-sm"  /> ó <a href="<c:url value='/detalleretaceo-list' />">Cancelar</a>
                            ó <a href="<c:url value='/finalizar' />">Finalizar</a>
                        </c:otherwise>
                       
                            
                       
                    </c:choose>
                </div>
            </div>
            
        </form:form>
</div>

</div>

<div class="row"><%@include file="foot.jsp" %></div>

</body>
</html>