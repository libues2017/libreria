package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Cotizacion;

@Repository("cotizacionDao")
public class CotizacionDaoImpl extends AbstractDao<Integer, Cotizacion> implements CotizacionDao{

	@Override
	public Cotizacion findById(int numeroCotizacion) {
		Cotizacion cotizacion = getByKey(numeroCotizacion);
		return cotizacion;
	}

	@Override
	public void save(Cotizacion cotizacion) {
		persist(cotizacion);
		
	}

	@Override
	public void deleteById(int numeroCotizacion) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("numeroCotizacion", numeroCotizacion));
		Cotizacion cotizacion = (Cotizacion)crit.uniqueResult();
		delete(cotizacion);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cotizacion> findAllCotizaciones() {
		Criteria criteria = createEntityCriteria();
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		//criteria.add(Restrictions.eq("estado", true));
		List<Cotizacion> cotizacion = (List<Cotizacion>) criteria.list();
		return cotizacion;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cotizacion> findCotizaciones(Integer codigo6) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("numeroCotizacion"));
		criteria.add(Restrictions.eq("numeroCotizacion", codigo6));
		List<Cotizacion> cotizacion = (List<Cotizacion>) criteria.list();
		return cotizacion;
	}

}
