package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.Cotizacion;

public interface CotizacionDao {
	
	Cotizacion findById(int codigoCotizacion);
	
	void save(Cotizacion cotizacion);
	
	void deleteById(int codigoCotizacion);
	
	List<Cotizacion> findAllCotizaciones();
	
	List<Cotizacion> findCotizaciones(Integer codigo6);

}
