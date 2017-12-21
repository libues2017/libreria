package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.DetalleCotizacionDao;
import fia.ues.sv.libues.modelo.DetalleCotizacion;

@Service("detallecotizacionService")
@Transactional
public class DetalleCotizacionServiceImpl implements DetalleCotizacionService{
	
	@Autowired
	private DetalleCotizacionDao dao;

	@Override
	public DetalleCotizacion findById(int numeroDetalle) {
		return dao.findById(numeroDetalle);
	}

	@Override
	public DetalleCotizacion findByCodigo(int codigoCotizacion) {
		return dao.findByCodigo(codigoCotizacion);
	}

	@Override
	public DetalleCotizacion findByNombre(String nombreProducto) {
		return dao.findByNombre(nombreProducto);
	}

	@Override
	public void saveDetalleCotizacion(DetalleCotizacion detalleCotizacion) {
		dao.save(detalleCotizacion);
		
	}

	@Override
	public void updateCotizacion(DetalleCotizacion detalleCotizacion) {
		DetalleCotizacion entity = dao.findById(detalleCotizacion.getCodigoCotizacion());
		if(entity != null){
			entity.setCodigoProducto(detalleCotizacion.getCodigoProducto());
			entity.setNombreProducto(detalleCotizacion.getNombreProducto());
			entity.setCantidad(detalleCotizacion.getCantidad());
			entity.setValorUnitario(detalleCotizacion.getValorUnitario());
			//entity.setValorTotal(detalleCotizacion.getValorTotal());
		}
		
	}

	@Override
	public void deleteCotizacionById(int numeroDetalle) {
		dao.deleteById(numeroDetalle);
		
	}

	@Override
	public List<DetalleCotizacion> findAllCotizaciones() {	
		return dao.findAllCotizaciones();
	}

	@Override
	public List<DetalleCotizacion> findCotizaciones(Integer codigo6) {
		return dao.findCotizaciones(codigo6);
	}

}
