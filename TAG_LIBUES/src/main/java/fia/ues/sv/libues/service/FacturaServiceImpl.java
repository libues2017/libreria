package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.FacturaDao;
import fia.ues.sv.libues.modelo.Factura;

@Service("facturaService")
@Transactional
public class FacturaServiceImpl implements FacturaService{

	@Autowired
	private FacturaDao dao;
	
	@Override
	public Factura findById(int idfactura) {		
		return dao.findById(idfactura) ;
	}

	@Override
	public void saveFactura(Factura factura) {
		dao.save(factura);
	}

	@Override
	public void updateFactura(Factura factura) {
		Factura entity=dao.findById(factura.getIdfactura());		
		if(entity!=null){	
		}
	}

	@Override
	public void updateFacturaDatos(Integer idfactura, Date fecha) {
		Factura entity=dao.findById(idfactura);		
		if(entity!=null){			
			entity.setFechafactura(fecha);
		}
	}

	@Override
	public void deleteFacturaById(int idfactura) {
		dao.deleteById(idfactura);	
	}

	@Override
	public List<Factura> findAllFacturas() {
		return dao.findAllFacturas();
	}

	
}