package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import fia.ues.sv.libues.dao.DetalleTransferenciaDao;
import fia.ues.sv.libues.modelo.DetalleTransferencia;

@Repository("detalletransferenciaDao")
public class DetalleTransferenciaDaoImpl extends AbstractDao<Integer, DetalleTransferencia> implements DetalleTransferenciaDao{

	@Override
	public DetalleTransferencia findById(int codDetalleTransferencia) {
		DetalleTransferencia detalleTransferencia = getByKey(codDetalleTransferencia);					
		return detalleTransferencia;
	}

	@Override
	public DetalleTransferencia findByName(String nombreTransferencia) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("nombreTransferencia", nombreTransferencia));
        DetalleTransferencia detalleTransferencia = (DetalleTransferencia)crit.uniqueResult();
        return detalleTransferencia;
	}

	@Override
	public void save(DetalleTransferencia detalleTransferencia) {
		persist(detalleTransferencia);
		
	}

	@Override
	public void deleteById(int codDetalleTransferencia) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codDetalleTransferencia", codDetalleTransferencia));
		DetalleTransferencia detalleTransferencia = (DetalleTransferencia)crit.uniqueResult();
		delete(detalleTransferencia);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleTransferencia> findAllTransferencias() {
		Criteria criteria = createEntityCriteria();		 
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        List<DetalleTransferencia> detalleTransferencia = (List<DetalleTransferencia>) criteria.list();
		return detalleTransferencia;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleTransferencia> findTransferencias(Integer codigo1) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codTransferencia"));
        criteria.add(Restrictions.eq("codTransferencia", codigo1)); 
        List<DetalleTransferencia> detalleTransferencia = (List<DetalleTransferencia>) criteria.list();
        return detalleTransferencia; 
	}

	@Override
	public DetalleTransferencia findByCodigo(Integer codTransferencia) {
		DetalleTransferencia detalletransferencia = getByKey(codTransferencia);					
		return detalletransferencia;
	}

}
