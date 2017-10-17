package fia.ues.sv.libues.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="factura_detalle")
public class FacturaDetalle implements Serializable{
	
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idfacturadetalle;
	
	@NotNull
	@Column(name="idfactura")
	private Integer idfactura;
	
	@NotNull
	@Column(name="codigoproducto")
	private Integer codigoproducto;
	
	@NotNull
	@Column(name="nombreproducto")
	private String nombreproducto;
	
	@NotNull
	@Column(name="sala")
	private Integer sala;
	
	@NotNull
	@Column(name="precio")
	private Double precio;
	
	@NotNull
	@Column(name="cantidad")
	private Integer cantidad;
	
	@NotNull
	@Column(name="subtotalfactura")
	private Double subtotalfactura;

	public Integer getIdfacturadetalle() {
		return idfacturadetalle;
	}

	public void setIdfacturadetalle(Integer idfacturadetalle) {
		this.idfacturadetalle = idfacturadetalle;
	}

	public Integer getIdfactura() {
		return idfactura;
	}

	public void setIdfactura(Integer idfactura) {
		this.idfactura = idfactura;
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

	public Integer getSala() {
		return sala;
	}

	public void setSala(Integer sala) {
		this.sala = sala;
	}
	
	
	
}
