package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Proveedor;

@Repository("proveedorDao")
public class ProveedorDaoImpl extends AbstractDao<Integer, Proveedor> implements ProveedorDao {

	
	//Metodo para buscar Proveedores por medio de su Id
	@Override
	public Proveedor findById(int codigoproveedor) {	
		Proveedor proveedor = getByKey(codigoproveedor);
		return proveedor;
	}

	
	//Metodo para buscar Proveedores por nombre de Proveedor
	@Override
	public Proveedor findByNombre(String nombreproveedor) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombreproveedor", nombreproveedor));
        Proveedor proveedor = (Proveedor) crit.uniqueResult();
        return proveedor;
	}

	//Metodo para guardar proveedor
	@Override
	public void saveProveedor(Proveedor proveedor) {
		persist(proveedor);
		
	}

	
	//Metodo para eliminar proveedor por Id
	@Override
	public void deleteByID(int codigoproveedor) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigoproveedor", codigoproveedor));
        Proveedor proveedor = (Proveedor) crit.uniqueResult();
        delete(proveedor);
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Proveedor> findAllProveedores() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("nombreproveedor"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        criteria.add(Restrictions.eq("estado", true));
        List<Proveedor> proveedor = (List<Proveedor>) criteria.list();
		return proveedor;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Proveedor> findAllProveedoresDeleted() {
		Criteria criteria = createEntityCriteria().addOrder(Order.desc("codigoproveedor"));
		        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		        criteria.add(Restrictions.eq("estado", false));
		        List<Proveedor> proveedor = (List<Proveedor>) criteria.list();
		 		return proveedor;
	}

}//Fin de la Clase
