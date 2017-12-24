package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import fia.ues.sv.libues.dao.ReservasDao;
import fia.ues.sv.libues.modelo.Reservas;

@Service("reservasService")
@Transactional
public class ReservasServiceImpl implements ReservasService{
	
	@Autowired
	private ReservasDao dao;

	@Override
	public Reservas findById(int idreservas) {
		return dao.findById(idreservas);
	}

	@Override
	public Reservas findByNombre(String nombre) {
		return dao.findByNombre(nombre);
	}

	@Override
	public void saveReservas(Reservas reservas) {
		dao.saveReservas(reservas);		
	}

	@Override
	public void updateReservas(Reservas reservas) {
		Reservas entity = dao.findById(reservas.getIdreservas());
		if(entity!=null){
			entity.setNombreproducto(reservas.getNombreproducto());
			entity.setCodigoproducto(reservas.getCodigoproducto());
			entity.setCantidad(reservas.getCantidad());
			entity.setDui(reservas.getDui());
			entity.setTelefono(reservas.getTelefono());
			entity.setFechafin(reservas.getFechafin());
			entity.setFechaini(reservas.getFechaini());
			entity.setNombre(reservas.getNombre());
			entity.setPrecio(reservas.getPrecio());
		}
	}

	@Override
	public void deleteReservas(int idreservas) {
		dao.deleteByID(idreservas);
	}

	@Override
	public List<Reservas> findAllReservas() {
		return dao.findAllReservas();
	}
	
	

}
