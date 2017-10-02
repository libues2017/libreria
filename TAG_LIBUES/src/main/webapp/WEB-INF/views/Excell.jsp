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
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<% 


 /* 
HSSFWorkbook workbook=new HSSFWorkbook();
//Map<String, Object> model=(Map) request.getAttribute("model");
Map<String, Object> model=null;
List<Book> listBooks = (List<Book>) model.get("listBooks");
*/

// create a new Excel sheet
/*HSSFSheet sheet = workbook.createSheet("Java Books");
sheet.setDefaultColumnWidth(30);
 
// create style for header cells
CellStyle style = workbook.createCellStyle();
Font font = workbook.createFont();
font.setFontName("Arial");
style.setFillForegroundColor(HSSFColor.BLUE.index);
style.setFillPattern(CellStyle.SOLID_FOREGROUND);
font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
font.setColor(HSSFColor.WHITE.index);
style.setFont(font);*/
 
// create header row
/*

HSSFRow header = sheet.createRow(0);
 
header.createCell(0).setCellValue("Book Title");
header.getCell(0).setCellStyle(style);
 
header.createCell(1).setCellValue("Author");
header.getCell(1).setCellStyle(style);
 
header.createCell(2).setCellValue("ISBN");
header.getCell(2).setCellStyle(style);
 
header.createCell(3).setCellValue("Published Date");
header.getCell(3).setCellStyle(style);
 
header.createCell(4).setCellValue("Price");
header.getCell(4).setCellStyle(style);
 
// create data rows
int rowCount = 1;
*/
 
/*for (Book aBook : listBooks) {
    HSSFRow aRow = sheet.createRow(rowCount++);
    aRow.createCell(0).setCellValue(aBook.getTitle());
    aRow.createCell(1).setCellValue(aBook.getAuthor());
    aRow.createCell(2).setCellValue(aBook.getIsbn());
    aRow.createCell(3).setCellValue(aBook.getPublishedDate());
    aRow.createCell(4).setCellValue(aBook.getPrice());
}*/

    excell e=new excell();
   
///e.comparar();
   //e.escribirExcel();
   
   //e.leerExcel();
   
      String filename = "inventario.xls";
       
        List sheetData = new ArrayList();
       // List<String> sheetData = new Array.asList("ubicación","estante","codigo","cantidad");
        //ubicación 	estante	nivel	codigo	cantidad

             List<String> columnas = Arrays.asList("Apellido", "Prima");
        
        FileInputStream fis = null;

        try {

            
            fis = new FileInputStream(filename);         

            HSSFWorkbook workbook = new HSSFWorkbook(fis);         

            HSSFSheet sheet = workbook.getSheetAt(0);            
            
            Iterator rows = sheet.rowIterator();

            while (rows.hasNext()) {

                HSSFRow row = (HSSFRow) rows.next();                 

                Iterator cells = row.cellIterator();

                List data = new ArrayList();

                while (cells.hasNext()) {

                    HSSFCell cell = (HSSFCell) cells.next();

                //  System.out.println("Añadiendo Celda: " + cell.toString());

                    data.add(cell);

                }

                sheetData.add(data);

            }

        } catch (IOException ex) {

            ex.printStackTrace();

        } finally {

            if (fis != null) {

                fis.close();

            }

        }

   
      // e.showExelData(sheetData);      
      e.showExelData(sheetData);

  
%>


<html>
<body>
	<c:forEach items="${producto}" var="productos" >
					    		
 <%
          
			 /* HashMap<Integer, List<String>> map = new HashMap<>(); 
			 
			 List<Producto> list = new ArrayList<Producto>();
			
			java.util.Enumeration<String> reqEnum = request.getAttributeNames();
			
			while (reqEnum.hasMoreElements()) {
				String s = reqEnum.nextElement();
				String e1 = "101";
				//out.print(s);
				//out.println("==" + request.getAttribute(e1));
				
				 String elemento=(String)reqEnum.nextElement();
		            if(elemento.equals(e1)){
		            	out.println("==");
		                //break;
		            }
			}*/
			
			
		
		
		List addresses = (List)request.getAttribute("productos");
			
			
			
		 Iterator addressIter = addresses.iterator();
		 
		/* while (addressIter.hasNext()) {
			 
			out.println(addressIter.next());
			  
			 }*/
		 
		 int er=addresses.size();
		 int i=0;
		 //while(addressIter.hasNext()) {
			 while(i<2) {
			      Producto address = (Producto)addressIter.next();
			    // if( (null != address) && (null != address.getCodigoProducto()))  {
			    	
			    	out.println(address.getCodigoProducto());
			    	 out.println("\n");
			     
			     //}
			     
			     i++;
			     
			     }
		
			// out.println(er);
				
				
       %>
 
		
 </c:forEach>
 
      
       
</body>
</html>