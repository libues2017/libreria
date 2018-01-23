<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale"%>
  

<% /*Parametros para realizar la conexión*/ 
try{
String fechaCierre= request.getParameter("fecha_cierre");
String user=request.getParameter("usuario");
String grupo=request.getParameter("nombre");
String  inicio= request.getParameter("desde");
String fin= request.getParameter("hasta");
//grupo="VolEntraPro.jasper";
Connection conexion; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/libues","root","root");
/*Establecemos la ruta del reporte*/ 
//File reportFile = new File(application.getRealPath("Reportes/VolProBode.jasper"));
String cosa =application.getRealPath("/").replace('\\', '/');
File reportFile = new File(cosa+"Reportes/"+grupo);
System.out.println(reportFile.getPath ());
SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy-MM-dd");

SimpleDateFormat formateador = new SimpleDateFormat("MMMM 'de' yyyy", new Locale("es_ES"));
Date fecha1=null;
Date fecha2=null;
Date fecha3=null;
fecha1 = formatoDeFecha.parse(fechaCierre);

String fecha = formateador.format(fecha1);
Map parameters = new HashMap();
parameters.put("fechCierre", fecha1); 
parameters.put("fec", fecha);


/*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/ 
byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),parameters, conexion); 
/*Indicamos que la respuesta va a ser en formato PDF*/ 
response.setContentType("application/pdf");
response.setContentLength(bytes.length); 
ServletOutputStream ouputStream = response.getOutputStream(); 
ouputStream.write(bytes, 0, bytes.length); /*Limpiamos y cerramos flujos de salida*/ 
ouputStream.flush(); 
ouputStream.close();
}
catch(Exception e){
	   //out.println(e);
		 %>   <script> 
	      function respaldoNoRealizado() {
	          alert("No Se han Encontrado Resultados");
	          close();
	      } 
	      respaldoNoRealizado(); 
	  </script> 
	  <%  } 
	%>
%>