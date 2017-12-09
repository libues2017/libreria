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
    
    <script>
      function validar()
      {
    	  var nomautor = document.getElementById('nombreautor').value;
    	  if (nomautor != '')
    	  {
    		  alert('El autor fue creado con éxito') ;  
    	  }
    	  	
    	  else
    	  {
    		  alert('Digite el nombre de autor');
    	  }
      }
    
    </script>
    
<script>
      function editarvalidar()
      {
    	  var nomautor = document.getElementById('nombreautor').value;
    	  if (nomautor != '')
    	  {
    		  alert('El autor se actualizo con éxito') ;  
    	  }
    	  	
    	  else
    	  {
    		  alert('Ingrese un nombre de autor');
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
		<div class="well lead" align="center">ACTUALIZAR AUTOR</div>
	</c:when>
    <c:otherwise>
    	<div class="well lead" align="center">NUEVO AUTOR</div>
    </c:otherwise>
    </c:choose>
        <form:form method="POST" modelAttribute="autor" class="form-horizontal">
            <form:input type="hidden" path="codigoautor" id="codigoautor"/>
            <div class="well lead"> 
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombreautor">Nombre:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="nombreautor" id="nombreautor" maxlength="60" placeholder="Digite el Nombre del Autor" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="nombreautor" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
          <div class="row">
		        	<div class="row">
		        	<div class="form-group col-md-12" style="display: none">
                    	<label class="col-md-3 control-lable" for="estado">Estado:</label>
                    	<div class="col-md-7">
                        	<form:input type="text" path="estado" id="estado" class="form-control input-sm" value="1"/>
                    	</div>
               		</div>
            	</div>
            	</div>
            	      
            <div class="row">
                <div class="form-actions floatRight" align="center">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar Autor" onclick="editarvalidar();" class="btn btn-primary btn-sm"/> |||||
                            <a href="<c:url value='/autor-list' />" class="btn btn-primary btn-sm">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar Autor" onclick="validar();" class="btn btn-primary btn-sm"/> |||||
                            <a href="<c:url value='/autor-list' />" class="btn btn-primary btn-sm">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            </div>
        </form:form>
</div>

</div>


<!-- <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>-->
</body>
</html>