package fia.ues.sv.libues.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import fia.ues.sv.libues.dao.DetalleRetaceoDao;
import fia.ues.sv.libues.modelo.DetalleRetaceo;


@Repository("detalleretaceoDao")
public class DetalleRetaceoDaoImpl extends AbstractDao<Integer, DetalleRetaceo> implements DetalleRetaceoDao{

	@Override
	public DetalleRetaceo findById(int codigodetalleretaceo) {
		// TODO Auto-generated method stub
		
				
		DetalleRetaceo detalleRetaceo=getByKey(codigodetalleretaceo);					
		return detalleRetaceo;
	}

	@Override
	public DetalleRetaceo findByName(String nombreretaceo) {
		// TODO Auto-generated method stub
		
		
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombreretaceo", nombreretaceo));
        DetalleRetaceo detalleRetaceo=(DetalleRetaceo)crit.uniqueResult();
        return detalleRetaceo;	
		
	}

	@Override
	public void save(DetalleRetaceo detalleRetaceo) {
		// TODO Auto-generated method stub
		
		persist(detalleRetaceo);
	}

	@Override
	public void deleteById(int codigodetalleretaceo) {
		// TODO Auto-generated method stub
	
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigodetalleretaceo", codigodetalleretaceo));
		DetalleRetaceo detalleRetaceo=(DetalleRetaceo)crit.uniqueResult();
		delete(detalleRetaceo);
		
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleRetaceo> findAllRetaceos() {
		
			// TODO Auto-generated method stub
		
		
		   Criteria criteria = createEntityCriteria();		 
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
           List<DetalleRetaceo> detalleRetaceo = (List<DetalleRetaceo>) criteria.list();
 		   return detalleRetaceo;	
		 
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleRetaceo> findRetaceos(Integer codigo) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codigoretaceo"));
        criteria.add(Restrictions.eq("codigoretaceo", codigo)); 
       // criteria.add(Restrictions.("visible", true));
        List<DetalleRetaceo> detalleRetaceo = (List<DetalleRetaceo>) criteria.list();
        return detalleRetaceo; 
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleRetaceo> findRetaceosProducto(Integer codigoretaceo,Integer codigoproducto) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codigoretaceo"));
		
		/*EntityManager em = ...;
		CriteriaBuilder cb = em.getCriteriaBuilder();*/
		
        criteria.add(Restrictions.eq("codigoretaceo", codigoretaceo)); 
        criteria.add(Restrictions.eq("codigoproducto", codigoproducto));
        
        
       // criteria.add(Restrictions.("visible", true));
        List<DetalleRetaceo> detalleRetaceo = (List<DetalleRetaceo>) criteria.list();
        return detalleRetaceo; 
	}
	 
	

}
