package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.DetalleTransferencia;

public interface DetalleTransferenciaService {
	
	DetalleTransferencia findById(int codDetalleTransferencia);
	
	DetalleTransferencia findByNombre(String nombreTransferencia);
	
	void savedetalleTransferencia(DetalleTransferencia detalleTransferencia);
	
	void updateTransferencia(DetalleTransferencia detalleTransferencia);
	
	void deleteTransferenciaById(int codTransferencia);
	
	List<DetalleTransferencia> findAllTransferencias();
	
	List<DetalleTransferencia> findTransferencias(Integer fecha);

	DetalleTransferencia findByCodigo(Integer codTransferencia);

}
