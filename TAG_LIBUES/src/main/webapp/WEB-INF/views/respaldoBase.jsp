<%@page import="java.sql.*" %>
<%@page import ="java.util.Calendar" %>
<%
try{
    Calendar fecha = Calendar.getInstance();
    String fechaHoy = fecha.get(Calendar.DATE)+"_"+fecha.get(Calendar.MONTH)+"_"+fecha.get(Calendar.YEAR);
    String nombre = "Respaldo_Sistema_"+fechaHoy+".sql";
    int copia_seguridad;

   //Process runtimeProcess = Runtime.getRuntime().exec("C:/xampp/mysql/bin/mysqldump.exe --opt  --password=root --user=root --databases libues -r C:/Respaldo/"+nombre);
   //Process runtimeProcess = Runtime.getRuntime().exec("/opt/lampp/bin/mysqldump --opt  --password=root --user=root --databases libues -r C:/Respaldo/"+nombre);
   	Process runtimeProcess = Runtime.getRuntime().exec("/opt/lampp/bin/mysqldump --opt  --password=root --user=root --databases libues -r /home/vladimir/mytemp/"+nombre);

   	copia_seguridad = runtimeProcess.waitFor(); 

    if(copia_seguridad==0){ //Devuelve 0 si todo ha salido bien
%>      <script> 
            function respaldoRealizado() {
                alert("El respaldo ha sido creado con exito.\n\nCompruebe la ubicacion del archivo en el disco duro del servidor \n/home/gestor/Respaldo/");
                //alert("El respaldo ha sido creado con exito.\n\nCompruebe la ubicacion del archivo en el disco local \nC:/Respaldo/");
                location.href="/TAG_LIBUES/index"; 
            } 
            respaldoRealizado(); 
        </script> 
<%        
    } else {
%>      <script> 
            function respaldoNoRealizado() {
                alert("El respaldo no se pudo generar");
                location.href="/TAG_LIBUES/index"; 
            } 
            respaldoNoRealizado(); 
        </script> 
<%  
    }

} catch(Exception e){
    out.println(e);
    } 
%>