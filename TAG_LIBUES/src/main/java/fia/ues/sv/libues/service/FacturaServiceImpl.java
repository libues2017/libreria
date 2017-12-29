package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.FacturaDao;
import fia.ues.sv.libues.modelo.Area;
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
			entity.setNumerofactura(factura.getNumerofactura());
			entity.setFechafactura(factura.getFechafactura());
			entity.setTotal(factura.getTotal());
			entity.setTipofactura(factura.getTipofactura());
			entity.setCliente(factura.getCliente());
			entity.setDireccion(factura.getDireccion());
			entity.setDocumento(factura.getDocumento());
			entity.setTipocredito(factura.getTipocredito());
			entity.setEstado(factura.isEstado());
		}
	}

	@Override
	public void updateFacturaDatos(Integer idfactura, Date fecha, Integer numerofact, String cliente, String direccion, String documento, String tipocredito) {
		Factura entity=dao.findById(idfactura);		
		if(entity!=null){			
			entity.setFechafactura(fecha);
			entity.setNumerofactura(numerofact);
			entity.setCliente(cliente);
			entity.setDireccion(direccion);
			entity.setDocumento(documento);
			entity.setTipocredito(tipocredito);
		}
	}
	
	@Override
	public void updateFacturaDatos2(Integer idfactura, Double total, String tipo) {
		Factura entity=dao.findById(idfactura);		
		if(entity!=null){
			entity.setTotal(total);
			entity.setTipofactura(tipo);
			
		}
	}
	
	@Override
	public void updateNumeroFactura(Integer idfactura, Integer numerofactura) {
		Factura entity=dao.findById(idfactura);		
		if(entity!=null){
			entity.setNumerofactura(numerofactura);			
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

	@Override
	public void updateEstadoFacturaById(Integer idfactura) {
		Factura entity=dao.findById(idfactura);		
		if(entity!=null){
			entity.setEstado(false);
		}
		
	}

	@Override
	public void updateFacturaDatos3(Integer codigofact, String documento, String tipocredito) {
		Factura entity=dao.findById(codigofact);		
		if(entity!=null){
			entity.setDocumento(documento);
			entity.setTipocredito(tipocredito);
			
		}
	}

	
}
