package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.Etiqueta;

@Repository("etiquetaDao")

public class EtiquetaDaoImpl extends AbstractDao<Integer, Etiqueta> implements EtiquetaDao {

	@Override
	public Etiqueta findById(int codigoetiqueta) {
		// TODO Auto-generated method stub
		
		Etiqueta etiqueta = getByKey(codigoetiqueta);
		return etiqueta;
		
	}

	@Override
	public void saveEtiqueta(Etiqueta etiqueta) {
		
		persist(etiqueta);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEtiquetaById(int codigoetiqueta) {
		
		
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigoetiqueta", codigoetiqueta));
        Etiqueta etiqueta = (Etiqueta) crit.uniqueResult();
        delete(etiqueta);
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Etiqueta> findAllEtiquetas() {
		// TODO Auto-generated method stub
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codigoetiqueta"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
       // criteria.add(Restrictions.eq("estado", true));
        List<Etiqueta> etiqueta = (List<Etiqueta>) criteria.list();
 		return etiqueta;
	}

}
