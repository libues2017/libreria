package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.DetalleCotizacion;

public interface DetalleCotizacionService {
	
	DetalleCotizacion findById(int numeroDetalle);
	
	DetalleCotizacion findByCodigo(int codigoCotizacion);
	
	DetalleCotizacion findByNombre(String nombreProducto);
	
	void saveDetalleCotizacion(DetalleCotizacion detalleCotizacion);
	
	void updateCotizacion(DetalleCotizacion detalleCotizacion);
	
	void deleteCotizacionById(int numeroDetalle);
	
	List<DetalleCotizacion> findAllCotizaciones();
	
	List<DetalleCotizacion> findCotizaciones(Integer codigo6);

}
