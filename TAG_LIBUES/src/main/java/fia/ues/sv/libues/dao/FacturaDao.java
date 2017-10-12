package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.Factura;

public interface FacturaDao {

	Factura findById(int idfactura);
	
	void save(Factura factura);
	
	void deleteById(int idfactura);
	
	List<Factura> findAllFacturas();
	
	List<Factura> findFacturas(Integer codigofac);
}
