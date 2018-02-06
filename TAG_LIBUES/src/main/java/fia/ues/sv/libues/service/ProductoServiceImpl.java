package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fia.ues.sv.libues.dao.ProductoDao;
import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.Editorial;
import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.Proveedor;
import fia.ues.sv.libues.modelo.TipoProducto;
import fia.ues.sv.libues.modelo.Autor;

@Service("productoService")
@Transactional
public class ProductoServiceImpl implements ProductoService{

	@Autowired
	private ProductoDao dao;
	
	@Override
	public Producto findByCodigoProducto(int codigoProducto) {
		return dao.findByCodigoProducto(codigoProducto);
	}
	
	@Override
	public Producto findByCorrelativo(int correlativo) {
		return dao.findByCorrelativo(correlativo);
	}

	@Override
	public Producto findByNombreProducto(String nombreProducto) {
		return dao.findByNombreProducto(nombreProducto);
	}
	
	@Override
	public void saveProducto(Producto producto) {
		dao.saveProducto(producto);
	}

	@Override
	public void updateProducto(Producto producto) {
		Producto entity = dao.findByCodigoProducto(producto.getCodigoProducto());
		if(entity !=null){
			entity.setNombreProducto(producto.getNombreProducto());
			entity.setExistencia(producto.getExistencia());
			entity.setUnidadMinima(producto.getUnidadMinima());
			entity.setCorrelativo(producto.getCorrelativo());
			entity.setIsbn(producto.getIsbn());
			entity.setFechaCreacion(producto.getFechaCreacion());
			entity.setPrecio(producto.getPrecio());
			entity.setEspecificoGastos(producto.getEspecificoGastos());
			entity.setConsignacion(producto.getConsignacion());
			entity.setProveedorAnterior(producto.getProveedorAnterior());
			entity.setEditorial(producto.getEditorial());
			entity.setArea(producto.getArea());
			entity.setCostounitario(producto.getCostounitario());
			entity.setProveedor(producto.getProveedor());
			entity.setAutores(producto.getAutores());
			entity.setTipoProducto(producto.getTipoProducto());
			entity.setUnidadMedida(producto.getUnidadMedida());;
			entity.setPais(producto.getPais());
			entity.setSala(producto.getSala());
			if(producto.getLocation()!=""){
				entity.setLocation(producto.getLocation());
				entity.setImagen(producto.getImagen());
			}
			
			if(producto.getLocationc()!=""){
				entity.setLocationc(producto.getLocationc());
				entity.setImagenc(producto.getImagenc());
			}
		}
		
	}

	@Override
	public void updateprecioProducto(Integer codigoproducto,Double precio,Double costo,Integer existencia,Integer cantidadetiquetar,Integer marcado) {
		//Producto producto = new Producto();
		Producto entity = dao.findByCorrelativo(codigoproducto);
		if(entity !=null){			
			entity.setCostounitario(costo);
			entity.setPrecio(precio);
			entity.setExistencia(existencia);	
			entity.setCantidadetiquetar(cantidadetiquetar);
			entity.setMarcado(marcado);
			
		}		
	}
	
	
	@Override
	public void updatedesmarcarProducto(Integer codigoproducto,Integer cantidadetiquetar,Integer marcado) {
		//Producto producto = new Producto();
		Producto entity = dao.findByCorrelativo(codigoproducto);
		if(entity !=null){			
				
			entity.setCantidadetiquetar(cantidadetiquetar);
			entity.setMarcado(marcado);
			
		}		
	}
	
	
	
	@Override
	public void updateExistencia(Integer codigoproducto, Integer existencia, Integer sala) {		
		Producto entity = dao.findByCorrelativo(codigoproducto);
		if(entity !=null){		
			entity.setExistencia(existencia);
			entity.setSala(sala);	
		}		
	}
	
	
	
	
	
	
	@Override
	public void deleteByCodigoProducto(int codigoProducto) {
		dao.deleteByCodigoProducto(codigoProducto);
		
	}

	@Override
	public List<Producto> findAllProductos() {
		return dao.findAllProductos();
	}

	@Override
	public List<Producto> customSearch(Area area, Editorial editorial, Proveedor proveedor, TipoProducto tipoproducto, Autor autor, Busqueda busqueda) {
		return dao.customSearch( area,  editorial,  proveedor, tipoproducto, autor, busqueda);
	}
	
	@Override
	public List<Producto> customSearchProducto(Producto producto1,Area area, Editorial editorial, Proveedor proveedor, TipoProducto tipoproducto, Autor autor, Busqueda busqueda) {
		return dao.customSearchProducto(producto1, area, editorial, proveedor, tipoproducto, autor, busqueda);
	}	


	@Override
	public void updatePrecioProducto1(Integer codProducto, Double precio, Double costo, Integer existencia) {
		Producto entity = dao.findByCorrelativo(codProducto);
		if(entity !=null){			
			entity.setCostounitario(costo);
			entity.setPrecio(precio);
			entity.setExistencia(existencia);	
		}	
		
	}

	@Override
	public void updateExistencia1(Integer codProducto, Integer existencia,String ubicacion) {
		Producto entity = dao.findByCorrelativo(codProducto);
		if(entity !=null){
			String sala="sala";
			if(ubicacion.equals(sala)){
			
			entity.setSala(existencia);//si ubicacion es sala
		}
			else{
				
				entity.setExistencia(existencia);
			}
		}
		
	}
	
	
	@Override
	public void updateSala(Integer codProducto, Integer sala) {
		Producto entity = dao.findByCorrelativo(codProducto);
		if(entity !=null){
			entity.setExistencia(sala);	
		}	
		
	}
	
	
	
	@Override
	public void updateSalaVenta1(Integer codigoproducto, Integer sala) {
		Producto entity = dao.findByCorrelativo(codigoproducto);
		if(entity !=null){
			entity.setSala(sala);	
		}
		
	}

	@Override
	public void updateReserva(Integer codigo, Integer sala) {
		Producto entity = dao.findByCodigoProducto(codigo);
		if(entity != null){
			entity.setSala(sala);
		}
		
	}

	@Override
	public void updateReservaRestaurar(Integer cod, Integer sala) {
		Producto entity = dao.findByCorrelativo(cod);
		if(entity != null){
			entity.setSala(sala);
		}
		
	}	
	
}
