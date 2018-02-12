package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.FacturaDetalle;

public interface FacturaDetalleService {
	
	FacturaDetalle findById(int idfacturadetalle);
	
	FacturaDetalle findByCodigo(int codigofact);
	
	FacturaDetalle findByNombre(String nombreproducto);
	
	void saveFacturaDetalle(FacturaDetalle iddetalle);
	
	void updateFactura (FacturaDetalle facturadetalle);
	
	void deleteFacturaById(int iddetalle);
	
	void deleteFacturaByName(int idfact);
	
	List<FacturaDetalle> findAllFacturas();
	
	List<FacturaDetalle> findFacturas(Integer codigofact);

}
