package fia.ues.sv.libues.service;

import java.util.List;
import fia.ues.sv.libues.modelo.DetalleRequisicion;

public interface DetalleRequisicionService {
	
	DetalleRequisicion findById(int codigodetalle);
	
	DetalleRequisicion findByCodigo(int codigoreq);
	
	DetalleRequisicion findByNombre(String nombreproducto);
	
	void saveDetalleRequisicion(DetalleRequisicion detallerequisicion);
	
	void updateRequisicion (DetalleRequisicion detallerequisicion);
	
	void deleteRequisicionById(int codigodetalle);
	
	List<DetalleRequisicion> findAllRequisiciones();
	
	List<DetalleRequisicion> findRequisiciones(Integer fecha);

}
