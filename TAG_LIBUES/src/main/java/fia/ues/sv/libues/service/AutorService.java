package fia.ues.sv.libues.service;

import java.util.List;
import fia.ues.sv.libues.modelo.Autor;

public interface AutorService {

	Autor findById(int codigoautor);
	
	Autor findByNombre(String nombreautor);
	
	void saveAutor(Autor autor);
	
	void updateAutor(Autor autor);
	
	void deleteAutorById(int codigoautor);
	
	List<Autor> findAllAutors();

	void estadoBorrarAutorById(Integer codigoautor);
	
}
