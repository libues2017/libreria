package fia.ues.sv.libues.dao;

import java.util.List;
import fia.ues.sv.libues.modelo.Localizacion;

public interface LocalizacionDao {
	
	Localizacion findById(int idlocalizacion);
	
	Localizacion findByNombre (String nombreprod);
	
	void saveLocalizacion (Localizacion localizacion);
	
	void deleteById (int idlocalizacion);
	
	List<Localizacion> findAllLocalizaciones();

}
