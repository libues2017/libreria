package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.EtiquetaDao;
import fia.ues.sv.libues.modelo.Etiqueta;

@Service("etiquetaService")
@Transactional

public class EtiquetaServiceImp implements EtiquetaService {
	
	@Autowired
	private EtiquetaDao dao;

	@Override
	public Etiqueta findById(int codigoetiqueta) {
		// TODO Auto-generated method stub
		return dao.findById(codigoetiqueta);
	}

	@Override
	public void saveEtiqueta(Etiqueta etiqueta) {
		// TODO Auto-generated method stub
		
		dao.saveEtiqueta(etiqueta);
		
	}

	@Override
	public void deleteEtiquetaById(int codigoetiqueta) {
       dao.deleteEtiquetaById(codigoetiqueta);		
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Etiqueta> findAllEtiquetas() {
		// TODO Auto-generated method stub
		return dao.findAllEtiquetas();
	}

}
