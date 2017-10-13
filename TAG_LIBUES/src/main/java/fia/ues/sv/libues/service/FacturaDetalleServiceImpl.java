package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.DetalleRequisicionDao;
import fia.ues.sv.libues.dao.FacturaDetalleDao;
import fia.ues.sv.libues.modelo.DetalleRequisicion;
import fia.ues.sv.libues.modelo.FacturaDetalle;

@Service("facturadetalleService")
@Transactional
public class FacturaDetalleServiceImpl implements FacturaDetalleService{

	@Autowired
	private FacturaDetalleDao dao;
	
	@Override
	public FacturaDetalle findById(int iddetalle) {
		return dao.findById(iddetalle) ;
	}

	@Override
	public FacturaDetalle findByCodigo(int codigofact) {
		return dao.findByCodigo(codigofact) ;
	}

	@Override
	public FacturaDetalle findByNombre(String nombreproducto) {
		return dao.findByName(nombreproducto);
	}

	@Override
	public void saveFacturaDetalle(FacturaDetalle iddetalle) {
		dao.save(iddetalle);
	}

	@Override
	public void updateFactura(FacturaDetalle facturadetalle) {
		FacturaDetalle entity=dao.findById(facturadetalle.getIdfacturadetalle());		
		if(entity!=null){			
			entity.setCodigoproducto(facturadetalle.getCodigoproducto());
			entity.setNombreproducto(facturadetalle.getNombreproducto());
			entity.setCantidad(facturadetalle.getCantidad());
			entity.setPrecio(facturadetalle.getPrecio());
			entity.setSubtotalfactura(facturadetalle.getSubtotalfactura());
		}
	}

	@Override
	public void deleteFacturaById(int iddetalle) {
		dao.deleteById(iddetalle);
	}

	@Override
	public List<FacturaDetalle> findAllFacturas() {
		return dao.findAllFacturas();
	}

	@Override
	public List<FacturaDetalle> findFacturas(Integer codigofact) {
		return dao.findFacturas(codigofact);
	}
	
	

}
