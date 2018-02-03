<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Cierre de Caja</title>
	<link href="<c:url value='/static/css/bootstrap.min.css' />"  rel="stylesheet"></link>
	<script type="text/javascript">
	function getDate(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();

		if(dd<10) {
		    dd='0'+dd
		} 

		if(mm<10) {
		    mm='0'+mm
		} 

		today = dd+'/'+mm+'/'+yyyy;
		document.write(today);
    }
	</script>
	
</head>
<body>
<div class="row">
	<div class="col-md-1"></div>
	<div class="fluid-container col-md-10 col-xs-12">
		<%@include file="authheader.jsp" %>	
	</div>
	<div class="col-md-1"></div>
</div>
<div class="row">
            <div class="container col-xs-1 col-sm-1 col-md-1"></div>

            <div class="container col-xs-10 col-sm-10 col-md-10 ">
                <div class="col-sm-2"><h4 class="text-left">Fecha de emisión: </br><script type="text/javascript">getDate()</script></h4></div>
                
                <div class="container col-xs-1 col-sm-1 col-md-1"></div>
            </div>
        </div>
        <div class="row"><h2 class="text-center"><small>Librería Universitaria</small></h2></div>
        <div class="row"><h3 class="text-center">Reporte de Cierre de Caja</h3></div>

        </br>
        </br>
        <form class="form-horizontal" role="form" action="<c:url value="/repo_cierre_caja" />" target="_blank">

            <div class="form-group">
                <label class="control-label col-sm-4" for="email">Fecha de Cierre de Caja:</label>
                <div class="col-sm-4">
                    <input type="date" class="form-control" name="fecha_cierre" id="fecha_cierre"  value="99/99/9999" required>
                </div>
            </div>
     
					
			<div class="form-group">

            </div>	
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-10">
                    <button type="submit" class="btn btn-primary">Generar Reporte</button>
                      <a class="btn btn-danger" href="<c:url value="/index" />" role="button">Regresar</a>
                </div>

<input type="hidden" value="${loggedinuser}" name="usuario"/>
<input type="hidden" value="Cierre_Caja.jasper" name="nombre"/>
            </div>
	</form>
	<script src="<c:url value="/static/js/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
</body>
</html>