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
				  
				  			  
				  
							function addIt(campo) {
							
								/*
								Aquí se detallan las siglas de las variables utilizadas en el cálculo: 
 
										Cantidad de Productos en existencia = PEX 
										Cantidad de Productos de entrada = PE 
										Costo Productos en Existencia = CPEX
										Costo Productos de entrada = CPE
										Costo Promedio Unitario = CPU
										Precio de Venta = PV 
										Total de Costo = TC
										Total de Artículos = TA  
										precio de venta anterior=PVA										
										La fórmula para el cálculo del costo promedio es la siguiente: 										 
										TC = (PEX*CPEX) +(PE*CPE) 
										TA = PEX+PE 
                                        CPU=TC/TA 
										PV=CPU+(CPU*0.20). 
																		
								*/
								
								 numero=document.getElementById(campo).value;
								 // campo="costoproducto";
								  
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
					        				
				        				
								    
								
								var existencia = 0;
	                            var costoexistencia = 0.0;
	                            var precioventa = 0.0;
								var Id=document.getElementById("codigoproducto").value;
								var PEX; 
								var CPEX;		
								var CPU;
							    var PV;
							    var TC;
							    var TA;
							    var PE;
							    var CPE;
							    var PVA;
								
							 <c:forEach items="${producto}" var="current">	
	 			              		    if(${current.correlativo}==Id)	
	 			   	 			        {
						                    existencia=${current.existencia};//2
						              		costoexistencia=${current.costounitario};//2
						              		precioventa=${current.precio};
						              		PVA=parseFloat(precioventa);//2.4
						              		PEX=parseInt(existencia);//2
						              		//PEX=existencia;
						              		CPEX=parseFloat(costoexistencia);//2
						              		//PVA=parseFloat(precio);			              		
				              		    }
		              		   </c:forEach>
		              		   
		              		  // alert(PEX);
		              	        var cantidad=document.getElementById('cantidadproducto').value;//2
							    PE=parseInt(cantidad);
							    var costo=document.getElementById('costoproducto').value;//2
							    CPE=parseFloat(costo);
		              		
		              		   if(PEX==0){
		              			  // alert();
		              			   CPEX=CPE;   
		              			 //PEX=1;
		              			}
		              		
		              		   
		              			 TC = (PEX*CPEX) +(PE*CPE) ;//(2*2) + (2*2)=8
								 TA = PEX+PE ;//2+2=4	
								 
                                 CPU=TC/TA; //8/4                             
                                 
           					  var utilidad=document.getElementById("utilidad").value;
           					  var utilidad1=0.0;
           					      utilidad1= parseInt(utilidad)/100;
           					  
           					 // alert(PVA);
								 PV=parseFloat(CPU)+(parseFloat(CPU)*utilidad1);  //
		              			   
								  var costoproducto = document.getElementById('costoproducto').value;
								  var cantidad=document.getElementById('cantidadproducto').value;								
								  var cla2 = document.getElementById('precioproducto').value=PV;								
								  var cla3 = document.getElementById('subtotal').value=parseFloat(costoproducto)*(parseInt(cantidad));
								  var cla4 = document.getElementById('existenciaanterior').value=PEX;
								  var cla5 = document.getElementById('costounitarioanterior').value=CPEX;
								  var cla6 = document.getElementById('precioanterior').value=PVA;
								  //alert(PV);
								  
								 /* return true;
								  alert();	*/								  
								  
								  return true;
							  
			              	}//fin else	
								    
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
                        	
                        	
              		<c:forEach items="${producto}" var="current">
              		
              		    if(${current.correlativo} == Id){
              		    	
              		    	
                      			
              		    	
              		     nombre.push("${current.nombreProducto}");
              		     costo.push("${current.costounitario}");
              		   autor.push("${current.autores}");
              		 precio.push("${current.precio}");
              		     document.getElementById('nombreprod').value = nombre;
              		  document.getElementById('precioproducto').value = precio;
              		 // autor=autor.replace("[", " ");
              		 autor[0]=autor[0].replace("[", " ");
              		 autor[0]=autor[0].replace("]", " ");
              		
              		// document.getElementById('autor').value = autor[0];
              		 document.getElementById('autor').value = autor[0];
              		 
              		  /* sessionId.push("${current.existencia}");
              		   document.getElementById('existencia').value =${current.existencia}+${current.sala};*/
              		   //document.getElementById('existencia').value =sessionId;
              		   
              		
              		    }
              		</c:forEach>
              		
                      return true;
					  alert();			  
                        	
				     }
                       
                    
                 </script>
                 
                  <script>
                               $( function() {					  
									   var p;
									   var p1;
									  
										for(var i=0;i<sessionStorage.length;i++){
						                var producto=sessionStorage.key("f");
						                p=sessionStorage.getItem('f');
						                p1=sessionStorage.getItem('f1');
						                p3=sessionStorage.getItem('cfp');	
						                p4=sessionStorage.getItem('uti');
										}
									  // document.getElementById("fecharetaceo").value=p;
									   //document.getElementById("fechafacturaproveedor").value=p1;
									 //  document.getElementById("codigofacturaproveedor").value=p3;
									 //  document.getElementById("utilidad").value=p4;
					    
					           } );
					                  
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
					
					<script type="text/javascript">
					
					
					
					
					
					</script>

