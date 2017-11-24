package fia.ues.sv.libues.service;

import java.util.List;

import fia.ues.sv.libues.modelo.Proveedor;

public interface ProveedorService {
	
	Proveedor findById(int codigoproveedor);
	
	Proveedor findByNombre(String nombreproveedor);
	
	void saveProveedor(Proveedor proveedor);
	
	void updateProveedor(Proveedor proveedor);
	
	void deleteProveedor(int codigoproveedor);
	
	List<Proveedor> findAllProveedores();
	
	List<Proveedor> findAllProveedoresDeleted();
	
	void estadoBorrarProveedorById(Integer codigoproveedor);
	
	void estadoRestaurarProveedorById(Integer codigoproveedor);

}

