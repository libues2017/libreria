package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import fia.ues.sv.libues.modelo.Cotizacion;

public interface CotizacionService {
	
	Cotizacion findById(int numeroCotizacion);
	
	void saveCotizacion(Cotizacion cotizacion);
	
	void updateCotizacion(Cotizacion cotizacion);
	
	void updateFechaCotizacion(Date fechaCotizacion, String nombreCliente, Integer numeroCotizacion, String telefono, String correo);
	
	void deleteCotizacionById(int numeroCotizacion);
	
	List<Cotizacion> findAllCotizaciones();
	
	void updateTotal(Integer numeroCotizacion, Double total);

}
