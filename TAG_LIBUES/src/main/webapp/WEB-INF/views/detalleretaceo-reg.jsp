<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>


 
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
						h1.hidden {
                        visibility: hidden;
                          }
						  
			   </Style>
    <Style>
    .control-label{
    	text-align: left;
    	}
    </Style>
   
	
		
				  <script type="text/javascript">
				  
					function addIt1(){
						
						
						
					}
				  
							function addIt() {
							
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
								var existencia = 0.0;
	                            var costoexistencia = 0.0;
								var Id=document.getElementById("codigoproducto").value;
								var PEX; var CPEX=0.00;		
								var CPU;
							    var PV;
							    var TC;
							    var TA;
							    var PE;
							    var CPE;
							    var PVA;
								
							<c:forEach items="${producto}" var="current">
							
			              		
	 			              		    if(${current.codigoProducto}==Id) 
	 			              		    	
	 			              		    	
	 			   	 			        {
				                   existencia=${current.existencia};//5
				              		costoexistencia=${current.costounitario};//10
				              		precio=${current.precio};
				              		   PEX=parseInt(existencia);//5
				              		CPEX=parseFloat(costoexistencia);//10
				              		PVA=parseFloat(precio);
				              		
				              		    }
				              		 
		              		   </c:forEach>
		              		   
		              	        var cantidad=document.getElementById('cantidadproducto').value;//2
							    PE=parseInt(cantidad);
							    var costo=document.getElementById('costoproducto').value;//20
							    CPE=parseFloat(costo);
		              		
		              		   if(PEX==0){
		              			   
		              			   CPEX=CPE;           			   
		              			}
		              		
		              			 TC = (PEX*CPEX) +(PE*CPE) ;//(5*10) + (2*20)=90
								 TA = PEX+PE ;//5+2=7									 
                                 CPU=TC/TA ; //90/7
                             
                                 
           					  var utilidad=document.getElementById("utilidad").value;
           					  var utilidad1=0.0;
           					     utilidad1= parseInt(utilidad)/100;
           					  
           					 // alert(utilidad1);
								 PV=parseFloat(CPU)+(parseFloat(CPU)*utilidad1);  //12.85+2.57
		              			   
								 var costoproducto = document.getElementById('costoproducto').value;
								var cantidad=document.getElementById('cantidadproducto').value;								
								  var cla2 = document.getElementById('precioproducto').value=PV;								
								  var cla3 = document.getElementById('subtotal').value=parseFloat(costoproducto)*(parseInt(cantidad));
								  var cla4 = document.getElementById('existenciaanterior').value=PEX;
								  var cla5 = document.getElementById('costounitarioanterior').value=CPEX;
								   var cla6 = document.getElementById('precioanterior').value=PVA;
								   //alert(cla4);
							  
			              	}
	
                </script>
                
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
					  alert();			  
                        	
				     }
                       
                function label2(){
    				
              		var sessionId = [];
              		var Id=document.getElementById("codigoproveedor").value;
                	
			    		<c:forEach items="${proveedor}" var="current">
						  if(${current.codigoproveedor}==Id){
			    		    	 		  
			    		      sessionId.push("${current.nombreproveedor}");
			    		      document.getElementById('lbl1').innerHTML =sessionId;
			    		     
			    		    }
			    		</c:forEach>
              		
                      return true;
					
						alert();			  
                        	
				     }
                
                function sesion(){
    				
					var codigofacturaproveedor=document.getElementById("codigofacturaproveedor").value;
					var fecharetaceo=document.getElementById("fecharetaceo").value;
					var fechafacturaproveedor=document.getElementById("fechafacturaproveedor").value;
					var utilidad = document.getElementById('utilidad').value;
					
					var fecha="f";
					var fecha1="f1";
					var cfp="cfp";
					var uti="uti";
					
					sessionStorage[fecha]=fecharetaceo;
					sessionStorage[fecha1]=fechafacturaproveedor;
					sessionStorage[cfp]=codigofacturaproveedor;
					sessionStorage[uti]=utilidad;
						
				     }
                     
                 </script>
                 
                  <script>
                  
                               $( function() {
					  
									   var p;
									   var p1;
									  
										for(var i=0;i<sessionStorage.length;i++){
						                //var producto=sessionStorage.key("f");
						                p=sessionStorage.getItem('f');
						                p1=sessionStorage.getItem('f1');
						                p3=sessionStorage.getItem('cfp');	
						                p4=sessionStorage.getItem('uti');
										}
									   document.getElementById("fecharetaceo").value=p;
									   document.getElementById("fechafacturaproveedor").value=p1;
									   document.getElementById("codigofacturaproveedor").value=p3;
									   document.getElementById("utilidad").value=p4;
					    
					           } );
					                  
                  </script>                 
					
					  <script>
								  $( function() {
								  
								    var miArray=new Array();
								    var sessionId = [];								    
								    <c:forEach items="${proveedor}" var="current">										
									  sessionId.push("${current.codigoproveedor}");								
									</c:forEach>							    
								    
								    $( "#codigoproveedor" ).autocomplete({
								  
								    	source: sessionId
								    });
								  } );
								  
								  
					
					  </script>
					  				  
					  <script>
					 		
					  $( function() {
						  
						   
						    var sessionId1 = [];						    
						    <c:forEach items="${producto}" var="current">								
							  sessionId1.push("${current.codigoProducto}");						
							</c:forEach>					    
						    
						    $( "#codigoproducto" ).autocomplete({
						     /// source: availableTags
						    	source: sessionId1
						    });
						  } );
					  
					  </script>
  
  
 

