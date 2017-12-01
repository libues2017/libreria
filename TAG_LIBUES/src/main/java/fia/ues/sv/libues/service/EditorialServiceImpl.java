package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import fia.ues.sv.libues.dao.EditorialDao;
import fia.ues.sv.libues.modelo.Editorial;

@Service("editorialService")
@Transactional
public class EditorialServiceImpl implements EditorialService{

	@Autowired
	private EditorialDao dao;
	
	@Override
	public Editorial findById(int id) {
		return dao.findById(id); 
	}

	@Override
	public Editorial findByNombre(String nombre) {
		return dao.findByNombre(nombre);
	}

	@Override
	public void saveEditorial(Editorial editorial) {
		dao.saveEditorial(editorial);
		
	}

	@Override
	public void updateEditorial(Editorial editorial) {
		Editorial entity = dao.findById(editorial.getCodigoeditorial());
		if(entity!=null){
			entity.setNombre(editorial.getNombre());
			entity.setCodigoespecifico(editorial.getCodigoespecifico());
			entity.setEstado(editorial.isEstado());
		}
		
	}

	@Override
	public void deleteEditorial(int codigoeditorial) {
		dao.deleteByID(codigoeditorial);
		
	}

	@Override
	public List<Editorial> findAllEditoriales() {
		return dao.findAllEditoriales();
	}

	@Override
	public void estadoBorrarEditorialById(Integer codigoeditorial) {		
		Editorial entity=dao.findById(codigoeditorial);		
		if(entity!=null){
			entity.setEstado(false);
		}
	}
	

}

