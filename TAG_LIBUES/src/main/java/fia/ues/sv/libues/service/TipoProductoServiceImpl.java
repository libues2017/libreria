package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.TipoProductoDao;
import fia.ues.sv.libues.modelo.TipoProducto;

@Service("tipoproductoService")
@Transactional
public class TipoProductoServiceImpl implements TipoProductoService {

	@Autowired
	private TipoProductoDao dao;
	
	@Override
	public TipoProducto findByCodTipoProducto(int codTipoProducto) {
		return dao.findByCodTipoProducto(codTipoProducto);
	}

	@Override
	public TipoProducto findByTipoProducto(String tipoProducto) {
		TipoProducto tipo = dao.findByTipoProducto(tipoProducto);
		return tipo;
	}

	@Override
	public void saveTipoProducto(TipoProducto tipoProducto) {
		dao.save(tipoProducto);
		
	}

	@Override
	public void updateTipoProducto(TipoProducto tipoProducto) {
		TipoProducto entity = dao.findByCodTipoProducto(tipoProducto.getCodTipoProducto()); 
		if(entity!=null){
			entity.setTipoProducto(tipoProducto.getTipoProducto());
		
		}
	}

	@Override
	public void deleteTipoProductoByCodTipoProducto(int codTipoProducto) {
		dao.deleteByCodTipoProducto(codTipoProducto);
		
	}

	@Override
	public List<TipoProducto> findAllTipoProductos() {
		return dao.findAllTipoProductos();
	}

}

