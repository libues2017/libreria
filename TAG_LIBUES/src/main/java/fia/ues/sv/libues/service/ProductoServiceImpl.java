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
	public Producto findByNombreProducto(String nombreProducto) {
		return dao.findByNombreProducto(nombreProducto);
	}
	
	@Override
	public Producto findByconsignacion(String consignacion) {
		return dao.findByconsignacion(consignacion);
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
		}
		
	}

	@Override
	public void updateprecioProducto(Integer codigoproducto,Double precio,Double costo,Integer existencia) {
		Producto producto = new Producto();
		Producto entity = dao.findByCodigoProducto(codigoproducto);
		if(entity !=null){
			
			entity.setCostounitario(costo);
			entity.setPrecio(precio);
			entity.setExistencia(existencia);
	
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
	public List<Producto> customSearch(Area area, Editorial editorial, Proveedor proveedor, TipoProducto tipoproducto,  Busqueda busqueda) {
		return dao.customSearch( area,  editorial,  proveedor, tipoproducto, busqueda);
	}
	
}
