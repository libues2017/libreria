package fia.ues.sv.libues.service;

import java.util.List;
import fia.ues.sv.libues.modelo.Reservas;

public interface ReservasService {
	
	Reservas findById(int idreservas);
	
	Reservas findByNombre(String nombre);
	
	void saveReservas(Reservas reservas);
	
	void updateReservas(Reservas reservas);
	
	void deleteReservas(int idreservas);
	
	List<Reservas> findAllReservas();

}
