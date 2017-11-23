package fia.ues.sv.libues.dao;

import fia.ues.sv.libues.modelo.Area;

import java.util.List;

public interface AreaDao {
	
	Area findById(int codigoarea);
	
	Area findByName(String nombrearea);
	
	void save(Area area);
	
	void deleteById(int codigoarea);
	
	List<Area> findAllAreas();
	
	List<Area> findAllAreasDeleted();
}
