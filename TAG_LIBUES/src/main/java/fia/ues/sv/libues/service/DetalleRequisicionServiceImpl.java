package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.DetalleRequisicionDao;
import fia.ues.sv.libues.modelo.DetalleRequisicion;

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
	public DetalleRequisicion findByNombre(String nombrereq) {		
		return dao.findByName(nombrereq);
	}

	@Override
	public void saveDetalleRequisicion(DetalleRequisicion detallerequisicion) {		
		dao.save(detallerequisicion);
	}

	@Override
	public void updateRequisicion(DetalleRequisicion detallerequisicion) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRequisicionById(int codigodetalle) {
		// TODO Auto-generated method stub
		
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
