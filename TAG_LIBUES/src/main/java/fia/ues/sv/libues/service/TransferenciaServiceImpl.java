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
	public void updateFechaTransferencia(Date fechaTransferencia, Integer codTransferencia, Integer numeroTransferencia,
			String tipoTransferencia, String sucursal, Boolean estado) {
		Transferencia entity = dao.findById(codTransferencia);
		
		if(entity != null){
			entity.setFechaTransferencia(fechaTransferencia);
			entity.setNumeroTransferencia(numeroTransferencia);
			entity.setTipoTransferencia(tipoTransferencia);//.setFechaTipoTransferencia(fechaTransferencia);
			entity.setSucursal(sucursal);
			entity.setEstado(true);		
			
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

	@Override
	public void updateTotal(Integer codTransferencia, Double total) {
		Transferencia entity = dao.findById(codTransferencia);
		if(entity != null){
			entity.setTotal(total);
		}
		
	}

	@Override
	public void updateEstadoTransferenciaById(Integer codTransferencia) {
		Transferencia entity=dao.findById(codTransferencia);		
		if(entity!=null){
			entity.setEstado(false);
		}
		
	}

}
