package fia.ues.sv.libues.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.DetalleCotizacion;

@Repository("detallecotizacionDao")
public class DetalleCotizacionImpl extends AbstractDao<Integer, DetalleCotizacion> implements DetalleCotizacionDao{

	@Override
	public DetalleCotizacion findById(int numeroDetalle) {
		DetalleCotizacion detalleCotizacion = getByKey(numeroDetalle);
		return detalleCotizacion;
	}

	@Override
	public DetalleCotizacion findByCodigo(int codigoCotizacion) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DetalleCotizacion findByNombre(String nombreProducto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(DetalleCotizacionDao detalleCotizacion) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(int numeroDetalle) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<DetalleCotizacion> findAllCotizaciones() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DetalleCotizacion> findCotizaciones(Integer numeroDetalle) {
		// TODO Auto-generated method stub
		return null;
	}

}
