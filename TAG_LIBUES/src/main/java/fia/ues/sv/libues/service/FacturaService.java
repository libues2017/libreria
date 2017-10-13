package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import fia.ues.sv.libues.modelo.Factura;

public interface FacturaService {
	
	Factura findById(int idfactura);
	
	void saveFactura(Factura factura);
	
	void updateFactura (Factura factura);
	
	void updateFacturaDatos (Integer idfactura, Date fecha, Integer numerofact, Double total, String tipo);
	
	void deleteFacturaById(int idfactura);
	
	List<Factura> findAllFacturas();

}