</head>

<body >

		  
<div class="row"><%@include file="page_head_2.jsp" %></div>
<div class="container">


	  <div class="well lead" align="center">Realizar Retaceo</div>
        <form:form method="POST" name="retaceo" modelAttribute="etiqueta"  class="form-horizontal"  >
            <form:input type="hidden" path="codigoetiqueta" id="codigoetiqueta"/>             
             
      <div class="panel-group">
      	
		<div class="panel panel-success">	
			<div class="form-group row">
				<div class="panel-body">
					<div class="col-xs-3">
				        <label class="form-control" for="tags">Codigo Producto:</label>
	                    <form:input type="text" path="codigoproducto" id="codigoproducto"  placeholder="DIGITE"  class="form-control input-sm" onchange='label(); cambiar3();' />   
	                      
                    </div>
                    <div class="col-xs-5"> 
	                    <label class="form-control" for="nombr">Nombre Producto:</label>
						<input type="text" id="nombreprod" placeholder="AUTOMATICO" class="form-control input-sm" />
					</div>
				
                    
                     <div class="col-xs-2">
						<label class="form-control" for="costoactual">Nombre autor:</label>
						<input type="text"  id="autor" placeholder="AUTOMATICO" class="form-control input-sm"  />      
                    </div>
                    <div class="col-xs-3">
	                    <label class="form-control" for="nombr">Precio Producto: $</label>
	                    <form:input type="text" path="precioproducto" id="precioproducto" placeholder="AUTOMATICO" class="form-control input-sm"  />
                    </div>
                    
                     <div class="col-xs-2">
	                    <label class="form-control" for="nombr">Cantidad:</label>
	                    <form:input type="number" min="1" path="cantidadproducto" id="cantidadproducto" placeholder="DIGITE" class="form-control input-sm" onchange=" cambiar5();"/>
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
                            <input type="button" value="AGREGAR" id="agregar" class="btn btn-primary btn-sm" onkeypress="retaceo.submit()" onclick="retaceo.submit()"  />
                       	</div>
                       	<div class="col-xs-2">
                            <a href="<c:url value='/detalleretaceo-list' />" class="btn btn-primary btn-sm">CANCELAR</a>
                    	</div>                    	
                        </c:otherwise>
                    </c:choose>
                    
       			</div>
       		</div>
                <%--=session.getAttribute("mySessionAttribute")--%>
       </div>
	</div>       
            
        <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Resultados</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Imagen</th>
                        <th>Titulo</th>
                        <th>Autores</th>
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')" >
                        	<th>Area</th>
                        </sec:authorize>
                        <th>Proveedor</th>
                        <th>Editorial</th>
                        <th>Precio</th>                       
                        <th>RESERVAR</th>                        
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                            <th width="100">EDITAR</th>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <th width="100">ELIMINAR</th>
                        </sec:authorize>	
                         
                    </tr>
                </thead>
                
                <tbody>
					<c:set var="contador" value="${0}" />
                	<c:forEach items="${producto1}" var="producto">
                    	<tr>
                    	<c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	        <c:if test = "${salary > 2000}">
			    	        <c:set var="contador" value="${contador + 1}" />
			    	        <td>${contador}</td>
                        	<td><a  href="<c:url value='/producto-detalle-${producto.codigoProducto }' />"><img  src="data:image/jpeg;base64,${producto.img}" height="100" width="75" /></a></td>
                    		<td><a  href="<c:url value='/producto-detalle-${producto.codigoProducto }' />">${producto.nombreProducto}</a></td>
                    		<td>
                        	<c:forEach items="${producto.autores}" var="autor">
                        		${autor.nombreautor}<br/> 
                        	</c:forEach>
                        	</td>	
                        <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                        	<td>${producto.area.nombrearea}</td>
                        </sec:authorize>
                        <td>${producto.proveedor.nombreproveedor}</td>
                        <td>${producto.editorial.nombre}</td>
                        <td>$${producto.precio}</td>
                        
                        	<td><a href="<c:url value='/edit-reservas-${producto.codigoProducto }'/>"  class="btn btn-primary">Reservar</a></td>
                        
                        </c:if>
                       <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('DBA')">
                           	<td><a href="<c:url value='/edit-producto-${producto.codigoProducto }'/>"  class="btn btn-success custom-width">Editar</a></td>
                       </sec:authorize>
                       <sec:authorize access="hasRole('ADMINISTRADOR')">
                           	<td><a href="<c:url value='/delete-producto-${producto.codigoProducto}'/>"  class="btn btn-danger custom-width">Eliminar</a></td>
                       </sec:authorize>   
                    </tr>
                </c:forEach>
                
                </tbody>
            </table>
        </div>
		
	    <div class="well lead" align="center">	
			<a href="<c:url value='/finalizar' />" class="btn btn-primary btn-sm">Guardar Retaceo</a>
		</div>
	   
	
	</form:form>
        
</div>
 <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      
 
            
</body>
		  

</html>







<% 
    excell e=new excell();
    List producto = (List)request.getAttribute("productos");
    List addressessala = producto;
    //e.crearEtiquetas(producto);
    
    
    String nombre="Etiquetas.txt";
    

    e.Escribirtxt(nombre,producto);
    

%>

  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<%



%>
