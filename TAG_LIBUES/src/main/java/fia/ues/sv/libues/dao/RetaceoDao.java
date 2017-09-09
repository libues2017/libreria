package fia.ues.sv.libues.dao;

import fia.ues.sv.libues.modelo.Retaceo;
import java.util.List;

public interface RetaceoDao {
	
	Retaceo findById(int codigoretaceo);
	
	void save(Retaceo retaceo);
	
	void deleteById(int codigoretaceo);
	
	List<Retaceo> findAllRetaceos();
	
	List<Retaceo> findRetaceos(Integer codigo);

}
