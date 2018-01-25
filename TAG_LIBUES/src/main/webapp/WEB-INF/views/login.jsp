<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login page</title>
        <link href="<c:url value='/static/css/bootstrap.min.css' />"  rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/estilo.css' />" rel="stylesheet"></link>
 	</head>
 
    <body>    
    <div class="container">   	
    <div class="row">
    <div class="col-md-9 right-panel"><h1>Librería Universitaria<small><br/>Universidad de El Salvador </small></h1></div>
    <div class="col-md-3 loggin-div">
        <div id="mainWrapper" >
            <div class="login-container">
                <div class="login-card">
                    <div class="login-form">
                        <c:url var="loginUrl" value="/login" />
                        <form action="${loginUrl}" method="post" class="form-horizontal">
                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger col-xs-10">
                                    <p>Usuario o Contraseña Incorrectos.</p>
                                </div>
                            </c:if>
                            <c:if test="${param.logout != null}">
                                <div class="alert alert-success col-xs-10">
                                    <p>Ha salido del sistema.</p>
                                </div>
                            </c:if>
                            <div class="input-group input-sm col-xs-10">
                                <label class="input-group-addon" for="username"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
                                <input type="text" class="form-control" id="username" name="ssoId" placeholder="Usuario" required>
                            </div>
                            <div class="input-group input-sm col-xs-10">
                                <label class="input-group-addon" for="password"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></label> 
                                <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                            </div>
                          <!--    <div class="input-group input-sm">
                              <div class="checkbox">
                                <label><input type="checkbox" id="rememberme" name="remember-me"> Remember Me</label>  
                              </div>
                            </div>-->
                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" /> 
                                 
                            <div class="form-actions col-xs-5">
                                <input type="submit" class="btn btn-block btn-primary btn-default" value="Ingresar">
                            </div>
                            <div class="col-xs-5">
							<a href="<c:url value='/index' />" class="btn btn-block btn-primary btn-default" >Cancelar</a>
						</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
       </div> 
       
        </div>
     <script src="<c:url value='/static/js/jquery-3.1.1.min.js.css' />"></script>   
 	 <script src="<c:url value='/static/js/bootstrap.min.css' />"></script>
    </body>
</html>