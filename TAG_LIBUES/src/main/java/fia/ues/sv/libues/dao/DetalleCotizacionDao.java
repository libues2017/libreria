package fia.ues.sv.libues.dao;

import java.util.List;

public interface DetalleCotizacionDao {
	
	DetalleCotizacionDao findById(int numeroDetalle);
	
	DetalleCotizacionDao findByCodigo(int codigoCotizacion);
	
	DetalleCotizacionDao findByNombre(String nombreProducto);
	
	void save(DetalleCotizacionDao detalleCotizacion);
	
	void deleteById(int numeroDetalle);
	
	List<DetalleCotizacionDao> findAllCotizaciones();
	
	List<DetalleCotizacionDao> findCotizaciones(Integer numeroDetalle);

}
