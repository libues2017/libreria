package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.Etiqueta;

public interface EtiquetaDao {
	
	 Etiqueta findById(int codigoetiqueta);
		
	   
		
		List<Etiqueta> findAllEtiquetas();

		void saveEtiqueta(Etiqueta etiqueta);


		void deleteEtiquetaById(int codigoetiqueta);


}
