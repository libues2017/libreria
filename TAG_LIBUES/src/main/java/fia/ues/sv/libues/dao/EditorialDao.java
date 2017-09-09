package fia.ues.sv.libues.dao;

import java.util.List;
import fia.ues.sv.libues.modelo.Editorial;

public interface EditorialDao {

	Editorial findById(int id);
	
	Editorial findByNombre(String nombre);
	
	void saveEditorial(Editorial editorial);
	
	void deleteByID(int codigoeditorial);
	
	List<Editorial> findAllEditoriales();
	
}
