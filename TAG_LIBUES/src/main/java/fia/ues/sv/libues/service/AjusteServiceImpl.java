package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.AjusteDao;
import fia.ues.sv.libues.dao.AutorDao;
import fia.ues.sv.libues.modelo.Ajuste;


@Service("ajusteService")
@Transactional
public class AjusteServiceImpl implements AjusteService {
	
	
	
	@Autowired
	private AjusteDao dao;

	@Override
	public Ajuste findById(int codigoajuste) {
		// TODO Auto-generated method stub
		return dao.findById(codigoajuste);
	}

	@Override
	public void saveAjuste(Ajuste ajuste) {
		// TODO Auto-generated method stub
		dao.save(ajuste);
	}

	@Override
	public void updateAjuste(Ajuste ajuste) {
		// TODO Auto-generated method stub
		
		
		Ajuste entity = dao.findById(ajuste.getCodigoajuste()); 
		if(entity!=null){
			entity.setConcepto(ajuste.getConcepto());
			//entity.setEstado(autor.isEstado());
		}
		
	}

	@Override
	public void deleteAjusteById(int codigoajuste) {
		// TODO Auto-generated method stub
		dao.deleteById(codigoajuste);
	}

	@Override
	public List<Ajuste> findAllAjuste() {
		// TODO Auto-generated method stub
		return dao.findAllAjuste();
	}

}
