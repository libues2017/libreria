package fia.ues.sv.libues.dao;

import fia.ues.sv.libues.modelo.DetalleRetaceo;
import java.util.List;

public interface DetalleRetaceoDao {
	

	DetalleRetaceo findById(int codigodetalleretaceo);
	
	DetalleRetaceo findByName(String nombreretaceo);
	
	void save(DetalleRetaceo detalleRetaceo);
	
	void deleteById(int codigodetalleretaceo);
	
	List<DetalleRetaceo> findAllRetaceos();
	
	List<DetalleRetaceo> findRetaceos(Integer codigo);

	List<DetalleRetaceo> findRetaceosProducto(Integer codigoretaceo, Integer codigoproducto);

}
