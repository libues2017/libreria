package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.TipoProducto;

@Repository("tipoproductoDao")
public class TipoProductoDaoImpl extends AbstractDao<Integer, TipoProducto> implements TipoProductoDao{

	@Override
	public TipoProducto findByCodTipoProducto(int codTipoProducto) {
		TipoProducto tipo = getByKey(codTipoProducto);
		return tipo;
	}

	@Override
	public TipoProducto findByTipoProducto(String tipoProducto) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("tipoProducto", tipoProducto));
        TipoProducto tipo = (TipoProducto) crit.uniqueResult();
		return tipo;
	}

	@Override
	public void save(TipoProducto tipoProducto) {
		persist(tipoProducto);
		
	}

	@Override
	public void deleteByCodTipoProducto(int codTipoProducto) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codTipoProducto", codTipoProducto));
        TipoProducto tipo = (TipoProducto) crit.uniqueResult();
        delete(tipo);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoProducto> findAllTipoProductos() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("tipoProducto"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<TipoProducto> tipo = (List<TipoProducto>) criteria.list();
 		return tipo;
	}

}

