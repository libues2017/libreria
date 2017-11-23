package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.Area;

public interface AreaService {
	
	Area findById(int codigoarea);
	
	Area findByNombre(String nombrearea);
	
	void saveArea(Area area);
	
	void updateArea(Area area);
	
	void deleteAreaById(int codigoarea);
	
	List<Area> findAllAreas();
	
	List<Area> findAllAreasDeleted();

	void estadoBorrarAreaById(Integer codigoarea);

	void estadoRestaurarAreaById(Integer codigoarea);
	
}
