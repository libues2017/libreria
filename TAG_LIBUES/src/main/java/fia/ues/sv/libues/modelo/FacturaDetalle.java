package fia.ues.sv.libues.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="factura_detalle")
public class FacturaDetalle implements Serializable{
	
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idfacuradetalle;
	
	@Column(name="codigoproducto")
	private Integer codigoproducto;
	
	@Column(name="nombreproducto")
	private String nombreproducto;
	
	@Column(name="precio")
	private Double precio;
	
	@Column(name="cantidad")
	private Integer cantidad;
	
	@Column(name="subtotalfactura")
	private Double subtotalfactura;

	public Integer getIdfacuradetalle() {
		return idfacuradetalle;
	}

	public void setIdfacuradetalle(Integer idfacuradetalle) {
		this.idfacuradetalle = idfacuradetalle;
	}

	public Integer getCodigoproducto() {
		return codigoproducto;
	}

	public void setCodigoproducto(Integer codigoproducto) {
		this.codigoproducto = codigoproducto;
	}

	public String getNombreproducto() {
		return nombreproducto;
	}

	public void setNombreproducto(String nombreproducto) {
		this.nombreproducto = nombreproducto;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Double getSubtotalfactura() {
		return subtotalfactura;
	}

	public void setSubtotalfactura(Double subtotalfactura) {
		this.subtotalfactura = subtotalfactura;
	}
	
}
