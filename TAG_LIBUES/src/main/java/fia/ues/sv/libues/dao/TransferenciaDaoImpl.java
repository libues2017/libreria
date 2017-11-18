package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Transferencia;

@Repository("transferenciaDao")
public class TransferenciaDaoImpl extends AbstractDao<Integer, Transferencia> implements TransferenciaDao{

	@Override
	public Transferencia findById(int codTransferencia) {
		Transferencia transferencia = getByKey(codTransferencia);
		return transferencia;
	}

	@Override
	public void save(Transferencia transferencia) {
		persist(transferencia);
		
	}

	@Override
	public void deleteById(int codTransferencia) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("codTransferencia", codTransferencia));
		Transferencia transferencia = (Transferencia)crit.uniqueResult();
		delete(transferencia);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Transferencia> findAllTransferencias() {
		Criteria criteria = createEntityCriteria();
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		criteria.add(Restrictions.eq("estado", true));
		List<Transferencia> transferencia = (List<Transferencia>) criteria.list();
		return transferencia;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Transferencia> findTransferencias(Integer codigo1) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("codTransferencia"));
		criteria.add(Restrictions.eq("codTransferencia", codigo1));
		List<Transferencia> transferencia = (List<Transferencia>) criteria.list();
		return transferencia;
	}

}
