package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.Autor;
import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.Editorial;
import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.Proveedor;
import fia.ues.sv.libues.modelo.TipoProducto;

public interface ProductoDao {
	
	Producto findByCodigoProducto(int codigoProducto);
	
	Producto findByNombreProducto(String nombreProducto);
	
	void saveProducto(Producto producto);
	
	void deleteByCodigoProducto(int codigoProducto);
	
	List<Producto> findAllProductos();
	
	List<Producto> findAllByAutor(Autor autor);
	
	List<Producto> customSearch(Area area, Editorial editorial, Proveedor proveedor, TipoProducto tipoproducto, Autor autor, Busqueda busqueda);

	Producto findByCorrelativo(int codigoproducto);

	List<Producto> customSearchProducto(Producto producto1, Area area, Editorial editorial, Proveedor proveedor,
			TipoProducto tipoproducto, Autor autor, Busqueda busqueda);

}