</head>

	
<body>

		  
<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<div class="col-xs-8">
	  <div class="well lead">Agregar Retaceo</div>
        <form:form method="POST" modelAttribute="detalleretaceo"  class="form-horizontal"  >
            <form:input type="hidden" path="codigodetalleretaceo" id="codigodetalleretaceo"/>
             
             
              <table>
			
			           <th>
		                        <div class="row">
					                <div class="form-group col-md-12">
					                    <label class="col-md-3 control-lable" for="nombr">Codigo Retaceo:</label>
					                    <div class="col-md-7">
					                        <form:input type="text" path="codigoretaceo" id="codigoretaceo" class="form-control input-sm" value='<%=session.getAttribute("codigo")%>'/>                     
					                        
					                        
					                        <div class="has-error">
					                            <form:errors path="codigoretaceo" class="help-inline"/>
					                        </div>
					                    </div>
					                </div>
					             </div>        
                       </th>
                        <th>
                       
									         <div class="row">
									             <div class="form-group col-md-12">
									                    <label class="col-md-3 control-lable" for="nombr">Fecha Retaceo:</label>
									                    <div class="col-md-7">
									                    
									                       <input type="date"  name="fecharetaceo" id="fecharetaceo" class="form-control input-sm" onchange="sesion();" />     
									                       
									             </div>
									           </div>
									          </div>
                       
							           
                       </th>
             
             </table>
                      
			<table>
			
			           <th>
						              <div class="row">
						                <div class="form-group col-md-12">
						                    <label class="col-md-3 control-lable" for="nombr">Codigo Factura:</label>
						                    <div class="col-md-7">
						                        <form:input type="text" path="codigofacturaproveedor" id="codigofacturaproveedor" class="form-control input-sm" />                       
						                        
						                        
						                        <div class="has-error">
						                            <form:errors path="codigofacturaproveedor" class="help-inline"/>
						                        </div>
						                    </div>
						                </div>
						             </div>
                       </th>
                        <th>
                       
							              <div class="row">
							                <div class="form-group col-md-12">
							                    <label class="col-md-3 control-lable" for="nombr">Fecha Factura:</label>
							                    <div class="col-md-7">
							                        <form:input type="date" path="fechafacturaproveedor" id="fechafacturaproveedor" name="fechafacturaproveedor" class="form-control input-sm"  onchange="sesion();"  />                        
							                                               
							                        <div class="has-error">
							                            <form:errors path="fechafacturaproveedor" class="help-inline"/>
							                        </div>
							                    </div>
							                </div>
							               </div>
                       
                        
                       </th>
             
             </table>
             
             
            
             <table>
			
			           <th>
		                             
								               <div class="row">
								                <div class="form-group col-md-12">
								                    <label class="col-md-3 control-lable" for="tags">Codigo Proveedor:</label>
								                    <div class="col-md-7">
								                         <form:input type="text" path="codigoproveedor" id="codigoproveedor" class="form-control input-sm" onchange='label2();' />       
								                        
								                        <div class="has-error">
								                            <form:errors path="codigoproveedor" class="help-inline"/>
								                        </div>
								                    </div>
								                </div>
								               </div>
                         
                       </th>
                        <th>
					                     
									<table class="table table-striped ">
					                   <thead>
					                     <tr >
					                     <th>
					                       Nombre Proveedor:  
					                       </th>					                                               
					                    </tr >
					                   </thead>					                    	
					                    <tbody>
					                     <tr >  <td><label class="col-md-3 control-lable" for="proveedor" id="lbl1"  ></label></td>					                   
					                     </tr></tbody> </table>   
							           
                       </th>
             
                
             </table>
             
                 			  
			 <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="tags">Codigo Producto:</label>
                    <div class="col-md-7">
                         <form:input type="text" path="codigoproducto" id="codigoproducto" class="form-control input-sm" onchange='label();' />       
                        
                        <div class="has-error">
                            <form:errors path="codigoproducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
               </div>
                    
				     
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
                     
				       
				       
				         <div class="row">
                <div class="form-group col-md-12"  >
                    <label class="col-md-3 control-lable" for="nombr" >Utilidad</label>
                    <div class="col-md-7">
                        <form:input type="text" path="utilidad" id="utilidad" class="form-control input-sm"  />
                        <div class="has-error">
                            <form:errors path="utilidad" class="help-inline"/>
                        </div>
                    </div>
                </div>
             </div>
				       
				
             
             <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Costo Producto:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="costoproducto" id="costoproducto" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="costoproducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
             </div>
             
                <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Cantidad de producto:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="cantidadproducto" id="cantidadproducto" class="form-control input-sm" onchange="addIt()"/>
                        <div class="has-error">
                            <form:errors path="cantidadproducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
             </div>
           
             
             <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="nombr">Precio Producto:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="precioproducto" id="precioproducto" class="form-control input-sm"  />
                        <div class="has-error">
                            <form:errors path="precioproducto" class="help-inline"/>
                        </div>
                    </div>
                </div>
             </div>
             
           <div class="row">
                <div class="form-group col-md-12" style="display: none">
                    <label class="col-md-3 control-lable" for="nombr" >subtotal</label>
                    <div class="col-md-7">
                        <form:input type="text" path="subtotal" id="subtotal" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="subtotal" class="help-inline"/>
                        </div>
                    </div>
                </div>
             </div>
          
               
             <div class="row">
                <div class="form-group col-md-12" style="display: none" >
                    <label class="col-md-3 control-lable" for="nombr" >EXISTENCIA ANTERIOR</label>
                    <div class="col-md-7">
                        <form:input type="text" path="existenciaanterior" id="existenciaanterior" class="form-control input-sm"   />
                        <div class="has-error">
                            <form:errors path="existenciaanterior" class="help-inline"/>
                        </div>
                    </div>
                </div>
             </div>
             
             <div class="row">
                <div class="form-group col-md-12" style="display: none" >
                    <label class="col-md-3 control-lable" for="nombr" >Costo ANTERIOR</label>
                    <div class="col-md-7">
                        <form:input type="text" path="costounitarioanterior" id="costounitarioanterior" class="form-control input-sm"  />
                        <div class="has-error">
                            <form:errors path="costounitarioanterior" class="help-inline"/>
                        </div>
                    </div>
                </div>
             </div>
             
             
             <div class="row">
                <div class="form-group col-md-12" style="display: none" >
                    <label class="col-md-3 control-lable" for="nombr" >Precio ANTERIOR</label>
                    <div class="col-md-7">
                        <form:input type="text" path="precioanterior" id="precioanterior" class="form-control input-sm"   />
                        <div class="has-error">
                            <form:errors path="precioanterior" class="help-inline"/>
                        </div>
                    </div>
                </div>
             </div>
             
            
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
            
              <%--=session.getAttribute("mySessionAttribute")--%>
              
               <table class="table table-striped ">
				<thead>
		    		<tr >
		    			
			      			<th>Codigo Producto</th>
			      			<th>Codigo Provedor</th>	      			
			      			<th>Cantidad Producto</th>
			      			<th>Costo Producto</th>
			      			<th>Precio Producto</th>
			      			<th>Subtotal</th>
			      		
		      			
		    		</tr>
		    	</thead>
		    	<tbody>
		    	      
				    	<c:forEach items="${retaceo2}" var="retaceos" >
				    		<tr >
				    		
				    		
				    		
				    	 <c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	           <c:if test = "${salary > 2000}">
				    			<td>${retaceos.codigoproducto}</td>
				    			<td>${retaceos.codigoproveedor}</td>
				    			<td>${retaceos.cantidadproducto}</td>
				    		    <td>${retaceos.costoproducto}</td>
				    			<td>${retaceos.precioproducto}</td>
				    			<td>${retaceos.subtotal}</td>
				    			
				    		</c:if>
				    			
				    			
				       
                        <sec:authorize access="hasRole('ADMINISTRADOR')">
                            <td><a href="<c:url value='/delete-detalleRetaceo-${retaceos.codigodetalleretaceo}' />" class="btn btn-danger custom-width">Eliminar</a></td>
                        </sec:authorize>
                        
                        
				    		</tr>
				    	 </c:forEach>
		    	</tbody>
	    </table>
           
        </form:form>
        

 <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      
 
            
</body>
</html>






