<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale"%>
  
<% /*Parametros para realizar la conexión*/ 
try {
String codarea= request.getParameter("codigoarea");
String codprovee=request.getParameter("codigoproveedor");
String codedito= request.getParameter("codigoeditorial");
String codtiprod= request.getParameter("codtipoproducto");
String cons= request.getParameter("consignacion");
String grupo=request.getParameter("nombre");
Connection conexion; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/libues","root","root");

/*Establecemos la ruta del reporte*/ 
String cosa =application.getRealPath("/").replace('\\', '/');
File reportFile = new File(cosa+"Reportes/"+grupo);
System.out.println(reportFile.getPath ());

Map parameters = new HashMap();
parameters.put("par_area", codarea); 
parameters.put("par_provee", codprovee); 
parameters.put("par_editorial", codedito); 
parameters.put("par_tipoprod", codtiprod); 
parameters.put("par_consig", cons); 

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