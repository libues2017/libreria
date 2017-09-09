package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Autor;
import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.Editorial;
import fia.ues.sv.libues.modelo.Area;

@Repository("productoDao")
public class ProductoDaoImpl extends AbstractDao<Integer, Producto>  implements ProductoDao{

	@Override
	public Producto findByCodigoProducto(int codigoProducto) {
		Producto producto = getByKey(codigoProducto);
		if(producto !=null ){
			Hibernate.initialize(producto.getArea());
			Hibernate.initialize(producto.getCodigoProducto());
			Hibernate.initialize(producto.getEditorial());
			Hibernate.initialize(producto.getTipoProducto());
			Hibernate.initialize(producto.getAutores());
		}
		return producto;
	}

	@Override
	public Producto findByNombreProducto(String nombreProducto) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.like("nombreProducto", nombreProducto));
        Producto producto = (Producto) crit.uniqueResult();
        return producto;
	}

	@Override
	public void saveProducto(Producto producto) {
		persist(producto);	
		
	}

	@Override
	public void deleteByCodigoProducto(int codigoProducto) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("codigoProducto", codigoProducto));
        Producto producto = (Producto) crit.uniqueResult();
        delete(producto);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Producto> findAllProductos() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("nombreProducto"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Producto> productos = (List<Producto>) criteria.list();
        
        for(Producto producto : productos){
        	Hibernate.initialize(producto.getTipoProducto());
        	Hibernate.initialize(producto.getArea());
			Hibernate.initialize(producto.getProveedor());
			Hibernate.initialize(producto.getEditorial());
			Hibernate.initialize(producto.getAutores());
        }
        
        return productos;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Producto> findAllByAutor(Autor autor) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("nombreProducto"));
		criteria.createAlias("autores", "ListaAutores");
		criteria.add(Restrictions.like("ListaAutores.nombre", autor.getNombreautor()));
       // criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Producto> productos = (List<Producto>) criteria.list();
        
        for(Producto producto : productos){
        	Hibernate.initialize(producto.getAutores());
        	Hibernate.initialize(producto.getEditorial());
        	Hibernate.initialize(producto.getArea());
        	Hibernate.initialize(producto.getProveedor());
        	Hibernate.initialize(producto.getTipoProducto());
        }
        
        return productos;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Producto> customSearch(Area area, Editorial editorial, Autor autor, Busqueda busqueda) {
		List<Producto> productos = null;
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("nombreProducto"));
		
		if(busqueda.getCodigoautor()==0){
			//no restricciones de autor
			if(busqueda.getCodigoeditorial()==0){
				//no restricciones de editorial
				if(busqueda.getCodigoarea()==0){
					//no restricciones de areas
				}else{
					//Restricciones de areas
					criteria.add(Restrictions.eq("Area", area));
				}
				
			}else{
				//Restricciones de Editorial
				criteria.add(Restrictions.eq("Editorial", editorial));
				if(busqueda.getCodigoarea()==0){
					//no restricciones de areas
				}else{
					//Restricciones de areas
				criteria.add(Restrictions.eq("Area",area));
				}
			}
		}else{
			criteria.createAlias("autores", "ListaAutores");
			criteria.add(Restrictions.eq("ListaAutores.id", autor.getCodigoautor()));
			if(busqueda.getCodigoeditorial()==0){
				//no restricciones de editorial
				if(busqueda.getCodigoarea()==0){
					//no restricciones de areas
				}else{
					//Restricciones de areas
					criteria.add(Restrictions.eq("Area", area));
				}
				
			}else{
				//Restricciones de Editorial
				criteria.add(Restrictions.eq("Editorial", editorial));
				if(busqueda.getCodigoarea()==0){
					//no restricciones de areas
				}else{
					criteria.add(Restrictions.eq("Area", area));
				}
			}
		}
		productos = (List<Producto>) criteria.list();
		for(Producto producto : productos){
        	Hibernate.initialize(producto.getAutores());
        	Hibernate.initialize(producto.getEditorial());
        	Hibernate.initialize(producto.getArea());
        }
		
		System.out.println(productos);//busqueda funciona
		return productos;
	}
	
	
}

