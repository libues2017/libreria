package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import fia.ues.sv.libues.modelo.Reservas;

@Repository("reservasDao")
public class ReservasDaoImpl extends AbstractDao<Integer, Reservas> implements ReservasDao{
	
	@Override
	public Reservas findById(int id) {
		return getByKey(id);
	}

	@Override
	public Reservas findByNombre(String nombre) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombre", nombre));
        Reservas reservas = (Reservas) crit.uniqueResult();
        return reservas;
	}

	@Override
	public void saveReservas(Reservas reservas) {
		persist(reservas);		
	}

	@Override
	public void deleteByID(int idreservas) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("idreservas", idreservas));
        Reservas reservas = (Reservas) crit.uniqueResult();
        delete(reservas);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Reservas> findAllReservas() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("nombreproducto"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.        
        List<Reservas> reservas = (List<Reservas>) criteria.list();
		return reservas;
	}
	
	

}
