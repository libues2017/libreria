package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import fia.ues.sv.libues.dao.LocalizacionDao;

import fia.ues.sv.libues.modelo.Localizacion;

@Service("LocalizacionService")
@Transactional
public class LocalizacionServiceImpl implements LocalizacionService {

	@Autowired
	private LocalizacionDao dao;
	
	@Override
	public Localizacion findById(int idlocalizacion) {
		return dao.findById(idlocalizacion); 
	}

	@Override
	public Localizacion findByNombre(String nombreprod) {
		return dao.findByNombre(nombreprod);
	}

	@Override
	public void saveLocalizacion(Localizacion localizacion) {
		dao.saveLocalizacion(localizacion);
		
	}

	@Override
	public void updateLocalizacion(Localizacion localizacion) {
		Localizacion entity = dao.findById(localizacion.getIdlocalizacion());
		if(entity!=null){
			entity.setEstante(localizacion.getEstante());
			entity.setNivel(localizacion.getNivel());
			entity.setCantidad(localizacion.getCantidad());
		}		
	}

	@Override
	public void deleteById(int idlocalizacion) {
		dao.deleteById(idlocalizacion);
		
	}

	@Override
	public List<Localizacion> findAllLocalizaciones() {
		return dao.findAllLocalizaciones();
	}
	
	

}
