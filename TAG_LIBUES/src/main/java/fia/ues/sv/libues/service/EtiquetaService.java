package fia.ues.sv.libues.service;

import java.util.List;


import fia.ues.sv.libues.modelo.Etiqueta;

public interface EtiquetaService {
	
	
    Etiqueta findById(int codigoetiqueta);
	
    void saveEtiqueta(Etiqueta etiqueta);	
	
	
	
	List<Etiqueta> findAllEtiquetas();

	void deleteEtiquetaById(int codigoetiqueta);

}
