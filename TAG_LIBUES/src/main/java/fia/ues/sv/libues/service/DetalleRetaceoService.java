package fia.ues.sv.libues.service;

import java.util.List;
import fia.ues.sv.libues.modelo.DetalleRetaceo;

public interface DetalleRetaceoService {
	
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
	DetalleRetaceo findById(int codigodetalleretaceo);
	
	DetalleRetaceo findByNombre(String nombreretaceo);
	
	void savedetalleRetaceo(DetalleRetaceo detalleRetaceo);
	
	void updatedetalleRetaceo (DetalleRetaceo detalleRetaceo);
	
	void deleteRetaceoById(int codigoretaceo);
	
	List<DetalleRetaceo> findAllRetaceos();
	
	List<DetalleRetaceo> findRetaceos(Integer fecha);

	List<DetalleRetaceo> findRetaceosProducto(Integer codigoretaceo, Integer codigoproducto);

}
