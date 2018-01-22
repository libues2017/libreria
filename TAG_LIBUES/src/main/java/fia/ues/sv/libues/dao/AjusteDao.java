package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.Ajuste;
import fia.ues.sv.libues.modelo.Area;

public interface AjusteDao {
	
	
	
Ajuste findById(int codigoajuste);
	
	//Area findByName(String nombrearea);
	
	void save(Ajuste ajuste);
	
	void deleteById(int codigoajuste);
	
	List<Ajuste> findAllAjuste();
	
	//List<Area> findAllAreasDeleted();

}
