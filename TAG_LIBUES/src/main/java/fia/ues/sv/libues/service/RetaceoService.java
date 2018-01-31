package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;
import fia.ues.sv.libues.modelo.Retaceo;

public interface RetaceoService {
	
	/*
	 * Area findById(int id);
	
	Area findByNombre(String nombrearea);
	
	void saveArea(Area area);
	
	void updateArea(Area area);
	
	void deleteAreaById(int id);
	
	List<Area> findAllAreas();
	 * 
	 * 
	 * 
	 * 
	 * */
	Retaceo findById(int codigoretaceo);
	
	void saveRetaceo(Retaceo retaceo);
	
	void updateRetaceo (Retaceo retaceo, double utilidad);
	
	//void updateFechaRetaceo (String fecharetaceo, Integer codigoretaceo);
	
	void deleteRetaceoById(int codigoretaceo);
	
	List<Retaceo> findAllRetaceos();

	void updateFechaRetaceo(Date fecharetaceo,Date fechafacturaproveedor,Integer codigoproveedor,Integer codigofacturaproveedor,Integer codigoretaceo,Double total);
	
	
	

}
