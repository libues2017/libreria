package fia.ues.sv.libues.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import fia.ues.sv.libues.dao.DetalleRetaceoDao;
import fia.ues.sv.libues.modelo.DetalleRetaceo;



@Service("detalleretaceoService")
@Transactional
public class DetalleRetaceoServiceImpl implements DetalleRetaceoService{
	
	@Autowired
	private DetalleRetaceoDao dao;
	

	@Override
	public DetalleRetaceo findById(int codigodetalleretaceo) {
		// TODO Auto-generated method stub
		return dao.findById(codigodetalleretaceo) ;
	}

	@Override
	public DetalleRetaceo findByNombre(String nombreretaceo) {
		// TODO Auto-generated method stub
		return dao.findByName(nombreretaceo);
	}

	@Override
	public void savedetalleRetaceo(DetalleRetaceo detalleRetaceo) {
		// TODO Auto-generated method stub
	
		dao.save(detalleRetaceo);
	}

	@Override
	public void updateRetaceo(DetalleRetaceo detalleRetaceo) {
		// TODO Auto-generated method stub
	
		
		DetalleRetaceo entity=dao.findById(detalleRetaceo.getCodigoretaceo());
		
		if(entity!=null){
			
			entity.setCodigoproducto(detalleRetaceo.getCodigoproducto());
			entity.setCodigoproveedor(detalleRetaceo.getCodigoproveedor());
			entity.setPrecioproducto(detalleRetaceo.getPrecioproducto());
			entity.setCantidadproducto(detalleRetaceo.getCantidadproducto());
			//entity.setFecharetaceo(detalleRetaceo.getFecharetaceo());
			
		}
		
		
	}

	@Override
	public void deleteRetaceoById(int codigodetalleretaceo) {
		// TODO Auto-generated method stub
		
		dao.deleteById(codigodetalleretaceo);
		
	}

	@Override
	public List<DetalleRetaceo> findAllRetaceos() {
		// TODO Auto-generated method stub
		return dao.findAllRetaceos();
	}
	
	


	@Override
	public List<DetalleRetaceo> findRetaceos(Integer codigo) {
		// TODO Auto-generated method stub
		return dao.findRetaceos(codigo);
	}
   
	

}
