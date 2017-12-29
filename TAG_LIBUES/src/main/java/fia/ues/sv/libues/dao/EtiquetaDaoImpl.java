package fia.ues.sv.libues.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.Etiqueta;

@Repository("etiquetaDao")

public class EtiquetaDaoImpl extends AbstractDao<Integer, Etiqueta> implements EtiquetaDao {

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
