package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Ajuste;

@Repository("ajusteDao")
public class AjusteDaoImpl extends AbstractDao<Integer, Ajuste> implements AjusteDao{

	@Override
	public Ajuste findById(int codigoajuste) {
		// TODO Auto-generated method stub
		
		Ajuste ajuste = getByKey(codigoajuste);
		return ajuste;
	}

	@Override
	public void save(Ajuste ajuste) {
		// TODO Auto-generated method stub
		
		persist(ajuste);		
	}

	@Override
	public void deleteById(int codigoajuste) {
		// TODO Auto-generated method stub
		
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigoajuste", codigoajuste));
        Ajuste ajuste = (Ajuste) crit.uniqueResult();
        delete(ajuste);
		
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Ajuste> findAllAjuste() {
		// TODO Auto-generated method stub
		
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codigoajuste"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
       // criteria.add(Restrictions.eq("estado", true));
        List<Ajuste> ajuste = (List<Ajuste>) criteria.list();
 		return ajuste;
		
	}

}
