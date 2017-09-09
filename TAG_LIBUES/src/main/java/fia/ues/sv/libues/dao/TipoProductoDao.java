package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.TipoProducto;

public interface TipoProductoDao {
	
	TipoProducto findByCodTipoProducto(int codTipoProducto);
	
	TipoProducto findByTipoProducto(String tipoProducto);
	
	void save(TipoProducto tipoProducto);
	
	void deleteByCodTipoProducto(int codTipoProducto);
	
	List<TipoProducto> findAllTipoProductos();

}
