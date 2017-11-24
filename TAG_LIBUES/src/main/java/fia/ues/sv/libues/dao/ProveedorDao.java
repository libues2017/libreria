package fia.ues.sv.libues.dao;

import java.util.List;
import fia.ues.sv.libues.modelo.Proveedor;

public interface ProveedorDao {
	
	Proveedor findById(int codigoproveedor);
	
	Proveedor findByNombre(String nombreproveedor);
	
	void saveProveedor(Proveedor proveedor);
	
	void deleteByID(int codigoproveedor);
	
	List<Proveedor> findAllProveedores();
	
	List<Proveedor> findAllProveedoresDeleted();

}