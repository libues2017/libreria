package fia.ues.sv.libues.dao;

import fia.ues.sv.libues.modelo.Autor;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

//import fia.ues.sv.libues.dao.AutorDao;

@Repository("autorDao")
public class AutorDaoImpl extends AbstractDao<Integer, Autor> implements AutorDao {

	@Override
	public Autor findById(int codigoautor) {
		Autor autor = getByKey(codigoautor);
		return autor;
	}

	@Override
	public Autor findByName(String nombreautor) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombreautor", nombreautor));
        Autor autor = (Autor) crit.uniqueResult();
		return autor;
	}

	@Override
	public void saveAutor(Autor autor) {
		persist(autor);
		
	}

	@Override
	public void deleteById(int codigoautor) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigoautor", codigoautor));
        Autor autor = (Autor) crit.uniqueResult();
        delete(autor);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Autor> findAllAutors() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("nombreautor"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        criteria.add(Restrictions.eq("estado", true));
        List<Autor> autores = (List<Autor>) criteria.list();
 		return autores;
	}

}

