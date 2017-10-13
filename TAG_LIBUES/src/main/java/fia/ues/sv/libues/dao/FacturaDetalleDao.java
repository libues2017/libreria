package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.FacturaDetalle;

public interface FacturaDetalleDao {
	
	FacturaDetalle findById(int iddetalle);
	
	FacturaDetalle findByCodigo(int codigofactura);
	
	FacturaDetalle findByName(String nombreproducto);
	
	void save(FacturaDetalle facturadetalle);
	
	void deleteById(int iddetalle);
	
	List<FacturaDetalle> findAllFacturas();
	
	List<FacturaDetalle> findFacturas(Integer iddetalle);

}
