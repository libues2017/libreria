package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Factura;

@Repository("facturaDao")
public class FacturaDaoImpl extends AbstractDao<Integer, Factura> implements FacturaDao{

	@Override
	public Factura findById(int idfactura) {
		Factura factura = getByKey (idfactura);
		return factura;
	}

	@Override
	public void save(Factura factura) {
		persist(factura);
	}

	@Override
	public void deleteById(int idfactura) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("idfactura", idfactura));
        Factura factura = (Factura)crit.uniqueResult();
		delete(factura);		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Factura> findAllFacturas() {
		Criteria criteria = createEntityCriteria();		 
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Factura> factura = (List<Factura>) criteria.list();
		return factura;	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Factura> findFacturas(Integer codigofac) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("idfactura"));
        criteria.add(Restrictions.eq("idfactura", codigofac));
        List<Factura> factura = (List<Factura>) criteria.list();
        return factura; 
	}

	
}
