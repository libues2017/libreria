<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
   
      <%@ page import="java.util.List"%> 
        <%@ page import="java.util.Map"%> 
          <%@ page import="fia.ues.sv.libues.modelo.Book"%> 
    
     <%@ page import="javax.servlet.http.HttpServletRequest"%> 
  <%@ page import="javax.servlet.http.HttpServletResponse"%>  
<%@ page import="org.apache.poi.hssf.usermodel.HSSFFont"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.util.HSSFColor"%>


<%@ page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@ page import="org.apache.poi.ss.usermodel.Font"%>
<%@ page import="org.springframework.web.servlet.view.document.AbstractExcelView"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFDataFormat"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page import="java.util.Date"%>
<%@ page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRichTextString"%>
<%@ page import="fia.ues.sv.libues.excell.excell"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.io.*" %> 
<%@ page import="fia.ues.sv.libues.modelo.Producto" %>
<%@ page import="fia.ues.sv.libues.modelo.Etiqueta" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%
					// Quiero la fecha actual para ponerla por defecto 
					String fecha="";
                    String sAhora = "";                   
					
						if(request.getAttribute("fecharetaceo")!=null){
					           //  fecha=session.getAttribute("fecharetaceo").toString();							
							fecha=request.getAttribute("fecharetaceo").toString();
						}						
						//System.out.println("fecha:" + fecha+" "+session.getAttribute("utilidad"));                                 
                     if(fecha==""){
                    	  
                    	Calendar ahora = Calendar.getInstance();
     					int anyo = ahora.get(Calendar.YEAR);
     					int mes = ahora.get(Calendar.MONTH) +1; 
     					int dia = ahora.get(Calendar.DAY_OF_MONTH);     					
     					if (mes < 10) {
     					sAhora = anyo + "-0" + mes;
     					} else {	sAhora = anyo + "-" + mes; }
     					if (dia < 10) { sAhora += "-0" + dia; } 
     					else {sAhora += "-"+dia;}                     	 
                     }                     
                     else{sAhora=fecha;}
