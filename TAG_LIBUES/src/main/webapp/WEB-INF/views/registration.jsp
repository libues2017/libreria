<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Registration Form</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
      <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
   <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
       
       
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script>
  	  function validacion(campo)
		{
		if (campo==='firstName'){
			nombre = document.getElementById(campo).value;
			if( nombre == null || nombre.length == 0 ||/[0-9]/.test(nombre) ){
				$("#glypcn"+campo).remove();
				$('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
				$('#'+campo).parent().children('span').text("Ingrese Nombre valido").show();
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
		if (campo==='lastName'){
			apellido = document.getElementById(campo).value;
			if( apellido == null || apellido.length == 0 ||/[0-9]/.test(nombre) ){
				$("#glypcn"+campo).remove();
				$('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
				$('#'+campo).parent().children('span').text("Ingrese Apellidos valido").show();
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
		if (campo==='email'){
			email = document.getElementById(campo).value;
			if( email == null || email.length == 0 || /^\s+$/.test(email) ) {
				$("#glypcn"+campo).remove();
				$('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
				$('#'+campo).parent().children('span').text("Ingrese algun Email").show();
				$('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
				return false;
				}
			else{
				if (!(/\S+@\S+\.\S+/.test(email))) {
				$("#glypcn"+campo).remove();
				$('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
				$('#'+campo).parent().children('span').text("Ingrese un Email valido").show();
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
			}
		if (campo==='Usuario'){
			apellido = document.getElementById(campo).value;
			if( apellido == null || apellido.length == 0 || /^\s+$/.test(apellido) ) {
			$("#glypcn"+campo).remove();
			$('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
			$('#'+campo).parent().children('span').text("Ingrese Usuario").show();
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
									
									if (campo==='password'){
						             apellido = document.getElementById(campo).value;
						             if( apellido == null || apellido.length == 0 || /^\s+$/.test(apellido) ) {
						                 
						                 $("#glypcn"+campo).remove();
						                 $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
						                 $('#'+campo).parent().children('span').text("Ingrese Contraseña").show();
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
								 
									
									
									
									if (campo==='confirmpassword'){
										
							            var contraseña1 = document.getElementById("password").value;
							           var  contraseña2 = document.getElementById(campo).value;
							             
							             if( contraseña1 !== contraseña2  ) {
							                 
							                 $("#glypcn"+campo).remove();
							                 $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
							                 $('#'+campo).parent().children('span').text("las contraseñas no coinciden").show();
							                 $('#'+campo).parent().append("<span id='glypcn"+campo1+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
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
								 
						 }
    
    
    </script>
    
    
    
    				
</head>
 
<body>
<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">

<div class="row"><%@include file="menu.jsp" %></div>
<div class="row">  
 		<c:choose>
	    	<c:when test="${edit}">
	        	<div class="well lead">Actualizar Usuario</div>
	        </c:when>
	        <c:otherwise><div class="well lead">Registro de Usuario</div></c:otherwise>
        </c:choose>
        <form:form name="formulario1" id="formulario1" method="POST" modelAttribute="user" class="form-horizontal" onSubmit="return validar_clave()" >
            <form:input type="hidden" path="id" id="id"/>
             
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="firstName">Nombres del Usuario</label>
                    <div class="col-md-7">
                     	<span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                        <form:input type="text" path="firstName" id="firstName" placeholder="Digite sus Nombres" class="form-control input-sm"   onkeyup="validacion('firstName');"/>
                        <div class="has-error">
                            <form:errors path="firstName" class="help-inline"/>
                        </div>
                         <span class="help-block"></span>
                    </div>
                </div>
            </div>
     
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="lastName">Apellidos del Usuario:</label>
                    <div class="col-md-7">
                        <form:input type="text" path="lastName" id="lastName" placeholder="Digite sus Apellidos" class="form-control input-sm"  onkeyup="validacion('lastName');"/>
                        <div class="has-error">
                            <form:errors path="lastName" class="help-inline"/>
                        </div>
                         <span class="help-block"></span>
                    </div>
                </div>
            </div>
     
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="ssoId">Nombre del Usuario en el Sistema:</label>
                    <div class="col-md-7">
                        <c:choose>
                            <c:when test="${edit}">
                                <form:input type="text" path="ssoId" id="ssoId" placeholder="Ingrese su Usuario" class="form-control input-sm"  disabled="true"/>
                            </c:when>
                            <c:otherwise>
                                <form:input type="text" path="ssoId" id="ssoId" placeholder="Ingrese su Usuario" class="form-control input-sm" />
                                <div class="has-error">
                                    <form:errors path="ssoId" class="help-inline"/>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
     
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="password">Contraseña:</label>
                    <div class="col-md-7">
                    <form:input type="password" path="password" id="password" name="password" placeholder="********" class="form-control input-sm"   onkeyup="validacion('password');" />
                    <div class="has-error">
					<form:errors path="password" class="help-inline"/>
                    </div>
                    <span class="help-block"></span>
                    </div>
                </div>
            </div>
            
            
            
              <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="password">Confirmar Contraseña:</label>
                    <div class="col-md-7">
                        <input type="password" path="confirmpassword" id="confirmpassword" name="confirmpassword"  placeholder="********" class="form-control input-sm" onkeyup="validacion('confirmpassword');" />
                        
                        <span class="help-block"></span>
                    </div>
                </div>
            </div>
            
            
                
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="email">Correo Electrónico:</label>
                    <div class="col-md-7">
                        <form:input type="email" path="email" id="email" placeholder="correo@ejemplo.com" class="form-control input-sm" onkeyup="validacion('email');" />
                        <div class="has-error">
                            <form:errors path="email" class="help-inline"/>
                        </div>
                         <span class="help-block"></span>
                    </div>
                </div>
            </div>
     
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="userProfiles">Rol:</label>
                    <div class="col-md-7">
                        <form:select path="userProfiles" items="${roles}" multiple="false" itemValue="id" itemLabel="type" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="userProfiles" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
     
            <div class="row">
                <div class="form-actions floatRight">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar" class="btn btn-primary btn-sm" onclick="alert('Se actualizo el usuario')"/> 
                            ó <a href="<c:url value='/list' />">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar" class="btn btn-primary btn-sm" onclick="alert('Se creo el usuario')"/> 
                            ó <a href="<c:url value='/list' />">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </form:form>
    </div>
    </div>
    <div class="row"><%@include file="foot.jsp" %></div>
    

			 <script src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>   
			 <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
			 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
			 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
			      
    
    


</body>
</html>