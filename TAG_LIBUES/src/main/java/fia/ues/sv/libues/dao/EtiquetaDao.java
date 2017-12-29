package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.Etiqueta;

public interface EtiquetaDao {
	
	 Etiqueta findById(int codigoetiqueta);
		
	    void saveArea(Etiqueta etiqueta);	
		
		void deleteAreaById(int codigoarea);
		
		List<Etiqueta> findAllEtiquetas();


}
