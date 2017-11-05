package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;
import fia.ues.sv.libues.modelo.Requisicion;

public interface RequisicionService {
	
	Requisicion findById(int codigorequisicion);
	
	void saveRequisicion(Requisicion requisicion);
	
	void updateRequisicion (Requisicion requisicion);
	
	void updateFechaRequisicion (Date fecha, String destino, Integer codigorequisicion);
	
	void deleteRequisicionById(int codigorequisicion);
	
	List<Requisicion> findAllRequisiciones();

	void updateTotal(Integer codigorequisicion, Double total);

}
