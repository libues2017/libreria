package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import fia.ues.sv.libues.modelo.Retaceo;


@Repository("retaceoDao")
public class RetaceoDaoImpl extends AbstractDao<Integer, Retaceo> implements RetaceoDao{

	@Override
	public Retaceo findById(int codigoretaceo) {
		// TODO Auto-generated method stub
		
				
		Retaceo retaceo=getByKey(codigoretaceo);					
		return retaceo;
	}

	
	@Override
	public void save(Retaceo retaceo) {
		// TODO Auto-generated method stub
		
		persist(retaceo);
	}

	@Override
	public void deleteById(int codigoretaceo) {
		// TODO Auto-generated method stub
	
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigoretaceo", codigoretaceo));
		Retaceo retaceo=(Retaceo)crit.uniqueResult();
		delete(retaceo);
		
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Retaceo> findAllRetaceos() {
		
			// TODO Auto-generated method stub
		
		
		  Criteria criteria = createEntityCriteria();		 
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
           List<Retaceo> retaceo = (List<Retaceo>) criteria.list();
 		   return retaceo;	
		 
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Retaceo> findRetaceos(Integer codigo) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codigoretaceo"));
        criteria.add(Restrictions.eq("codigoretaceo", codigo)); 
       // criteria.add(Restrictions.("visible", true));
        List<Retaceo> retaceo = (List<Retaceo>) criteria.list();
        return retaceo; 
	}
	 
	

}
