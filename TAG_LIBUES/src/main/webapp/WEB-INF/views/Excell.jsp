<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
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

<%@ page import="java.util.Locale"%>
<%@ page import="java.io.*" %> 


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
String strNombreArchivo = "C:/libro1.xls";
File objFile = new File(strNombreArchivo);

   
            //Se crea el libro Excel   
            HSSFWorkbook wb = new HSSFWorkbook();   
  
            //Se crea una nueva hoja dentro del libro   
            HSSFSheet sheet = wb.createSheet("HojaEjemplo");   
  
            //Se crea una fila dentro de la hoja   
            HSSFRow row = sheet.createRow((short)0);   
  
            //Creamos celdas de varios tipos   
            row.createCell((short)0).setCellValue(1);   
            row.createCell((short)1).setCellValue(1.2);   
            row.createCell((short)2).setCellValue("ejemplo");   
            row.createCell((short)3).setCellValue(true);   
  
            //Creamos una celda de tipo fecha y la mostramos   
            //indicando un patr�n de formato   
            HSSFCellStyle cellStyle = wb.createCellStyle();   
            cellStyle.setDataFormat(   
                    HSSFDataFormat.getBuiltinFormat("d/m/yy h:mm"));   
  
            HSSFCell cell = row.createCell((short)4);   
            cell.setCellValue(new Date());   
            cell.setCellStyle(cellStyle);   
  
            //Escribimos los resultados a un fichero Excel   
            FileOutputStream fileOut = new FileOutputStream("ejemplo.xls");   
  
            wb.write(fileOut);   
            fileOut.close();   
       

%>