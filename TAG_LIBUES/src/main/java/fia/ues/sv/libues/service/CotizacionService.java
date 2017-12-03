package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import fia.ues.sv.libues.modelo.Cotizacion;

public interface CotizacionService {
	
	Cotizacion findById(int codigoCotizacion);
	
	void saveCotizacion(Cotizacion cotizacion);
	
	void updateCotizacion(Cotizacion cotizacion);
	
	void updateFechaCotizacion(Date fechaCotizacion, String nombreCliente, Integer codigoCotizacion, String telefono, String correo);
	
	void deleteCotizacionById(int codigoCotizacion);
	
	List<Cotizacion> findAllCotizaciones();
	
	void updateTotal(Integer codigoCotizacion, Double total);

}
