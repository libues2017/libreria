<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Librería UES</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>    
    <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
	
    <script>
      function validar()
      {
    	  var nomarea = document.getElementById('nombrearea').value;
    	  if (nomarea != '')
    	  {
    		  alert('El área se creo con éxito') ;  
    	  }
    	  	
    	  else
    	  {
    		  alert('Ingrese un nombre de área');
    	  }
      }
    </script>
    
    <script>
      function editarvalidar()
      {
    	  var nomarea = document.getElementById('existencia').value;
    	  
    	  if (nomarea != '')
    	  {
    		  alert('El área se actualizo con éxito') ;  
    	  }
    	  	
    	  else
    	  {
    		  alert('Ingrese un nombre de área');
    	  }
      }
    </script>

</head>
<body>
<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="col-xs-8">
	<c:choose>
	<c:when test="${edit}">
		<div class="well lead" align="center">AJUSTE</div>
	</c:when>
    <c:otherwise>
    	<div class="well lead" align="center">NUEVA ÁREA</div>
    </c:otherwise>
    </c:choose>	  
        <form:form method="POST" modelAttribute="producto" class="form-horizontal">
            <form:input type="hidden" path="codigoProducto" id="codigoProducto"/>
            <div class="well lead"> 
	            <div class="row">
	                <div class="form-group col-md-12">
	                    <label class="col-md-3 control-lable" for="nombrearea">Nombre Producto:</label>
	                    <div class="col-md-7">
	                        <form:input type="text" path="nombreProducto" id="nombreProducto"  maxlength="50"  class="form-control input-sm"/>
	                        <div class="has-error">
	                            <form:errors path="nombreProducto" class="help-inline"/>
	                        </div>
	                    </div>
	                </div>
	            </div>   
	            
	                    
           
		        <div class="row">
		        	<div class="form-group col-md-12" >
                    	<label class="col-md-3 control-lable" for="estado">Cantidad Inventario Teorico:</label>
                    	<div class="col-md-7">
                    	 <c:if test = "${ubicacion = 'bodega'}">
                    	
                        	<form:input type="number" path="existencia" id="existencia" class="form-control input-sm" value='${cantidad}'/>
                       </c:if>
                        
                        <form:input type="number" path="sala" id="sala" class="form-control input-sm" value='${cantidad}'/>
                  
                    
                    	</div>
               		</div>
            	</div>
            	
            	<div class="form-group col-md-12" >
                    	<label class="col-md-3 control-lable" for="estado">Cantidad Inventario Fisico:</label>
                    	<div class="col-md-7">
                    	 <input type="number"  id="cantidadfisico"  class="form-control input-sm" value="${cantidadfisico}" />      
                    	</div>
               		</div>
            	
            	
            	<div class="row">
		        	<div class="form-group col-md-12" >
                    	<label class="col-md-3 control-lable" for="estado">Ubicacion:</label>
                    	<div class="col-md-7">
                    	
                    	
                        	<input type="text"  id="ubicacion" placeholder="AUTOMATICO" class="form-control input-sm" value="${ubicacion1}" />      
                       
                        
                    
                    	</div>
               		</div>
            	</div>
            	
            	
            	
            	<div class="row">
		        	<div class="form-group col-md-12" >
                    	<label class="col-md-3 control-lable" for="estado">Justificacion:</label>
                    	<div class="col-md-7">
                    	
                        	
                       <textarea name="concepto" id="concepto" rows="10" cols="50"  class="form-control input-sm">
                       </textarea>
                       
                    	</div>
               		</div>
            	</div>
            	
            	 <div class="col-xs-3" style="display:none">
                    <label class="col-md-3 control-lable" for="nombr" >Subtotal</label>
                    <form:input type="number" path="existencia" id="existencia" class="form-control input-sm" value='${cantidad}' />
                    </div>		
            	
     
            <div class="row">
                <div class="form-actions floatRight" align="center">
                    
                        
                            <input type="submit" value="Realizar Ajuste" class="btn btn-primary btn-sm" /> 
                            
                            ó <a href="<c:url value='/comparacion' />" class="btn btn-primary btn-sm">Cancelar</a>
                        
                        
                    
                </div>
            </div>
            </div>
        </form:form>
</div>

</div>

<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
</body>
</html>