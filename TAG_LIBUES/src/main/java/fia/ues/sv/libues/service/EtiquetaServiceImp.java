package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.modelo.Etiqueta;

@Service("etiquetaService")
@Transactional

public class EtiquetaServiceImp implements EtiquetaService {

	@Override
	public Etiqueta findById(int codigoetiqueta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveArea(Etiqueta etiqueta) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAreaById(int codigoarea) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Etiqueta> findAllEtiquetas() {
		// TODO Auto-generated method stub
		return null;
	}

}
