package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.DetalleTransferencia;

public interface DetalleTransferenciaDao {
	
	DetalleTransferencia findById(int codDetalleTransferencia);
	
	DetalleTransferencia findByName(String nombreTransferencia);
	
	void save(DetalleTransferencia detalleTransferencia);
	
	void deleteById(int codDetalleTransferencia);
	
	List<DetalleTransferencia> findAllTransferencias();
	
	List<DetalleTransferencia> findTransferencias(Integer codigo1);

	DetalleTransferencia findByCodigo(Integer codTransferencia);

}