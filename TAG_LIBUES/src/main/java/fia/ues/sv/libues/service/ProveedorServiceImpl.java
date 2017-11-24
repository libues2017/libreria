package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import fia.ues.sv.libues.dao.ProveedorDao;
import fia.ues.sv.libues.modelo.Proveedor;

@Service("proveedorService")
@Transactional
public class ProveedorServiceImpl implements ProveedorService{

	@Autowired
	private ProveedorDao dao;
	
	@Override
	public Proveedor findById(int codigoproveedor) {
		return dao.findById(codigoproveedor);
	}

	@Override
	public Proveedor findByNombre(String nombreproveedor) {
		return dao.findByNombre(nombreproveedor);
	}

	@Override
	public void saveProveedor(Proveedor proveedor) {
		dao.saveProveedor(proveedor);
		
	}

	@Override
	public void updateProveedor(Proveedor proveedor) {
		Proveedor entity = dao.findById(proveedor.getCodigoproveedor());
		if(entity!=null){
			entity.setNombreproveedor(proveedor.getNombreproveedor());
			entity.setDireccion(proveedor.getDireccion());
			entity.setTelefonoproveedor(proveedor.getTelefonoproveedor());
			entity.setContactoproveedor1(proveedor.getContactoproveedor1());
			entity.setContactoproveedor2(proveedor.getContactoproveedor2());
			entity.setEstado(proveedor.isEstado());
			
		}
		
	}

	@Override
	public void deleteProveedor(int codigoproveedor) {
		dao.deleteByID(codigoproveedor);
		
	}

	@Override
	public List<Proveedor> findAllProveedores() {
		return dao.findAllProveedores();
	}

	@Override
	public List<Proveedor> findAllProveedoresDeleted() {
		return dao.findAllProveedoresDeleted();
	}

	@Override
	public void estadoBorrarProveedorById(Integer codigoproveedor) {
		Proveedor entity=dao.findById(codigoproveedor);		
		if(entity!=null){
			entity.setEstado(false);
		}		
	}

	@Override
	public void estadoRestaurarProveedorById(Integer codigoproveedor) {
		Proveedor entity=dao.findById(codigoproveedor);		
		if(entity!=null){
			entity.setEstado(true);
		}		
	}
}