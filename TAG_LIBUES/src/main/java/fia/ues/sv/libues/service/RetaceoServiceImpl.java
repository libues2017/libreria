package fia.ues.sv.libues.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import fia.ues.sv.libues.dao.RetaceoDao;
import fia.ues.sv.libues.modelo.Retaceo;

@Service("retaceoService")
@Transactional
public class RetaceoServiceImpl implements RetaceoService{
	
	@Autowired
	private RetaceoDao dao;
	

	@Override
	public Retaceo findById(int codigoretaceo) {
		// TODO Auto-generated method stub
		return dao.findById(codigoretaceo) ;
	}

	

	@Override
	public void saveRetaceo(Retaceo retaceo) {
		// TODO Auto-generated method stub
	
		dao.save(retaceo);
	}

	@Override
	public void updateRetaceo(Retaceo retaceo) {
		// TODO Auto-generated method stub
	
		
		Retaceo entity=dao.findById(retaceo.getCodigoretaceo());
		
		if(entity!=null){
			
			/*entity.setCodigoproducto(retaceo.getCodigoproducto());
			entity.setCodigoproveedor(retaceo.getCodigoproveedor());		
			entity.setCantidadproducto(detalleRetaceo.getCantidadproducto());*/
			//entity.setFecharetaceo(detalleRetaceo.getFecharetaceo());
			
		}
		
		
	}

	@Override
	public void deleteRetaceoById(int codigoretaceo) {
		// TODO Auto-generated method stub
		
		dao.deleteById(codigoretaceo);
		
	}

	@Override
	public List<Retaceo> findAllRetaceos() {
		// TODO Auto-generated method stub
		return dao.findAllRetaceos();
	}



	@Override
	public void updateFechaRetaceo(Date fecharetaceo,Date fechafacturaproveedor,Integer codigoproveedor,Integer codigofacturaproveedor,Integer codigoretaceo) {
		// TODO Auto-generated method stub
		
		Retaceo retaceo=new Retaceo();
        Retaceo entity=dao.findById(codigoretaceo);
		
		if(entity!=null){
			
			
			entity.setFecharetaceo(fecharetaceo);
			entity.setFechafacturaproveedor(fechafacturaproveedor);
			entity.setCodigofacturaproveedor(codigofacturaproveedor);
			entity.setCodigoproveedor(codigoproveedor);
			/*entity.setCodigoproducto(detalleRetaceo.getCodigoproducto());
			entity.setCodigoproveedor(detalleRetaceo.getCodigoproveedor());
			entity.setPrecioproducto(detalleRetaceo.getPrecioproducto());
			entity.setCantidadproducto(detalleRetaceo.getCantidadproducto());*/
			//entity.setFecharetaceo(detalleRetaceo.getFecharetaceo());
			
		}
		
		
		
	}



	/*@Override
	public void updateFechaRetaceo(String fecharetaceo, Integer codigoretaceo) {
		// TODO Auto-generated method stub
		
	}*/
	
	



   
	

}
