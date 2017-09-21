package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.Editorial;
import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.Proveedor;
import fia.ues.sv.libues.modelo.TipoProducto;

public interface ProductoService {
	
	Producto findByCodigoProducto(int codigoProducto);
	
	Producto findByNombreProducto(String nombreProducto);
	
	Producto findByconsignacion(String consignacion);
	
	void saveProducto(Producto producto);
	
	void updateProducto(Producto producto);
	
	void deleteByCodigoProducto(int codigoProducto);
	
	List<Producto> findAllProductos();
	
	List<Producto> customSearch(Area area, Editorial editorial, Proveedor proveedor, TipoProducto tipoproducto,  Busqueda busqueda);

	void updateprecioProducto(Integer codigoproducto, Double precio, Double costo, Integer existencia);

}