package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import fia.ues.sv.libues.modelo.Requisicion;

@Repository("requisicionDao")
public class RequisicionDaoImpl extends AbstractDao<Integer, Requisicion> implements RequisicionDao{

	@Override
	public Requisicion findById(int codigorequisicion) {		
		
		Requisicion requisicion=getByKey(codigorequisicion);					
		return requisicion;
	}

	@Override
	public void save(Requisicion requisicion) {
		persist(requisicion);
		
	}

	@Override
	public void deleteById(int codigorequisicion) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigorequisicion", codigorequisicion));
        Requisicion requisicion=(Requisicion)crit.uniqueResult();
		delete(requisicion);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Requisicion> findAllRequisiciones() {
		Criteria criteria = createEntityCriteria();		 
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        criteria.add(Restrictions.eq("estado", true));
        List<Requisicion> requisicion = (List<Requisicion>) criteria.list();
		return requisicion;	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Requisicion> findRequisiciones(Integer codigo2) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codigorequisicion"));
        criteria.add(Restrictions.eq("codigorequisicion", codigo2)); 
        List<Requisicion> requisicion = (List<Requisicion>) criteria.list();
        return requisicion; 
	}

}
