<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Ventas Mensuales por Específico de Gastos</title>
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
        <div class="row"><h3 class="text-center">Reporte de Ventas por Especifico de Gastos</h3></div>

        </br>
        </br>
        <form class="form-horizontal" role="form" action="<c:url value="/repo_ventas_mensual_gastos" />" target="_blank">

            <div class="form-group">
                <label class="control-label col-sm-4" for="email">Fecha desde:</label>
                <div class="col-sm-3">
                    <input type="date" class="form-control" name="fecha_inicio" id="fecha_inicio"  value="99/99/9999" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="pwd">Fecha hasta:</label>
                <div class="col-sm-3">
                    <input type="date" class="form-control" name="fecha_fin" id="fecha_fin" value="99/99/9999" required>
                </div>
            </div>
           
                               			
		   <div class="form-group">			
			<label class="control-label col-sm-4" for="nombr">Específico de Gastos:</label>
			<div class="col-sm-3">
				<SELECT name="especificoGastos" id="especificoGastos" class="form-control input-sm" required>
										<OPTION VALUE="">Seleccione el Especifíco de Gastos</OPTION>
										<OPTION VALUE="54101">54101 Productos Alimenticios Para Personas</OPTION>
										<OPTION VALUE="54102">54102 Productos Alimenticios Para Animales</OPTION>
										<OPTION VALUE="54103">54103 Productos Agropecuarios y Forestales</OPTION>
										<OPTION VALUE="54104">54104 Productos Textiles y Vestuarios</OPTION>
										<OPTION VALUE="54105">54105 Productos de Papel y Cartón</OPTION>
										<OPTION VALUE="54106">54106 Productos de Cuero y Caucho</OPTION>							
										<OPTION VALUE="54107">54107 Producto Químicos</OPTION>
										<OPTION VALUE="54108">54108 Productos Farmacéuticos y Medicinales</OPTION>
										<OPTION VALUE="54109">54109 Llantas y Neumáticos</OPTION>
										<OPTION VALUE="54110">54110 Combustibles y Lubricantes</OPTION>
										<OPTION VALUE="54111">54111 Minerales no Metálicos y Productos Derivados</OPTION>
										<OPTION VALUE="54112">54112 Minerales Metálicos y Productos Derivados</OPTION>	
										<OPTION VALUE="54113">54113 Material e Instrumental de Laboratorio y Uso Medico</OPTION>
										<OPTION VALUE="54114">54114 Material de Oficina</OPTION>
										<OPTION VALUE="54115">54115 Material Informático</OPTION>
										<OPTION VALUE="54116">54116 Libros, textos, útiles de Enseñanza y Publicaciones</OPTION>
										<OPTION VALUE="54117">54117 Materiales de defensa y Seguridad Publica</OPTION>
										<OPTION VALUE="54118">54118 Herramientas, repuestos y Accesorios</OPTION>
										<OPTION VALUE="54119">54119 Materiales Eléctricos</OPTION>
										<OPTION VALUE="54199">54199 Bienes de Uso y Consumo Diversos</OPTION>				
								</SELECT>
			</div>
			</div>
			
			<div class="form-group">		
				<label class="control-label col-sm-4" for="nombr">Consignación:</label>
				<div class="col-sm-3">
				<SELECT name="consignacion" id="consignacion" class="form-control input-sm" onchange="sesion();">
				<OPTION VALUE="">Seleccione Consignación </OPTION>
				<OPTION VALUE="si">Si</OPTION>
				<OPTION VALUE="no">No</OPTION>
				</SELECT>
			</div>
			 </div>			
   
            <div class="form-group">

            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-10">
                    <button type="submit" class="btn btn-primary">Generar Reporte</button>
                      <a class="btn btn-danger" href="<c:url value="/index" />" role="button">Menu Principal</a>
                </div>
                
				<input type="hidden" value="${loggedinuser}" name="usuario"/>
				<input type="hidden" value="VentasMensualGastos.jasper" name="nombre"/>
            </div>
	</form>
	<script src="<c:url value="/static/js/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
</body>
</html>