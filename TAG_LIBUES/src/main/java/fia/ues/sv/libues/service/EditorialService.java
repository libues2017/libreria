package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.Editorial;

public interface EditorialService {
	
	Editorial findById(int id);
	
	Editorial findByNombre(String nombre);
	
	void saveEditorial(Editorial editorial);
	
	void updateEditorial(Editorial editorial);
	
	void deleteEditorial(int codigoeditorial);
	
	List<Editorial> findAllEditoriales();

	void estadoBorrarEditorialById(Integer codigoeditorial);
}