%>

 
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 	
	<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>





    <link href="<c:url value='/static/js/jquery-3.1.1.min.js' />" rel="stylesheet"></link>
	   	<script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>
	   	
	   	
			  <Style>
						h1.hidden {
                        visibility: hidden;
                          }
						  
			   </Style>
			    <Style>
			    .control-label{
			    	text-align: left;
			    	}
			    </Style>
			   
				  <script>	
				  
				  function validaFloat(campo)
				  {
					  
					 numero=document.getElementById("utilidad").value;					  
					  
				    if (!/^([0-9])*[.]?[0-9]*$/.test(numero) ){
				     //alert("El valor " + campo + " no es un número");
				    
				    	    $("#glypcn"+campo).remove();
		                    $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
		                    $('#'+campo).parent().children('span').text("no es un numero").show();
		                    $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                            return false;
				    }                     
                    
                    else{
	        				$("#glypcn"+campo).remove();
	        				$('#'+campo).parent().parent().attr("class", "form-group has-success has-feedback");
	        				$('#'+campo).parent().children('span').hide();
	        				$('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-ok form-control-feedback'></span>");
	        				return true;
        				}
				  }
				  
				  		
                </script>
                
                 <script type="text/javascript">
                 
                        function label(){
						
                        	var Id=document.getElementById("codigoproducto").value;
                            var sessionId = [];
                            var nombre = [];
                            var costo=[];
                            var autor=[];
                            var precio=[];
                            var cantidad=[];
                            var bandera=1;
                        	
                        	//validar();
                        	
                            <c:forEach items="${etiquetas}" var="current">
	                  		
	              		    if(${current.codigoproducto} == Id){
	              		    	// document.getElementById('codigoproducto').value =;
	              		    	// document.getElementById('nombreProducto').value = "";
	                     		 // document.getElementById('precioproducto').value = "";
	                     		 //document.getElementById('autor_marca').value = "";
	                     		 //document.getElementById('cantidad').value = "";
	              		    	
	              		    	 bandera=0;
	              		    	
	              		    	//alert("Ya existe el registro en el detalle");
	              		    	
	              		    	// document.write('Ya existe el registro en el detalle"');
	              		    	
	              		    	
	              		    	document.getElementById('validar').innerHTML = 'Datos ya se encuentran en el detalle';
	              		    	var boton1 = document.getElementById("agregar");
	              		    	boton1.disabled = true;
	              		    	 
	              		    } //fin if
	              		  </c:forEach>
	              		
	              		  
	              		  
              		<c:forEach items="${producto}" var="current">
              		
              		    if(${current.correlativo} == Id){              		    	
              		    	
              		     nombre.push("${current.nombreProducto}");
              		     costo.push("${current.costounitario}");
              		   autor.push("${current.autores}");
              		 precio.push("${current.precio}");
              		 cantidad.push("${current.cantidadetiquetar}");
              		 
              		  if(bandera==1){
                  		
              		     document.getElementById('nombreProducto').value = nombre;
              		  document.getElementById('precioproducto').value = precio;              		
              		 autor[0]=autor[0].replace("[", " ");
              		 autor[0]=autor[0].replace("]", " ");             		
              		 document.getElementById('autor_marca').value = autor[0];
              		 document.getElementById('cantidad').value = cantidad;
              		 
              		 

       		    	document.getElementById('validar').innerHTML = '';
       		    	var boton1 = document.getElementById("agregar");
      		    	boton1.disabled = false;
       		    	 
              		 
              		  }
              		
              		    }
              		</c:forEach>
                      return true;
					  alert();	
                        }
                    
                 </script>      
					  				  
				<script>
					 		
					  $( function() {
						  
						   
						    var sessionId1 = [];						    
						    <c:forEach items="${producto}" var="current">								
							  sessionId1.push("${current.correlativo}");						
							</c:forEach>					    
						    
						    $( "#codigoproducto" ).autocomplete({
						     /// source: availableTags
						    	source: sessionId1
						    });
						  } );
					  
					  </script>

					<script>
					function cambiar1(){
						var codigo1 = document.getElementById("codigofacturaproveedor").value;	
							if(codigo1 != null){
					        	$("#codigoproveedor").focus();
							}
					}
					function cambiar2(){	
						var codigo3 = document.getElementById("codigoproveedor").value;	
							if(codigo3 != null) {
					        	$("#codigoproducto").focus();
					        }
					}
					function cambiar3(){	
						var codigo2 = document.getElementById("codigoproducto").value;	
							if(codigo2 != null) {
					        	$("#costoproducto").focus();
					        }
					}
					function cambiar4(){	
						var costo = document.getElementById("costoproducto").value;		
							if(costo != null) {
					        	$("#cantidadproducto").focus();
					        }
					}
					function cambiar5(){		
						var cantidad = document.getElementById("cantidadproducto").value;	
							if(cantidad != null) {
					        	$("#agregar").focus();
					        }
					}
					</script>
					
					
					
</head>

<body >



  
<div class="row"><%@include file="page_head_2.jsp" %></div>


<div class="container">


	  <div class="well lead" align="center">Generación Etiquetas</div>
        <form:form method="POST" name="etiqueta" modelAttribute="etiqueta"  class="form-horizontal"  >
            <form:input type="hidden" path="codigoetiqueta" id="codigoetiqueta"/>   
            
           <div  id="principal" class="panel-group">
           
	           <div class="panel panel-success">	
				<div class="form-group row">
					<div class="panel-body">
						 
	                    <div class="col-xs-2">
		                      <a href="<c:url value='/cargar-etiquetas' />" class="btn btn-primary btn-sm">Cargar</a>
		                </div>
		                <div class="col-xs-2">
		               <input type="text"  name="numero" id="numero" class="form-control input-sm" value='${marcado}' />     
				  </div>
				
				      <div class="col-xs-4">
				
				          <label class="form-control" for="nombr">Registros marcados en el maestro</label>		                
		                </div>
		                
		                <div class="col-xs-2">
		                      <a href="<c:url value='/desmarcar-etiqueta' />" class="btn btn-primary btn-sm">Desmarcar</a>
		                </div>
		                
	                </div>               
	             </div>  
	            </div>  
           </div>  
          
             
      <div class="panel-group">
      	
		<div class="panel panel-success">	
			<div class="form-group row">
				<div class="panel-body">
					<div class="col-xs-3">
				        <label class="form-control" for="tags">Código Producto:</label>
	                    <form:input type="text" path="codigoproducto" id="codigoproducto"  placeholder="DIGITE"  class="form-control input-sm" onchange='label(); cambiar3();' />   
	                     <label id="validar" for="tags"></label>
	                   
                    </div> 
                  <div ></div>                    
                    <div class="col-xs-5"> 
	                    <label class="form-control" for="nombr">Nombre Producto:</label>
	                     <form:input type="text" path="nombreProducto" id="nombreProducto"  placeholder="AUTOMÁTICO"  class="form-control input-sm"/>   
	                                          
					</div>	                    
                     <div class="col-xs-2">
						<label class="form-control" for="costoactual">Nombre autor:</label>
						 <form:input type="text" path="autor_marca" id="autor_marca"  placeholder="AUTOMÁTICO"  class="form-control input-sm"/>   
	                       					   
                    </div>
                    
                    
             
                  
                  
                  
              </div>  
		  </div>
		  
		  
		  
		  
		    <div class="form-group row">
				<div class="panel-body">
                    
                     <div class="col-xs-3">
	                    <label class="form-control" for="nombr">Precio Producto: $</label>
	                    <form:input type="text" path="precioproducto" id="precioproducto" placeholder="AUTOMÁTICO" class="form-control input-sm"  />
                    </div>                    
                     <div class="col-xs-3">
	                    <label class="form-control" for="nombr">Cantidad a Etiquetar:</label>
	                   	 
	                   	 <form:input type="number" min="1" path="cantidad" 
	                    id="cantidad" placeholder="AUTOMÁTICO" class="form-control 
	                    input-sm" onchange=" cambiar5();"   />
	                    
                  </div>
               </div>
             </div>
                     
		  
		  
		  
		  
		  
		  <div class="form-group row">
				<div class="panel-body">
				
            	    <c:choose>
                        <c:when test="${edit}">
                        <div class="col-xs-2">
                            <input type="submit" value="ACTUALIZAR" class="btn btn-primary btn-sm"/>
                        </div>
                       	<div class="col-xs-2">
                            <a href="<c:url value='/detalleretaceo-list' />" class="btn btn-primary btn-sm">CANCELAR</a>
                        </div>
                        </c:when>
                        
                        <c:otherwise>
                        <div class="col-xs-2">
                            <input type="button" value="AGREGAR" id="agregar" class="btn btn-primary btn-sm" onkeypress="etiqueta.submit()"   onclick="etiqueta.submit()"  />
                       	</div>
                       	<div class="col-xs-2">
                            <a href="<c:url value='/index' />" class="btn btn-primary btn-sm">CANCELAR</a>
                    	</div>                    	
                        </c:otherwise>
                    </c:choose>
                    
       			</div>
       		</div>
		  
				
		</div>
			                <%--=session.getAttribute("mySessionAttribute")--%>
       </div>
       
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Resultados</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Ítem</th>
                        <th>Código Producto</th>
                        <th>Nombre Producto</th>
                        <th>Autores</th>
                        <th>Cantidad</th>
                         <th>Precio</th>
                       
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <th width="100">ELIMINAR</th>
                        </sec:authorize>	
                         
                    </tr>
                </thead>
                
                <tbody>
					<c:set var="contador" value="${0}" />
                	<c:forEach items="${etiquetas}" var="etiquetas">
                    	<tr>
                    	<c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	        <c:if test = "${salary > 2000}">
			    	        <c:set var="contador" value="${contador + 1}" />
			    	        <td>${contador}</td>
			    	        <td>${etiquetas.codigoproducto}</td>
                             <td>${etiquetas.nombreProducto}</td>                             
                             <td>${etiquetas.autor_marca}</td>
                             <td>${etiquetas.cantidad}</td>
                             <td>${etiquetas.precioproducto}</td>
                        </c:if>
                       
                       <sec:authorize access="hasRole('ADMINISTRADOR')">
                           	<td><a href="<c:url value='/delete-etiqueta-${etiquetas.codigoetiqueta}'/>"  class="btn btn-danger custom-width">Eliminar</a></td>
                       </sec:authorize>   
                    </tr>
                </c:forEach>
                
                </tbody>
            </table>
        </div>
       
        <div class="well lead" align="center">	
			<a href="<c:url value='/finalizar-etiqueta' />" class="btn btn-primary btn-sm">Generar Etiquetas</a>
		</div>
       
       
	</div>  
	   
	   	
	</form:form>
        
</div>
 <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
       
</body>
</html>

  

