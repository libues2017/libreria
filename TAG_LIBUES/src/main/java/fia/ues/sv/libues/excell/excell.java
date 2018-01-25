package fia.ues.sv.libues.excell;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;



import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;

import fia.ues.sv.libues.modelo.Etiqueta;
import fia.ues.sv.libues.modelo.Producto;




public class excell {
	
	
    private static final String FILE_NAME = "/tmp/MyFirstExcel.xlsx";
    
    
    
    public void Escribirtxt(String nombre,List producto,List etiqueta){
    	
    File f;
    FileWriter w;
    BufferedWriter bw;	
    PrintWriter wr;
    
   // List<Etiqueta> etiquetas = etiquetaService.findAllEtiquetas();
    
    Iterator<Producto> productoIter = producto.iterator();
    Iterator<Etiqueta> etiquetaIter = etiqueta.iterator();
	  
	 int correlativo=0;
	 int i=0;
	 String nombreProducto="";
	 Double precioproducto=0.0;
	 String convertprecio="";
	 String autor="";
    
    
    try{
    	
    	   	
    	f=new File(nombre);
    	w=new FileWriter(f);
    	bw=new BufferedWriter(w);
    	wr=new PrintWriter(bw);
    	
    	
 /*while(productoIter.hasNext()) {
       		 
       		 Producto product =  productoIter.next();
 		       correlativo=product.getCorrelativo(); // datos de la base
 		       nombreProducto=product.getNombreProducto();
 		       precioproducto=product.getPrecio();
 		       autor=product.getAutores().toString();
 		       
 		       //*3673003*,TAZA TERMICA,3.90,,3.90,3673003
 		       //*-      *,,0.00,,0.00,-
 		       
 		       convertprecio="*"+correlativo+"*"+","+nombreProducto+","+precioproducto+","+autor+","+precioproducto+","+correlativo;
 		      
 		       for(int j=0;j<4;j++){
 		    	  wr.write(convertprecio);
 	 		    	bw.newLine();
 		    	   
 		       }
 		       
 		       
 		      for(int j=0;j<2;j++){
 		    	  wr.write("*-      *,,0.00,,0.00,-");
 	 		    	bw.newLine();
 		    	   
 		       }
 		      
 		    	//wr.append("\nes la segunda linea");
 		    
 		  i=i+1;
       		 
       	 }
    	
    	*/
    	
    	
    	
    	while(etiquetaIter.hasNext()) {
      		 
      		 Etiqueta etiquet =  etiquetaIter.next();
		       correlativo=etiquet.getCodigoproducto(); // datos de la base
		       nombreProducto=etiquet.getNombreProducto();
		       precioproducto=etiquet.getPrecioproducto();
		       autor=etiquet.getAutor_marca();
		       
		       //*3673003*,TAZA TERMICA,3.90,,3.90,3673003
		       //*-      *,,0.00,,0.00,-
		       
		       convertprecio="*"+correlativo+"*"+","+nombreProducto+","+precioproducto+","+autor+","+precioproducto+","+correlativo;
		      
		       for(int j=0;j<etiquet.getCantidad();j++){
		    	   
		    	   for(int k=0;k<4;k++){
		 		    	  wr.write(convertprecio);
		 	 		    	bw.newLine();
		 		    	   
		 		       }
		 		       
		    	   for(int t=0;t<2;t++){
				    	  wr.write("*-      *,,0.00,,0.00,-");
			 		    	bw.newLine();
				    	   
				       }
		    	   
		    	 // wr.write(convertprecio);
	 		    //	bw.newLine();
		    	   
		       }
		       
		       
		      /*for(int j=0;j<2;j++){
		    	  wr.write("*-      *,,0.00,,0.00,-");
	 		    	bw.newLine();
		    	   
		       }*/
		      
		    	//wr.append("\nes la segunda linea");
		    
		  i=i+1;
      		 
      	 }
   	
   	
    	
    	
    	/*wr.write("Esta es la primera linea");
    	bw.newLine();
    	wr.append("\nes la segunda linea");*/
    	wr.close();
    	bw.close();
    	
    }
    catch(Exception e){}
    
    
    }
	
