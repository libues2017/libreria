package fia.ues.sv.libues.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import fia.ues.sv.libues.modelo.DetalleRequisicion;


@Repository("detallerequisicionDao")
public class DetalleRequisicionDaoImpl extends AbstractDao<Integer, DetalleRequisicion> implements DetalleRequisicionDao{

	@Override
	public DetalleRequisicion findById(int codigodetalle) {
		
		DetalleRequisicion detallerequisicion=getByKey(codigodetalle);					
		return detallerequisicion;
	}
	
	@Override
	public DetalleRequisicion findByCodigo(int codigoreq) {
		
		DetalleRequisicion detallereq=getByKey(codigoreq);					
		return detallereq;
	}

	@Override
	public DetalleRequisicion findByName(String nombreproducto) {
		
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombreproducto", nombreproducto));
        DetalleRequisicion detallerequisicion=(DetalleRequisicion)crit.uniqueResult();
        return detallerequisicion;
	}

	@Override
	public void save(DetalleRequisicion detallerequisicion) {
		persist(detallerequisicion);
		
	}

	@Override
	public void deleteById(int codigodetalle) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigodetalle", codigodetalle));
		DetalleRequisicion detallerequisicion=(DetalleRequisicion)crit.uniqueResult();
		delete(detallerequisicion);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleRequisicion> findAllRequisiciones() {
		Criteria criteria = createEntityCriteria();		 
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<DetalleRequisicion> detallerequisicion = (List<DetalleRequisicion>) criteria.list();
		   return detallerequisicion;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleRequisicion> findRequisiciones(Integer codigodetalle) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codigorequisicion"));
        criteria.add(Restrictions.eq("codigorequisicion", codigodetalle)); 
       // criteria.add(Restrictions.("visible", true));
        List<DetalleRequisicion> detallerequisicion = (List<DetalleRequisicion>) criteria.list();
        return detallerequisicion; 
	}
	
	

}
