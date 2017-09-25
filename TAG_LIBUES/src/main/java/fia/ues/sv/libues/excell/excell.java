package fia.ues.sv.libues.excell;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;



import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


/*import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;*/

public class excell {
	
	
    private static final String FILE_NAME = "/tmp/MyFirstExcel.xlsx";
	
	 public static void escribirExcel()   
	    {   
	        try  
	        {   
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
	            //indicando un patrón de formato   
	            HSSFCellStyle cellStyle = wb.createCellStyle();   
	            cellStyle.setDataFormat(   
	                    HSSFDataFormat.getBuiltinFormat("d/m/yy h:mm"));   
	  
	            HSSFCell cell = row.createCell((short)4);   
	            cell.setCellValue(new Date());   
	            cell.setCellStyle(cellStyle);   
	  
	            //Escribimos los resultados a un fichero Excel   
	            FileOutputStream fileOut =   
	               // new FileOutputStream("ejemplo.xls");  
	            		new FileOutputStream("ejemplo.xls");
	  
	            wb.write(fileOut);   
	            fileOut.close();   
	        }   
	        catch(IOException e)   
	        {   
	            System.out.println("Error al escribir el fichero.");   
	        }   
	    }
	 
	 
	 
	 public static void leerExcel()   
	    {   
	        try  
	        {   
	            //Se abre el fichero Excel   
	           // POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream("c:ejemplo.xls"));   
	            POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream("c:inventario.xls"));  	
	  
	            //Se obtiene el libro Excel   
	            HSSFWorkbook wb = new HSSFWorkbook(fs);   
	  
	            //Se obtiene la primera hoja   
	            HSSFSheet sheet = wb.getSheetAt(0);   
	  
	            //Se obtiene la primera fila de la hoja   
	            HSSFRow row = sheet.getRow(0);   
	  
	            //Se leen las primeras 5 celdas   
	            for(int i=0; i<5; i++)   
	            {   
	                //Se obtiene la celda i-esima   
	                HSSFCell cell = row.getCell((short)i);   
	  
	                //Si la celda leida no está vacía   
	                if (cell != null)   
	                {   
	                    //Se imprime en pantalla la celda según su tipo   
	                    switch(cell.getCellType())   
	                    {   
	                        case HSSFCell.CELL_TYPE_NUMERIC:   
	                            System.out.println("Número: " + cell.getNumericCellValue());   
	                            break;   
	                       /* case HSSFCell.CELL_TYPE_STRING:   
	                            System.out.println("String: " + cell.getStringCellValue());   
	                            break;   
	                        case HSSFCell.CELL_TYPE_BOOLEAN:   
	                            System.out.println("Boolean: " + cell.getBooleanCellValue());   
	                            break;   
	                        default:   
	                            System.out.println("Default: " + cell.getDateCellValue());   
	                            break;   */
	                    }   
	                }   
	            }   
	        }   
	        catch(IOException ex)   
	        {   
	            System.out.println("Error al leer el fichero.");   
	        }   
	    } 
	 
	 
	 
	 public static void comparar()  {
		 
		 XSSFWorkbook workbook = new XSSFWorkbook();
	        XSSFSheet sheet = workbook.createSheet("Datatypes in Java");
	        Object[][] datatypes = {
	                {"Datatype", "Type", "Size(in bytes)"},
	                {"int", "Primitive", 2},
	                {"float", "Primitive", 4},
	                {"double", "Primitive", 8},
	                {"char", "Primitive", 1},
	                {"String", "Non-Primitive", "No fixed size"}
	        };

	        int rowNum = 0;
	        System.out.println("Creating excel");

	        for (Object[] datatype : datatypes) {
	            Row row = sheet.createRow(rowNum++);
	            int colNum = 0;
	            for (Object field : datatype) {
	                Cell cell = row.createCell(colNum++);
	                if (field instanceof String) {
	                    cell.setCellValue((String) field);
	                } else if (field instanceof Integer) {
	                    cell.setCellValue((Integer) field);
	                }
	            }
	        }

	        try {
	            FileOutputStream outputStream = new FileOutputStream(FILE_NAME);
	            workbook.write(outputStream);
	            workbook.close();
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        System.out.println("Done"); 
		 
		 
	 }
	 

}
