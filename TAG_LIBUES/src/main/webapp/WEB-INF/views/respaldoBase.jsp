<%@page import="java.sql.*" %>
<%@page import ="java.util.Calendar" %>
<%
try{
    Calendar fecha = Calendar.getInstance();
    String fechaHoy = fecha.get(Calendar.DATE)+"_"+fecha.get(Calendar.MONTH)+"_"+fecha.get(Calendar.YEAR);
    String nombre = "Respaldo_Sistema_"+fechaHoy+".sql";
    int copia_seguridad;

    Process runtimeProcess = Runtime.getRuntime().exec("C:/xampp/mysql/bin/mysqldump.exe --opt  --password=root --user=root --databases libues -r C:/Respaldo/"+nombre);
    copia_seguridad = runtimeProcess.waitFor(); 

    if(copia_seguridad==0){ //Devuelve 0 si todo ha salido bien
%>      <script> 
            function respaldoRealizado() {
                alert("El respaldo ha sido creado con exito.\n\nCompruebe la ubicacion del archivo en el disco local \nC:/Respaldo/");
                location.href="http://localhost:8080/TAG_LIBUES/index"; 
            } 
            respaldoRealizado(); 
        </script> 
<%        
    } else {
%>      <script> 
            function respaldoNoRealizado() {
                alert("El respaldo no se pudo generar");
                location.href="http://localhost:8080/TAG_LIBUES/index"; 
            } 
            respaldoNoRealizado(); 
        </script> 
<%  
    }

} catch(Exception e){
    out.println(e);
    } 
%>