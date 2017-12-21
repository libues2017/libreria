package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.CotizacionDao;
import fia.ues.sv.libues.modelo.Cotizacion;

@Service("cotizacionService")
@Transactional
public class CotizacionServiceImpl implements CotizacionService{

	@Autowired
	private CotizacionDao dao;
	
	@Override
	public Cotizacion findById(int codigoCotizacion) {
		return dao.findById(codigoCotizacion);
	}

	@Override
	public void saveCotizacion(Cotizacion cotizacion) {
		dao.save(cotizacion);
		
	}

	@Override
	public void updateCotizacion(Cotizacion cotizacion) {
		Cotizacion entity = dao.findById(cotizacion.getCodigoCotizacion());//getNumeroCotizacion());
		if(entity != null){
			
		}
		
	}
	
	@Override
	public void updateFechaCotizacion(Date fechaCotizacion, String nombreCliente, Integer codigoCotizacion,
			String telefono, String correo) {
		Cotizacion entity = dao.findById(codigoCotizacion);
		if(entity != null){
			entity.setFechaCotizacion(fechaCotizacion);
			entity.setNombreCliente(nombreCliente);
			entity.setTelefono(telefono);
			entity.setCorreo(correo);		
		}
		
	}

	@Override
	public void deleteCotizacionById(int codigoCotizacion) {
		dao.deleteById(codigoCotizacion);
		
	}

	@Override
	public List<Cotizacion> findAllCotizaciones() {
		return dao.findAllCotizaciones();
	}

	@Override
	public void updateTotal(Integer codigoCotizacion, Double total) {
		Cotizacion entity = dao.findById(codigoCotizacion);
		if(entity != null){
			entity.setTotal(total);
		}
		
	}

}