    public static void crearEtiquetas(List producto)   
    {   
	 
        try  
        {   
        	
        	 Iterator<Producto> productoIter = producto.iterator();
        	 
        	 int correlativo=0;
        	 int i=0;
        	 String nombreProducto="";
        	
            //Se crea el libro Excel   
            HSSFWorkbook wb = new HSSFWorkbook();   
            //Se crea una nueva hoja dentro del libro   
            HSSFSheet sheet = wb.createSheet("Etiquetas");
            
            //Se crea una fila dentro de la hoja   
            HSSFCellStyle style =wb.createCellStyle(); 
          /*  HSSFRow row = sheet.createRow((short)0);  
            //Creamos celdas de varios tipos            
            
            row.createCell((short)0).setCellValue(1);   
            row.createCell((short)1).setCellValue(1.2);   
            row.createCell((short)2).setCellValue("ejemplo");   
            row.createCell((short)3).setCellValue(true);   */
  
            while(productoIter.hasNext()) {
       		 
       		 Producto product =  productoIter.next();
 		       correlativo=product.getCorrelativo(); // datos de la base
 		       nombreProducto=product.getNombreProducto();
 		       
 		     //System.out.print("\n El producto con codigo------------------------------------------ " +g);
 		    HSSFRow row1 = sheet.createRow((short)i);
 		   row1.createCell((short)0).setCellValue(correlativo);
 		  row1.createCell((short)1).setCellValue(nombreProducto);   
 		  //row1.createCell((short)1).setCellStyle(style);
 		  i=i+1;
       		 
       	 }
       	 
            
            
            //Creamos una celda de tipo fecha y la mostramos   
            //indicando un patrón de formato   
            HSSFCellStyle cellStyle = wb.createCellStyle();   
            cellStyle.setDataFormat(   
                    HSSFDataFormat.getBuiltinFormat("d/m/yy h:mm"));   
  
           /* HSSFCell cell = row.createCell((short)4);   
            cell.setCellValue(new Date());   
            cell.setCellStyle(cellStyle);   */
  
            //Escribimos los resultados a un fichero Excel   
            FileOutputStream fileOut =   
               // new FileOutputStream("ejemplo.xls");  
            		new FileOutputStream("Etiquetas.xls");
  
            wb.write(fileOut);   
            fileOut.close();   
        }   
        catch(IOException e)   
        {   
            System.out.println("----------------------------------Error al escribir el fichero.");   
        }   
    }
    
    
    /////////////////////////////////
 
