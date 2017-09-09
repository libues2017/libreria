package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.modelo.Requisicion;

@Service("requisicionService")
@Transactional
public class RequisicionServiceImpl implements RequisicionService{

	@Override
	public Requisicion findById(int codigorequisicion) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveRequisicion(Requisicion requisicion) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateRequisicion(Requisicion Requisicion) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFechaRequisicion(Date fecha, Integer codigorequisicion) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRequisicionById(int codigorequisicion) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Requisicion> findAllRequisiciones() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
