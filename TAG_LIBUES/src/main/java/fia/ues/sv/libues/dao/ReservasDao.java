package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.Reservas;

public interface ReservasDao {
	
	Reservas findById(int idreservas);
	
	Reservas findByNombre(String nombre);
	
	void saveReservas(Reservas reservas);
	
	void deleteByID(int idreservas);
	
	List<Reservas> findAllReservas();

}
