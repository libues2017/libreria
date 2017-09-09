package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.Autor;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.Editorial;
import fia.ues.sv.libues.modelo.Area;

public interface ProductoService {
	
	Producto findByCodigoProducto(int codigoProducto);
	
	Producto findByNombreProducto(String nombreProducto);
	
	void saveProducto(Producto producto);
	
	void updateProducto(Producto producto);
	
	void deleteByCodigoProducto(int codigoProducto);
	
	List<Producto> findAllProductos();
	
	List<Producto> customSearch(Area area, Editorial editorial, Autor autor, Busqueda busqueda);

	void updateprecioProducto(Integer codigoproducto, Double precio, Double costo, Integer existencia);

}