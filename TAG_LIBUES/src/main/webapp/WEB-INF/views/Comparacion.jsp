<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
   
      <%@ page import="java.util.List"%> 
        <%@ page import="java.util.Map"%> 
          <%@ page import="fia.ues.sv.libues.modelo.Book"%> 
    
     <%@ page import="javax.servlet.http.HttpServletRequest"%> 
  <%@ page import="javax.servlet.http.HttpServletResponse"%>  
<%@ page import="org.apache.poi.hssf.usermodel.HSSFFont"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.util.HSSFColor"%>


<%@ page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@ page import="org.apache.poi.ss.usermodel.Font"%>
<%@ page import="org.springframework.web.servlet.view.document.AbstractExcelView"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFDataFormat"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page import="java.util.Date"%>
<%@ page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRichTextString"%>
<%@ page import="fia.ues.sv.libues.excell.excell"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.io.*" %> 
<%@ page import="fia.ues.sv.libues.modelo.Producto" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comparacion de Inventario</title>
     <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>    
	<link href="<c:url value='/static/css/estilo2.css' />" rel="stylesheet"></link>
</head>
<body>
</body>
</html>

<% 
    excell e=new excell();
   
///e.comparar();
   //e.escribirExcel();
   
   //e.leerExcel();
   
      String filename = "inventario.xls";
      String  salahoja="";
      String  bodegahoja="";
       
        List sheetData = new ArrayList();
        List sheetData1 = new ArrayList();
        
       // List<String> sheetData = new Array.asList("ubicaci�n","estante","codigo","cantidad");
        //ubicaci�n 	estante	nivel	codigo	cantidad

             List<String> columnas = Arrays.asList("Apellido", "Prima");
        
        FileInputStream fis = null;

        try {

            
            fis = new FileInputStream(filename);         

            HSSFWorkbook workbook = new HSSFWorkbook(fis);         

            HSSFSheet sala = workbook.getSheetAt(0); 
            HSSFSheet bodega = workbook.getSheetAt(1);
            
            
            salahoja= workbook.getSheetName(0);//Toma la primera hoja sala
            bodegahoja= workbook.getSheetName(1);//Toma la primera hoja bodega
            
            Iterator rows = sala.rowIterator();
            Iterator rows1 = bodega.rowIterator();

            while (rows.hasNext()) {

                HSSFRow row = (HSSFRow) rows.next();                 

                Iterator cells = row.cellIterator();

                List data = new ArrayList();

                while (cells.hasNext()) {

                    HSSFCell cell = (HSSFCell) cells.next();

                //  System.out.println("A�adiendo Celda: " + cell.toString());

                    data.add(cell);

                }

                sheetData.add(data);

            }
            
            while (rows1.hasNext()) {

                HSSFRow row = (HSSFRow) rows1.next();                 

                Iterator cells = row.cellIterator();

                List data = new ArrayList();

                while (cells.hasNext()) {

                    HSSFCell cell = (HSSFCell) cells.next();

                //  System.out.println("A�adiendo Celda: " + cell.toString());

                    data.add(cell);

                }

                sheetData1.add(data);

            }

        } catch (IOException ex) {

            ex.printStackTrace();

        } finally {

            if (fis != null) {

                fis.close();

            }
        }

   
      // e.showExelData(sheetData);      
    //  e.showExelData(sheetData);
    
    ///out.println(nombrehoja);

  
%>


<html>
<body>

<div class="row"><%@include file="page_head.jsp" %></div>
<div class="container">


 <div class="panel-heading"><span class="lead">Productos que no concuerda con el Inventario Fisico</span></div>

<div class="row">
<!--<h1>Areas</h1>-->
<sec:authorize access="hasRole('ADMINISTRADOR')">
            <div class="well">
               
                <a href="<c:url value='/index' />"> Regresar</a>
            </div>
        </sec:authorize>

	<c:forEach items="${producto}" var="productos"  begin = "1" end = "1">
	
	
					    		
 <%
      
		List addresses = (List)request.getAttribute("productos");
        List addressessala = addresses;
 
        List addresses1 = e.compararretorna(sheetData,sheetData1, addresses,addressessala,salahoja,bodegahoja);
        
        Comparator<Integer> comparador = Collections.reverseOrder();
        Collections.sort(addresses1, comparador);
       // Collections.sort(addresses1);
        //out.println(addresses1.size());        
         
             //e.comparar(sheetData,sheetData1, addresses,salahoja,bodegahoja);			
			
		// Iterator<Producto> addressIter = addresses.iterator();
		 		 	
		//  e.comparar(sheetData, addressIter);
	
			/*while(addressIter.hasNext()) {
			      Producto address = addressIter.next();			    			    	
			    	out.println(address.getCorrelativo());
			    	 out.println("<br/>");
			    	 
			     }
			 */
			 
			
		/*	int j=1;		
			
			 for (int i = 0; i < addresses1.size(); i++) {
				 List list = (List) addresses1.get(i);
		           // List list = (List) addresses1.get(i);
		           //int h=Integer.parseInt(addresses1.get(i).toString());
		           out.println(j+" El producto " +list.get(i)+" que se encuentra ubicado en  "+list.get(i+4) +" " + " No concuerdan con el inventario teorico" );
			    	 out.println("<br/>");
			    	 j=j+1;
		          
			 }*/
	
				
       %>
 
 
   <table class="table table-striped ">
				<thead>
		    		<tr >		    			
			      			<th>Codigo Producto</th>
			      			<th>Nombre del Producto</th>	      			
			      			<th>Cantidad Producto en Inventario Teorico</th>
			      			<th>Cantidad Producto en Inventario Fisico</th>
			      			<th>Diferencias Productos </th>
			      			<th>Estante</th>
			      			<th>Nivel</th>
			      			<th>Ubicacion</th>
			      			<th>Ajuste de Inventario</th>	
		    		</tr>
		    	</thead>
		    	<tbody>
		    	       <c:set var="contador" value="${0}" />
				    	<c:forEach items="<%=addresses1%>" var="i"  >
				    	 <c:if test = "${i[0] > 0}">
			                <c:set var="contador" value="${contador + 1}" />	
				    		<tr >				    		
				    	
				    			<td>${i[0]}</td>
				    			<td>${i[1]}</td>
				    	  		<td>${i[2]}</td>
				    	  		<td>${i[3]}</td>
				    	  		<td>${i[3]-i[2]}</td>
				    	  		<td>${i[4]}</td>	
				    	  		<td>${i[5]}</td>
				    	  		<td>${i[6]}</td>
				    	  		 <td><a href="<c:url value='/edit-comparacion-${i[0]}-${i[6]}-${i[3]}' />" class="btn btn-danger custom-width">Ajuste</a></td>
                      
				    	
                        </tr>
                        
                         </c:if>
                        
				    	 </c:forEach>
				    	  <div>Cantidad de Productos que difiere el inventario fisico y teorico</div>
				    	 <div>${contador}</div>
				  	 
		    	</tbody>
	    </table>       
 
 
   </c:forEach>
    
 </div>
 
            
       
</body>
</html>