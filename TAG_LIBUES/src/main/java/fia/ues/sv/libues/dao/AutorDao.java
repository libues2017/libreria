package fia.ues.sv.libues.dao;

import fia.ues.sv.libues.modelo.Autor;
import java.util.List;

public interface AutorDao {

	Autor findById(int codigoautor);
	
	Autor findByName(String nombreautor);
	
	void saveAutor(Autor autor);
	
	void deleteById(int codigoautor);
	
	List<Autor> findAllAutors();
}
