package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.DetalleRequisicionDao;
import fia.ues.sv.libues.modelo.DetalleRequisicion;
import fia.ues.sv.libues.modelo.DetalleRetaceo;

@Service("detallerequisicionService")
@Transactional
public class DetalleRequisicionServiceImpl implements DetalleRequisicionService {

	@Autowired
	private DetalleRequisicionDao dao;
	
	@Override
	public DetalleRequisicion findById(int codigodetalle) {
		return dao.findById(codigodetalle) ;
	}
	
	@Override
	public DetalleRequisicion findByCodigo(int codigoreq) {
		return dao.findByCodigo(codigoreq) ;
	}

	@Override
	public DetalleRequisicion findByNombre(String nombrereq) {		
		return dao.findByName(nombrereq);
	}

	@Override
	public void saveDetalleRequisicion(DetalleRequisicion detallerequisicion) {		
		dao.save(detallerequisicion);
	}

	@Override
	public void updateRequisicion(DetalleRequisicion detallerequisicion) {
		
		DetalleRequisicion entity=dao.findById(detallerequisicion.getCodigorequisicion());		
		
		if(entity!=null){			
			entity.setCodigoproducto(detallerequisicion.getCodigoproducto());
			entity.setNombreproducto(detallerequisicion.getNombreproducto());
			entity.setPrecio(detallerequisicion.getPrecio());
			entity.setBodega(detallerequisicion.getBodega());
			entity.setSala(detallerequisicion.getSala());
			entity.setCantidad(detallerequisicion.getCantidad());						
		}
		
	}

	@Override
	public void deleteRequisicionById(int codigodetalle) {
		dao.deleteById(codigodetalle);
	}

	@Override
	public List<DetalleRequisicion> findAllRequisiciones() {
		return dao.findAllRequisiciones();
	}

	@Override
	public List<DetalleRequisicion> findRequisiciones(Integer codigo2) {
		return dao.findRequisiciones(codigo2);
	}
	

}
