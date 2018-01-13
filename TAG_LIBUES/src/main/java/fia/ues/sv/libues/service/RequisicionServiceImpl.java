package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.RequisicionDao;
import fia.ues.sv.libues.dao.RetaceoDao;
import fia.ues.sv.libues.modelo.Requisicion;
import fia.ues.sv.libues.modelo.Retaceo;

@Service("requisicionService")
@Transactional
public class RequisicionServiceImpl implements RequisicionService{

	@Autowired
	private RequisicionDao dao;
	

	@Override
	public Requisicion findById(int codigorequisicion) {		
		return dao.findById(codigorequisicion) ;
	}

	@Override
	public void saveRequisicion(Requisicion requisicion) {
		dao.save(requisicion);		
	}

	@Override
	public void updateRequisicion(Requisicion requisicion) {
		Requisicion entity=dao.findById(requisicion.getCodigorequisicion());		
		if(entity!=null){	
		}
	}

	@Override
	public void updateFechaRequisicion(Date fecha, String destino, Integer codigorequisicion, boolean estado) {
		Requisicion entity=dao.findById(codigorequisicion);		
		if(entity!=null){			
			entity.setFecha(fecha);
			entity.setDestino(destino);	
			entity.setEstado(true);
		}		
	}	
	

	@Override
	public void deleteRequisicionById(int codigorequisicion) {
		dao.deleteById(codigorequisicion);		
	}

	@Override
	public List<Requisicion> findAllRequisiciones() {
		return dao.findAllRequisiciones();
	}

	@Override
	public void updateTotal(Integer codigorequisicion, Double total) {
		Requisicion entity=dao.findById(codigorequisicion);		
		if(entity!=null){			
			entity.setTotal(total);			
		}	
		
	}

	@Override
	public void updateEstadoRequisicionById(Integer codigoreq) {
		Requisicion entity=dao.findById(codigoreq);		
		if(entity!=null){
			entity.setEstado(false);
		}
		
	}

	@Override
	public void updateDatosReq(Integer codigorequisicion, Date fecharequisicion1, String destino) {
		Requisicion entity = dao.findById(codigorequisicion);
		if(entity!=null){
			entity.setFecha(fecharequisicion1); 
			entity.setDestino(destino);
			
		}
		
	}
	

}
