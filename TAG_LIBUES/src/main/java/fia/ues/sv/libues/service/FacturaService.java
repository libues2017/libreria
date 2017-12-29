package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import fia.ues.sv.libues.modelo.Factura;

public interface FacturaService {
	
	Factura findById(int idfactura);
	
	void saveFactura(Factura factura);
	
	void updateFactura (Factura factura);
	
	void updateFacturaDatos (Integer idfactura, Date fecha, Integer numerofact, String cliente, String direccion, String documento, String tipocredito);
	
	void updateFacturaDatos2(Integer idfactura, Double total, String tipo);

	void updateNumeroFactura(Integer idfactura, Integer numerofactura);
	
	void deleteFacturaById(int idfactura);
	
	List<Factura> findAllFacturas();

	void updateEstadoFacturaById(Integer idfactura);

	void updateFacturaDatos3(Integer codigofact, String documento, String tipocredito);

}
