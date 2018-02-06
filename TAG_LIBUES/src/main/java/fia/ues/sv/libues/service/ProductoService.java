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

	void updateprecioProducto(Integer codigoproducto, Double precio, Double costo, Integer existencia,Integer cantidadetiquetar,Integer marcado);
	
	void updateExistencia(Integer codigoproducto, Integer existencia, Integer sala);	

	Producto findByCorrelativo(int correlativo);

	void updatePrecioProducto1(Integer codProducto, Double precio, Double costo, Integer existencia);

	void updateExistencia1(Integer codProducto, Integer existencia,String Ubicacion);
	
	void updateSalaVenta1(Integer codigoproducto, Integer sala);

	void updateReserva(Integer codigo, Integer sala);

	void updateReservaRestaurar(Integer cod, Integer sala);

	List<Producto> customSearchProducto(Producto producto, Area area, Editorial editorial, Proveedor proveedor,
			TipoProducto tipoproducto, Autor autor, Busqueda busqueda);

	void updatedesmarcarProducto(Integer codigoproducto,Integer cantidadetiquetar, Integer marcado);

	void updateSala(Integer codProducto, Integer existencia);

	


}