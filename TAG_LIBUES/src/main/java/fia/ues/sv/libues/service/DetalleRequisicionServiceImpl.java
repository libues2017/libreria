package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.modelo.DetalleRequisicion;

@Service("detallerequisicionService")
@Transactional
public class DetalleRequisicionServiceImpl implements DetalleRequisicionService {

	@Override
	public DetalleRequisicion findById(int codigodetalle) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DetalleRequisicion findByNombre(String nombreproducto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveDetalleRequisicion(DetalleRequisicion detallerequisicion) {
		// TODO Auto-generated method stub
		
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DetalleRequisicion> findRequisiciones(Integer fecha) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
