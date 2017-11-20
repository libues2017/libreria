package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import fia.ues.sv.libues.modelo.Transferencia;

public interface TransferenciaService {
	
	Transferencia findById(int codTransferencia);
	
	void saveTransferencia(Transferencia transferencia);
	
	void updateTransferencia(Transferencia transferencia);
	
	void updateFechaTransferencia(Date fechaTransferencia, Integer codTransferencia, Integer numeroTransferencia, String tipoTransferencia, String sucursal, Boolean estado);
	
	void deleteTransferenciaById(int codTransferencia);
	
	List<Transferencia> findAllTransferencias();
	
	void updateTotal(Integer codTransferencia, Double total);

	void updateEstadoTransferenciaById(Integer codTransferencia);

}
