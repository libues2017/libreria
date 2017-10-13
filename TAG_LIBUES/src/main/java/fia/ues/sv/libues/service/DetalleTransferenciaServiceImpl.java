package fia.ues.sv.libues.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import fia.ues.sv.libues.dao.DetalleTransferenciaDao;
import fia.ues.sv.libues.modelo.DetalleTransferencia;

@Service("detalletransferenciaService")
@Transactional
public class DetalleTransferenciaServiceImpl implements DetalleTransferenciaService{

	@Autowired
	private DetalleTransferenciaDao dao;
	
	@Override
	public DetalleTransferencia findById(int codDetalleTransferencia) {
		return dao.findById(codDetalleTransferencia);
	}

	@Override
	public DetalleTransferencia findByNombre(String nombreTransferencia) {
		return dao.findByName(nombreTransferencia);
	}

	@Override
	public void savedetalleTransferencia(DetalleTransferencia detalleTransferencia) {
		dao.save(detalleTransferencia);
		
	}

	@Override
	public void updateTransferencia(DetalleTransferencia detalleTransferencia) {
		DetalleTransferencia entity = dao.findById(detalleTransferencia.getCodTransferencia());
		if(entity != null){
			entity.setCodProducto(detalleTransferencia.getCodProducto());
			entity.setPrecioProducto(detalleTransferencia.getPrecioProducto());
			entity.setCantidadProducto(detalleTransferencia.getCantidadProducto());
			
		}
		
	}

	@Override
	public void deleteTransferenciaById(int codDetalleTransferencia) {
		dao.deleteById(codDetalleTransferencia);
		
	}

	@Override
	public List<DetalleTransferencia> findAllTransferencias() {
		return dao.findAllTransferencias();
	}

	@Override
	public List<DetalleTransferencia> findTransferencias(Integer codigo1) {
		return dao.findTransferencias(codigo1);
	}

	@Override
	public DetalleTransferencia findByCodigo(Integer codTransferencia) {
		return dao.findByCodigo(codTransferencia) ;
	}

}