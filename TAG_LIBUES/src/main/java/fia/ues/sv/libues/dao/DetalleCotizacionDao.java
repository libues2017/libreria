package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.DetalleCotizacion;

public interface DetalleCotizacionDao {
	
	DetalleCotizacion findById(int numeroDetalle);
	
	DetalleCotizacion findByCodigo(int codigoCotizacion);
	
	DetalleCotizacion findByNombre(String nombreProducto);
	
	void save(DetalleCotizacion detalleCotizacion);
	
	void deleteById(int numeroDetalle);
	
	List<DetalleCotizacion> findAllCotizaciones();
	
	List<DetalleCotizacion> findCotizaciones(Integer codigo6);

}
