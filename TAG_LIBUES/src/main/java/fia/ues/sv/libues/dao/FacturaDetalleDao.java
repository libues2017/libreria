package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.FacturaDetalle;

public interface FacturaDetalleDao {
	
	FacturaDetalle findById(int idfacturadetalle);
	
	FacturaDetalle findByCodigo(int codigofactura);
	
	FacturaDetalle findByName(String nombreproducto);
	
	void save(FacturaDetalle facturadetalle);
	
	void deleteById(int idfacturadetalle);
	
	List<FacturaDetalle> findAllFacturas();
	
	List<FacturaDetalle> findFacturas(Integer idfacturadetalle);

	void deleteByName(int idfact);

}
