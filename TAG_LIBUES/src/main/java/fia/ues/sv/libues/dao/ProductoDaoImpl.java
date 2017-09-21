package fia.ues.sv.libues.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import fia.ues.sv.libues.modelo.Autor;
import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.Proveedor;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.Editorial;
import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.TipoProducto;

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
	public Producto findByconsignacion(String consignacion) {
		Criteria crit = createEntityCriteria();
        crit.add(Restrictions.like("consignacion", consignacion));
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
	public List<Producto> customSearch(Area area, Editorial editorial, Proveedor proveedor, TipoProducto tipoproducto, Busqueda busqueda) {
		List<Producto> productos = null;
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("nombreProducto"));
		
		if(busqueda.getCodigoproveedor()==0)
		{
			//no restricciones de proveedor
			if(busqueda.getCodigoeditorial()==0)
			{
			 //Restricciones de Editorial
			 if(busqueda.getCodigoarea()==0)
			  {
			    //no restricciones de areas
			    if(busqueda.getCodTipoProducto()==0)
				 {
				  //no restricciones tipo producto
				 }
			    else
				 {
				   //restricciones tipo producto
				   criteria.add(Restrictions.eq("TipoProducto", tipoproducto));
			 	 }
			  }//Fin de "if" Area					
			 else
			  {
			    //Restricciones de areas
			    criteria.add(Restrictions.eq("Area",area));
			    if(busqueda.getCodTipoProducto()==0)
			     {
				   //no restricciones tipo producto
			     }
				else
				{
				  //restriccion de tipo producto
				  criteria.add(Restrictions.eq("TipoProducto", tipoproducto));
				}
			  }//Fin del "ELSE" area
		   }//Fin de  "if" Editorial
			else
			 {	
			  criteria.add(Restrictions.eq("Editorial", editorial));
			  if(busqueda.getCodigoarea()==0)
			   {
			     //no restricciones de areas
			     if(busqueda.getCodTipoProducto()==0)
				  {
				   //no restricciones tipo producto
				  }
			     else
				  {
				    //restricciones tipo producto
				    criteria.add(Restrictions.eq("TipoProducto", tipoproducto));
			 	  }
			   }//Fin "if" de Area					
			  else
			   {
			     //Restricciones de areas
			     criteria.add(Restrictions.eq("Area",area));
			     if(busqueda.getCodTipoProducto()==0)
			      {
				    //no restricciones tipo producto
			      }
				 else
				 {
				   //restriccion de tipo producto
				   criteria.add(Restrictions.eq("TipoProducto", tipoproducto));
				 }
			  }//Fin "ELSE" Areas
		   }//Fin "ELSE" editoriales 
		}// Fin "IF" proveedores 
		else
		{
			criteria.createAlias("Proveedor", "ListaProveedores");
			criteria.add(Restrictions.eq("ListaProveedores.id", proveedor.getCodigoproveedor()));
			if(busqueda.getCodigoeditorial()==0)
			{
			 //Restricciones de Editorial
			 if(busqueda.getCodigoarea()==0)
			  {
			    //no restricciones de areas
			    if(busqueda.getCodTipoProducto()==0)
				 {
				  //no restricciones tipo producto
				 }
			    else
				 {
				   //restricciones tipo producto
				   criteria.add(Restrictions.eq("TipoProducto", tipoproducto));
			 	 }
			  }//Fin de "if" Area					
			 else
			  {
			    //Restricciones de areas
			    criteria.add(Restrictions.eq("Area",area));
			    if(busqueda.getCodTipoProducto()==0)
			     {
				   //no restricciones tipo producto
			     }
				else
				{
				  //restriccion de tipo producto
				  criteria.add(Restrictions.eq("TipoProducto", tipoproducto));
				}
			  }// Fin "ELSE" area
		   }//Fin de  "if" Editorial
			else
			 {	
			  criteria.add(Restrictions.eq("Editorial", editorial));
			  if(busqueda.getCodigoarea()==0)
			   {
			     //no restricciones de areas
			     if(busqueda.getCodTipoProducto()==0)
				  {
				   //no restricciones tipo producto
				  }
			     else
				  {
				    //restricciones tipo producto
				    criteria.add(Restrictions.eq("TipoProducto", tipoproducto));
			 	  }
			   }//Fin "if" de Area					
			  else
			   {
			     //Restricciones de areas
			     criteria.add(Restrictions.eq("Area",area));
			     if(busqueda.getCodTipoProducto()==0)
			      {
				    //no restricciones tipo producto
			      }
				 else
				 {
				   //restriccion de tipo producto
				   criteria.add(Restrictions.eq("TipoProducto", tipoproducto));
				 }
			  }//Fin "ELSE" Areas
		   }//Fin "ELSE" editoriales 
		}// Fin "ELSE" proveedores 
		
		
		
			productos = (List<Producto>) criteria.list();
			for(Producto producto : productos){
        	Hibernate.initialize(producto.getProveedor());
        	Hibernate.initialize(producto.getEditorial());
        	Hibernate.initialize(producto.getArea());
        	Hibernate.initialize(producto.getTipoProducto());
      }
		
		System.out.println(productos);//busqueda funciona
		return productos;
	}
}