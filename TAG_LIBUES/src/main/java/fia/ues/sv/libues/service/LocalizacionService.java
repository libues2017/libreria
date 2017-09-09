package fia.ues.sv.libues.service;

import java.util.List;
import fia.ues.sv.libues.modelo.Localizacion;

public interface LocalizacionService {
	
	Localizacion findById(int idlocalizacion);
	
	Localizacion findByNombre(String nombreprod);
	
	void saveLocalizacion (Localizacion localizacion);
	
	void updateLocalizacion (Localizacion localizacion);
	
	void deleteById (int idlocalizacion);
	
	List<Localizacion> findAllLocalizaciones();

}
