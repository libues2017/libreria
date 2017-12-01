package fia.ues.sv.libues.dao;

import java.util.List;

public interface DetalleCotizacion {
	
	DetalleCotizacion findById(int numeroDetalle);
	
	DetalleCotizacion findByCodigo(int codigoCotizacion);
	
	DetalleCotizacion findByNombre(String nombreProducto);
	
	void save(DetalleCotizacion detalleCotizacion);
	
	void deleteById(int numeroDetalle);
	
	List<DetalleCotizacion> findAllCotizaciones();
	
	List<DetalleCotizacion> findCotizaciones(Integer numeroDetalle);

}
