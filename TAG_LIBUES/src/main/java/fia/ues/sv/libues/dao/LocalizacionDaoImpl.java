package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Localizacion;

@Repository("localizacionDao")
public class LocalizacionDaoImpl extends AbstractDao<Integer, Localizacion> implements LocalizacionDao{

	@Override
	public Localizacion findById(int idlocalizacion) {
		return getByKey(idlocalizacion);
	}

	@Override
	public Localizacion findByNombre(String nombreprod) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombreprod", nombreprod));
        Localizacion localizacion = (Localizacion) crit.uniqueResult();
        return localizacion;
	}

	@Override
	public void saveLocalizacion(Localizacion localizacion) {
		persist(localizacion);
		
	}

	@Override
	public void deleteById(int idlocalizacion) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("idlocalizacion", idlocalizacion));
        Localizacion localizacion = (Localizacion) crit.uniqueResult();
        delete(localizacion);		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Localizacion> findAllLocalizaciones() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("nombreprod"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Localizacion> localizaciones = (List<Localizacion>) criteria.list();
		return localizaciones;
	}

}
