package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.TipoProducto;

public interface TipoProductoService {
	
	TipoProducto findByCodTipoProducto(int codTipoProducto);
	
	TipoProducto findByTipoProducto(String tipoProducto);
	
	void saveTipoProducto(TipoProducto tipoProducto);
	
	void updateTipoProducto(TipoProducto tipoProducto);
	
	void deleteTipoProductoByCodTipoProducto(int codTipoProducto);
	
	List<TipoProducto> findAllTipoProductos();

}
