<%@page import="java.sql.*" %>
<%@page import ="java.io.*" %>
<%
    try {
        Process p = Runtime.getRuntime().exec("C:/xampp/mysql/bin/mysql -u root -p root database base1");
       // Process p = Runtime.getRuntime().exec("/opt/lampp/bin/mysql -u root -p root database prueba");
        
        OutputStream os = p.getOutputStream();
        FileInputStream fis = new FileInputStream("c:/mytemp/Respaldo.sql");
        byte[] buffer = new byte[10];
 
        int leido = fis.read(buffer);
        while (leido > 0) {
            os.write(buffer, 0, leido);
            leido = fis.read(buffer);     
        }
       
        os.flush();
        os.close();
        fis.close();
 
    } catch (Exception e) {
       e.printStackTrace();
      
   }
%>
