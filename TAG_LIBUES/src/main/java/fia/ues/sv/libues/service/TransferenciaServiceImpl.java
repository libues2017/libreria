package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.TransferenciaDao;
import fia.ues.sv.libues.modelo.Transferencia;

@Service("transferenciaService")
@Transactional
public class TransferenciaServiceImpl implements TransferenciaService{

	@Autowired
	private TransferenciaDao dao;
	
	@Override
	public Transferencia findById(int codTransferencia) {
		return dao.findById(codTransferencia);
	}

	@Override
	public void saveTransferencia(Transferencia transferencia) {
		dao.save(transferencia);
		
	}

	@Override
	public void updateTransferencia(Transferencia transferencia) {
		Transferencia entity = dao.findById(transferencia.getCodTransferencia());
		if(entity != null){
			
		}
		
	}

	@Override
	public void updateFechaTransferencia(Date fechaTransferencia, Integer codTransferencia, String tipoTransferencia, String sucursal) {
		Transferencia transferencia = new Transferencia();
		Transferencia entity = dao.findById(codTransferencia);
		
		if(entity != null){
			entity.setFechaTransferencia(fechaTransferencia);
			entity.setTipoTransferencia(tipoTransferencia);//.setFechaTipoTransferencia(fechaTransferencia);
			entity.setSucursal(sucursal);
			
		}
		
	}

	@Override
	public void deleteTransferenciaById(int codTransferencia) {
		dao.deleteById(codTransferencia);
		
	}

	@Override
	public List<Transferencia> findAllTransferencias() {
		return dao.findAllTransferencias();
	}

}
