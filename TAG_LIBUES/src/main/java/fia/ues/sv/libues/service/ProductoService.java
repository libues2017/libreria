package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.Editorial;
import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.Proveedor;
import fia.ues.sv.libues.modelo.TipoProducto;
import fia.ues.sv.libues.modelo.Autor;

public interface ProductoService {
	
	Producto findByCodigoProducto(int codigoProducto);
	
	Producto findByNombreProducto(String nombreProducto);
	
	void saveProducto(Producto producto);
	
	void updateProducto(Producto producto);
	
	void deleteByCodigoProducto(int codigoProducto);
	
	List<Producto> findAllProductos();
	
	List<Producto> customSearch(Area area, Editorial editorial, Proveedor proveedor, TipoProducto tipoproducto, Autor autor, Busqueda busqueda);

	void updateprecioProducto(Integer codigoproducto, Double precio, Double costo, Integer existencia);
	
	void updateExistencia(String codigoproducto, Integer existencia, Integer sala);

	Producto findByCorrelativo(int correlativo);

	Producto findByCorrelativo(String correlativo);

	void updatePrecioProducto1(String codProducto, Double precio, Double costo, Integer existencia);

}