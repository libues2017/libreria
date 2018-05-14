<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


         <form class="form-horizontal" role="form" action="<c:url value="/retaceo" />" target="_blank">

            <div class="form-group">

            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-10">
                    <button type="submit" class="btn btn-primary">Imprimir Retaceo</button>
                    <a class="btn btn-danger" href="<c:url value="/detalleretaceo-list" />" role="button">Lista de Retaceos</a>
                </div>

				<input type="hidden" value="${loggedinuser}" name="usuario"/>
				<input type="hidden" value="Retaceo_filtrado.jasper" name="nombre"/>
            </div>
	      </form>		

</body>
</html>