package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.DetalleCotizacion;

@Repository("detallecotizacionDao")
public class DetalleCotizacionImpl extends AbstractDao<Integer, DetalleCotizacion> implements DetalleCotizacionDao{

	@Override
	public DetalleCotizacion findById(int numeroDetalle) {
		DetalleCotizacion detalleCotizacion = getByKey(numeroDetalle);
		return detalleCotizacion;
	}

	@Override
	public DetalleCotizacion findByCodigo(int codigoCotizacion) {
		DetalleCotizacion detalleCot = getByKey(codigoCotizacion);
		return detalleCot;
	}

	@Override
	public DetalleCotizacion findByNombre(String nombreProducto) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("nombreProducto", nombreProducto));
		DetalleCotizacion detalleCotizacion = (DetalleCotizacion)crit.uniqueResult();
		return detalleCotizacion;
	}

	@Override
	public void save(DetalleCotizacion detalleCotizacion) {
		persist(detalleCotizacion);
		
	}

	@Override
	public void deleteById(int numeroDetalle) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("numeroDetalle", numeroDetalle));
		DetalleCotizacion detalleCotizacion = (DetalleCotizacion)crit.uniqueResult();
		delete(detalleCotizacion);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleCotizacion> findAllCotizaciones() {
		Criteria crite = createEntityCriteria();
		crite.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<DetalleCotizacion> detalleCotizacion = (List<DetalleCotizacion>) crite.list();
		return detalleCotizacion;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleCotizacion> findCotizaciones(Integer numeroDetalle) {
		Criteria crite = createEntityCriteria().addOrder(Order.asc("numeroDetalle"));
		crite.add(Restrictions.eq("numeroDetalle", numeroDetalle));
		List<DetalleCotizacion> detalleCotizacion = (List<DetalleCotizacion>) crite.list();
		return detalleCotizacion;
	}

}
