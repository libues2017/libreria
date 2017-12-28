<%@page import="java.sql.*" %>

<%
try{
	    String driverName = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost:3306/libues";
	    String username = "root";
	    String password = "root";

	    Connection connection = DriverManager.getConnection(url, username, password);
	    Statement stmt = connection.createStatement();
	   
	    // Use TRUNCATE
	    String sql1 = "DELETE FROM detalleretaceo";
	    String sql2 = "DELETE FROM retaceo";
	    String sql3 = "DELETE FROM detalle_requisicion_producto";
	    String sql4 = "DELETE FROM requisicion";
	    String sql5 = "DELETE FROM detalletransferencia";
	    String sql6 = "DELETE FROM transferencia";
	    String sql7 = "DELETE FROM factura_detalle";
	    String sql8 = "DELETE FROM factura";
	    // Execute deletion
	    stmt.executeUpdate(sql1);
	    stmt.executeUpdate(sql2);
	    stmt.executeUpdate(sql3);
	    stmt.executeUpdate(sql4);
	    stmt.executeUpdate(sql5);
	    stmt.executeUpdate(sql6);
	    stmt.executeUpdate(sql7);
	    stmt.executeUpdate(sql8);

	   %>      <script> 
        function respaldoRealizado() {
            alert("Se ha Realizado el Cierre Semestral");
            location.href="/TAG_LIBUES/index"; 
        } 
        respaldoRealizado(); 
    </script> 
<% 
}
	    catch(Exception e){
	 	   //out.println(e);
	 		 %>   <script> 
	 	      function respaldoNoRealizado() {
	 	         alert("No Se ha podido realizar el Cierre Semestral");
	 	         location.href="/TAG_LIBUES/index"; 
	 	      } 
	 	      respaldoNoRealizado(); 
	 	  </script> 
	 	  <%  } 
	 	%>
