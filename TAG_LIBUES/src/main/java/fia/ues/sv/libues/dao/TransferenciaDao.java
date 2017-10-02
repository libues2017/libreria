package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.Transferencia;

public interface TransferenciaDao {
	
	Transferencia findById(int codTransferencia);
	
	void save(Transferencia transferencia);
	
	void deleteById(int codTransferencia);
	
	List<Transferencia> findAllTransferencias();
	
	List<Transferencia> findTransferencias(Integer codigo1);

}