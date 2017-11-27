package fia.ues.sv.libues.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

//import fia.ues.sv.libues.dao.AreaDao;
import fia.ues.sv.libues.modelo.Area;

@Repository("areaDao")
public class AreaDaoImpl extends AbstractDao<Integer, Area> implements AreaDao {

	@Override
	public Area findById(int codigoarea) {
		Area area = getByKey(codigoarea);
		return area;	
	}

	@Override
	public Area findByName(String nombrearea) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombrearea", nombrearea));
        Area area = (Area) crit.uniqueResult();
		return area;	
		
	}

	@Override
	public void save(Area area) {
		persist(area);
		
	}

	@Override
	public void deleteById(int codigoarea) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigoarea", codigoarea));
        Area area = (Area) crit.uniqueResult();
        delete(area);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Area> findAllAreas() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codigoarea"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        criteria.add(Restrictions.eq("estado", true));
        List<Area> area = (List<Area>) criteria.list();
 		return area;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Area> findAllAreasDeleted() {
		Criteria criteria = createEntityCriteria().addOrder(Order.desc("codigoarea"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        //criteria.add(Restrictions.eq("estado", false));
        List<Area> area = (List<Area>) criteria.list();
 		return area;
	}
	
	

}

