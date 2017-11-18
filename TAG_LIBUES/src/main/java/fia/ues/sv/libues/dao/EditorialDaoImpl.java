package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

//import fia.ues.sv.libues.dao.AbstractDao;
//import fia.ues.sv.libues.dao.EditorialDao;
import fia.ues.sv.libues.modelo.Editorial;

@Repository("editorialDao")
public class EditorialDaoImpl extends AbstractDao<Integer, Editorial> implements EditorialDao {

	@Override
	public Editorial findById(int id) {
		return getByKey(id);
	}

	@Override
	public Editorial findByNombre(String nombre) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombre", nombre));
        Editorial editorial = (Editorial) crit.uniqueResult();
        return editorial;
	}

	@Override
	public void saveEditorial(Editorial editorial) {
		persist(editorial);
		
	}

	@Override
	public void deleteByID(int codigoeditorial) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigoeditorial", codigoeditorial));
        Editorial editorial = (Editorial) crit.uniqueResult();
        delete(editorial);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Editorial> findAllEditoriales() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codigoespecifico"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        criteria.add(Restrictions.eq("estado", true));
        List<Editorial> editoriales = (List<Editorial>) criteria.list();
		return editoriales;
	}

	
}

