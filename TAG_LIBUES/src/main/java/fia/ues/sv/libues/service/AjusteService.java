package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.Ajuste;
import fia.ues.sv.libues.modelo.Autor;

public interface AjusteService {
	
	
	
    Ajuste findById(int codigoajuste);
	
	//Ajuste findByNombre(String nombreautor);
	
	void saveAjuste(Ajuste ajuste);
	
	void updateAjuste(Ajuste ajuste);
	
	void deleteAjusteById(int codigoajuste);
	
	List<Ajuste> findAllAjuste();

}
