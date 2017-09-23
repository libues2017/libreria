package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import fia.ues.sv.libues.dao.AutorDao;
import fia.ues.sv.libues.modelo.Autor;

@Service("autorService")
@Transactional
public class AutorServiceImpl implements AutorService{

	@Autowired
	private AutorDao dao;

	@Override
	public Autor findById(int codigoautor) {
		return dao.findById(codigoautor);
	}

	@Override
	public Autor findByNombre(String nombreautor) {
		Autor autor=dao.findByName(nombreautor);
		return autor;
	}

	@Override
	public void saveAutor(Autor autor) {
		dao.saveAutor(autor);
	}

	@Override
	public void updateAutor(Autor autor) {
		Autor entity = dao.findById(autor.getCodigoautor()); 
		if(entity!=null){
			entity.setNombreautor(autor.getNombreautor());
			entity.setEstado(autor.getEstado());
		}
	}

	@Override
	public void deleteAutorById(int codigoautor) {
		dao.deleteById(codigoautor);
	}

	@Override
	public List<Autor> findAllAutors() {
		return dao.findAllAutors();
	}
			
}

