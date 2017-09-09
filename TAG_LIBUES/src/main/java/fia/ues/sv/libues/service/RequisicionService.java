package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;
import fia.ues.sv.libues.modelo.Requisicion;

public interface RequisicionService {
	
Requisicion findById(int codigorequisicion);
	
	void saveRequisicion(Requisicion requisicion);
	
	void updateRequisicion (Requisicion Requisicion);
	
	void updateFechaRequisicion (Date fecha, Integer codigorequisicion);
	
	void deleteRequisicionById(int codigorequisicion);
	
	List<Requisicion> findAllRequisiciones();

}
