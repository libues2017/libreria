package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.DetalleRequisicion;
import fia.ues.sv.libues.modelo.FacturaDetalle;

@Repository("facturadetalleDao")
public class FacturaDetalleDaoImpl extends AbstractDao<Integer, FacturaDetalle> implements FacturaDetalleDao{

	@Override
	public FacturaDetalle findById(int iddetalle) {
		FacturaDetalle facturadetalle=getByKey(iddetalle);					
		return facturadetalle;
	}

	@Override
	public FacturaDetalle findByCodigo(int codigofactura) {
		 FacturaDetalle detallefact = getByKey(codigofactura);					
		return detallefact;
	}

	@Override
	public FacturaDetalle findByName(String nombreproducto) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombreproducto", nombreproducto));
        FacturaDetalle facturadetalle=(FacturaDetalle)crit.uniqueResult();
        return facturadetalle;
	}

	@Override
	public void save(FacturaDetalle facturadetalle) {
		persist(facturadetalle);
	}

	@Override
	public void deleteById(int iddetalle) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("iddetalle", iddetalle));
        FacturaDetalle facturadetalle = (FacturaDetalle)crit.uniqueResult();
		delete(facturadetalle);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FacturaDetalle> findAllFacturas() {
		Criteria criteria = createEntityCriteria();		 
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<FacturaDetalle> facturadetalle = (List<FacturaDetalle>) criteria.list();
		return facturadetalle;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FacturaDetalle> findFacturas(Integer iddetalle) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("idfactura"));
        criteria.add(Restrictions.eq("idfactura", iddetalle));        
        List<FacturaDetalle> facturadetalle = (List<FacturaDetalle>) criteria.list();
        return facturadetalle; 
	}
	
	
}
