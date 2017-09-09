<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <spring:url value="/report" var="reportLink" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Report</title>
    </head>
    <body>
        <h1>Customer JasperReport Application</h1>
        <p>Esta aplicacion muestra como generar reportes con JasperReport en una aplicacion web Spring MVC.</p>

        <div>
            <a href="localhost:8084/dynamicjasper/reportes/pdf">Ver Reporte PDF</a> <br/>
            <a href="${reportLink}?format=xls">Ver Reporte XLS</a><br/>
            <a href="${reportLink}?format=csv">Ver Reporte CSV</a><br/>
        </div>

    </body>
</html>