package fia.ues.sv.libues.dao;

import java.util.List;
import fia.ues.sv.libues.modelo.DetalleRequisicion;

public interface DetalleRequisicionDao {
	
	DetalleRequisicion findById(int codigodetalle);
	
	DetalleRequisicion findByCodigo(int codigoreq);
	
	DetalleRequisicion findByName(String nombreproducto);
	
	void save(DetalleRequisicion detallerequisicion);
	
	void deleteById(int codigodetallere);
	
	List<DetalleRequisicion> findAllRequisiciones();
	
	List<DetalleRequisicion> findRequisiciones(Integer codigodetalle);

}