    public List compararretorna(List sheetData,List sheetData1,List addresses,List addresses1,String sala,String bodega) {
		 
        // 
        // Iterates the data and print it out to the console. 
        //
		 
		 List sheetDataextraer = new ArrayList();
		 List sheetDatamostrar = new ArrayList();		 
		 List<Producto> sheetDatamostrar1 = new ArrayList();		
		 List<List> listaEmpresa = new ArrayList<List>();		 
		 for(int i =0; i<= 6; i++){
	            listaEmpresa.add(new ArrayList());//crea 5 sublistas	          
	        }		 
		 
		 Iterator<Producto> addressIter = addresses.iterator();
		 Iterator<Producto> addressItersala = addresses1.iterator();	 
		 		 
		 int d=0;
         int h=0;
         int cantidad=0;
         int cantidadbase=0;
         int cantidadsala=0;
         int g=0;
         int estante=0;
         int nivel=0;
         String nombre="";
         int contador=0;
         int diferencia=0;                  
         
         while(addressItersala.hasNext()) {
		       Producto address =  addressItersala.next();
		       g=address.getCorrelativo(); // datos de la base
		       cantidadbase=address.getSala();// existencia o sala 
		       nombre=address.getNombreProducto();		       

           for (int i = 0; i < sheetData.size(); i++) {	
	     	// h=sheetData.size();	     	 
	          List list = (List) sheetData.get(i);       	          
	        //  getSheetName(0);
	          
	         // for (int j = 4; j < list.size(); j++) {///se utiliza para ir columna por columna 
	            //  Cell cell = (Cell) list.get(j);
	             Cell celle = (Cell) list.get(1);//estante
	             Cell celln = (Cell) list.get(2);//nivel
	         	 Cell cell = (Cell) list.get(3);//aqui tomamos la columan donde va el codigo
	         	 Cell cell1 = (Cell) list.get(4);//aqui se toma la cantidad del excell
	
	              if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
	             	 
	             	  d=(int) cell.getNumericCellValue();   //datos de excell
	             	  cantidad=(int) cell1.getNumericCellValue();
	             	  estante=(int) celle.getNumericCellValue();
	             	  nivel=(int) celln.getNumericCellValue();
	      			       			  
	      			     }                     
	             	                 	 
		                    //System.out.print((int)cell.getNumericCellValue());  
	    			    //System.out.print("\n");
	             // } 
	              	            
	             	 if(d==g  && cantidad!=cantidadsala){
	             // if(d==g ){
				    	
				    	//System.out.print("El producto con codigo "+d +" concuerda con el inventario teorico \n");
	             			//System.out.print("El producto con codigo "+g +"No concuerda con el inventario teorico con el codigo  "+ sala+  " \n"); 
	             			
	             		 sheetDataextraer.add(g);//codigo
	             		 sheetDataextraer.add(nombre); //nombre
	             		 sheetDataextraer.add(cantidadbase);//cantidad teorica
	             		sheetDataextraer.add(cantidad);//cantidad fisica             		 
	             		 sheetDataextraer.add(estante);//estante
	             		 sheetDataextraer.add(nivel);//nivel
	             		 sheetDataextraer.add(sala);//ubicacion
	             		 
	             		 diferencia=cantidad-cantidadsala;
	             		 
	             		 
	             		 if(diferencia<-1)	             		 
	             		 {
	             			 
	             			 diferencia=diferencia*-1;
	             		 }
	             		 
	             		listaEmpresa.get(contador).add(g);//codigo
	             		listaEmpresa.get(contador).add(nombre);//nombre
	             		listaEmpresa.get(contador).add(cantidadbase);//cantidad teorica
	             		listaEmpresa.get(contador).add(cantidad);//cantidad fisica
	             		listaEmpresa.get(contador).add(estante);//estante
	             		listaEmpresa.get(contador).add(nivel);//nivel
	             		listaEmpresa.get(contador).add(sala);//ubicacion
	             		
	             		contador=contador+1;
	             		 
	             		 sheetDatamostrar.add(sheetDataextraer) ;
				    	 
				      }
	              
	              else
	              {
	             	 
	            	 // System.out.print("El producto con codigo "+d +" concuerda con el inventario teorico \n");
	              }
	              
	          }   
	      
      
              
      }//fin sala
		 
		 
		 while(addressIter.hasNext()) {
		      Producto address =  addressIter.next();
		       g=address.getCorrelativo(); // datos de la base
		       cantidadbase=address.getExistencia();// existencia o sala 
		       cantidadsala=address.getSala();// existencia o sala 
		       nombre=address.getNombreProducto();
		       

	        for (int i = 0; i < sheetData1.size(); i++) {		       	       	 
	            List list = (List) sheetData1.get(i);	            
	          //  getSheetName(0);
	            
	           // for (int j = 4; j < list.size(); j++) {///se utiliza para ir columna por columna 
	              //  Cell cell = (Cell) list.get(j);
		            Cell celle = (Cell) list.get(1);//estante
		            Cell celln = (Cell) list.get(2);//nivel
		           	Cell cell = (Cell) list.get(3);//aqui tomamos la columan donde va el codigo
		           	Cell cell1 = (Cell) list.get(4);//aqui se toma la cantidad del excell
		
	                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
	               	 
	               	  d=(int) cell.getNumericCellValue();   //datos de excell
	               	  cantidad=(int) cell1.getNumericCellValue();
	               	  estante=(int) celle.getNumericCellValue();
	               	  nivel=(int) celln.getNumericCellValue();	        			       			  
	        			     }                     
	               	                 	 
		                    //System.out.print((int)cell.getNumericCellValue());  
	      			    //System.out.print("\n");
	               // } 
	                
	              //  if(d==g && cantidad==cantidadbase){
	               	 if(d==g  && cantidad!=cantidadbase){
	 			    	
	 			    	//System.out.print("El producto con codigo "+d +" concuerda con el inventario teorico \n");
	               			//System.out.print("El producto con codigo "+g +"No concuerda con el inventario teorico con el codigo  "+ d+  " \n"); 
	               			
		               		 sheetDataextraer.add(d);//codigo
		               		 sheetDataextraer.add(nombre); //nombre
		               		 sheetDataextraer.add(cantidadbase);//cantidad teorica
		               		sheetDataextraer.add(cantidad);//cantidad fisica
		               		 sheetDataextraer.add(estante);//estante
		               		 sheetDataextraer.add(nivel);//nivel
		               		 sheetDataextraer.add(bodega);//ubicacion
		               		 
		               		 
		               		
		               		 
		               		    listaEmpresa.get(contador).add(g);//codigo
			             		listaEmpresa.get(contador).add(nombre);//nombre
			             		listaEmpresa.get(contador).add(cantidadbase);//cantidad teorica
			            		listaEmpresa.get(contador).add(cantidad);//cantidad fisica
			             		listaEmpresa.get(contador).add(estante);//estante
			             		listaEmpresa.get(contador).add(nivel);//nivel			             		
		             		    listaEmpresa.get(contador).add(bodega);//ubicacion
		             		
		             		contador=contador+1;	
		               		 sheetDatamostrar.add(sheetDataextraer) ;
	 			      }
	                
	                else
	                {
	               	 
	                	//System.out.print("El producto con codigo "+g +"No concuerda con el inventario teorico con el codigo  "+ d+  " \n"); 
	                }
	               	 
	            }         
	                
        }//fin bodega         
				 
		//return sheetDatamostrar;         
		 return listaEmpresa;

    }

	
		 
    
    
  ///////////////////////////////////////////////  
    
    
    
    
    
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
		 
		 
		 int []f = null;
		 
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
	            /*    if (cell != null)   
	                {   
	                    //Se imprime en pantalla la celda según su tipo   
	                    switch(cell.getCellType())   
	                    {   
	                        case HSSFCell.CELL_TYPE_NUMERIC:   
	                            System.out.println("Número: " + cell.getNumericCellValue());   
	                            break;   
	                        case HSSFCell.CELL_TYPE_STRING:   
	                            System.out.println("String: " + cell.getStringCellValue());   
	                            break;   
	                        case HSSFCell.CELL_TYPE_BOOLEAN:   
	                            System.out.println("Boolean: " + cell.getBooleanCellValue());   
	                            break;   
	                        default:   
	                            System.out.println("Default: " + cell.getDateCellValue());   
	                            break;   
	                    }   
	                }  */
	                
	                
	                
	                if (cell != null)   
	                {   
	                	
	                	
	                	f[i]=Cell.CELL_TYPE_NUMERIC;
	                    //Se imprime en pantalla la celda según su tipo   
	                	
	                	 
	                	// f[i]=(int) cell.getNumericCellValue();
	                	
	                   
	                          //  System.out.println("Número: " + cell.getNumericCellValue());   
	              // System.out.println("Número: " + f[i]);  
	                	
	                	 if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
	                		 
	                		                     System.out.print(cell.getNumericCellValue());
	                		
	                		                 }
	                             
	                       
	                      
	                }
	                
	                
	                
	            }   
	        }   
	        catch(IOException ex)   
	        {   
	            System.out.println("Error al leer el fichero.");   
	        }   
	    } 
	 
	 
	 
	 public static void revisar()  {
		 
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
	 
	 
	 
	 public static void showExelData(List sheetData) {
		 
		         //
		 
		         // Iterates the data and print it out to the console.
		 
		         //
		 
		         for (int i = 0; i < sheetData.size(); i++) {
		 
		             List list = (List) sheetData.get(i);
		 
		             for (int j = 4; j < list.size(); j++) {
		 
		               //  Cell cell = (Cell) list.get(j);
		            	 Cell cell = (Cell) list.get(3);//aqui tomamos la columan donde va el codigo
		 
		                 if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
		                	 
		                	 int d=(int) cell.getNumericCellValue();
		                	 
		                     
		                    // System.out.print(cell.getNumericCellValue());
		                     
		                     System.out.print(d);
		 
		                 } else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
		 
		                     System.out.print(cell.getRichStringCellValue());
		 
		                 } else if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
		 
		                     System.out.print(cell.getBooleanCellValue());
		 
		                 }
		 
		                 if (j < list.size() - 1) {
	
		                     System.out.print(", ");
		 
		                 }
		 
		             }
		
		             System.out.println("");
		             //System.out.println(list.size());
		 
		         }
		         
		         
		 
		     }
		 
		 
	 
	
	public static  void comparar(List sheetData,List sheetData1,List addresses,String sala,String bodega) {
		 
         // 
         // Iterates the data and print it out to the console. 
         //
		 
		 List sheetDataextraer = new ArrayList();
		 
		
		 
		 Iterator<Producto> addressIter = addresses.iterator();
		  int d=0;
          int h=0;
          int cantidad=0;
          int cantidadbase=0;
          int g=0;
		 
		 while(addressIter.hasNext()) {
		      Producto address =  addressIter.next();
		       g=address.getCorrelativo(); // datos de la base
		       cantidadbase=address.getExistencia();// existencia o sala 
 
         for (int i = 0; i < sheetData.size(); i++) {
 
        	 h=sheetData.size();
        	 
             List list = (List) sheetData.get(i);
          
             
           //  getSheetName(0);
             
            // for (int j = 4; j < list.size(); j++) {///se utiliza para ir columna por columna 
               //  Cell cell = (Cell) list.get(j);
            	 Cell cell = (Cell) list.get(3);//aqui tomamos la columan donde va el codigo
            	 Cell cell1 = (Cell) list.get(4);//aqui se toma la cantidad del excell
 
                 if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                	 
                	  d=(int) cell.getNumericCellValue();   //datos de excell
                	 // cantidad=(int) cell1.getNumericCellValue();
         			       			  
         			     }                     
                	                 	 
	                    //System.out.print((int)cell.getNumericCellValue());  
       			    //System.out.print("\n");
                // } 
                 
               //  if(d==g && cantidad==cantidadbase){
                	 if(d==g){
  			    	
  			    	//System.out.print("El producto con codigo "+d +" concuerda con el inventario teorico \n");
                			System.out.print("El producto con codigo "+g +" concuerda con el inventario teorico con el codigo  "+ d+  " \n"); 
                			
                			  
  			    	 
  			      }
                 
                 else
                 {
                	 
                		//System.out.print("El producto con codigo "+g +" no concuerda con el inventario teorico con el codigo  "+ d+  " \n"); 
                	 
                	 sheetDataextraer.add(d);
                	 
                	// System.out.print("No concuerdan \n"); 
                 }
                 
               //  System.out.println(d);
                 
             }

            // System.out.println("");
           
           
           //  h=h+1;                         
             
			      
         }         
         
 
     }
 
	
	
	
	
		 
	 

}
