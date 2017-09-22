package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.Requisicion;

public interface RequisicionDao {
	
	Requisicion findById(int codigorequisicion);
	
	void save(Requisicion requisicion);
	
	void deleteById(int codigorequisicion);
	
	List<Requisicion> findAllRequisiciones();
	
	List<Requisicion> findRequisiciones(Integer codigo2);

}
