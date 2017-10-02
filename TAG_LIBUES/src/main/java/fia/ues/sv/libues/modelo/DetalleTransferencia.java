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
@Table(name="detalletransferencia")
public class DetalleTransferencia implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codDetalleTransferencia;
	
	@NotNull
	@Column(name="CODPRODUCTO")
	private Integer codProducto;
	
	@NotNull
	@Column(name="CODTRANSFERENCIA")
	private Integer codTransferencia;
	
	@NotNull
	@Column(name="COSTOPRODUCTO")
	private Double costoProducto;
	
	@NotNull
	@Column(name="NOMPRODUCTO")
	private String nomProducto;
	
	@NotNull
	@Column(name="PRECIOPRODUCTO")
	private Double precioProducto;
	
	@NotNull
	@Column(name="CANTIDADPRODUCTO")
	private Integer cantidadProducto;
	
	@NotNull
	@Column(name="EXISTENCIAANTERIOR")
	private Integer existenciaAnterior;
	
	@NotNull
	@Column(name="COSTOANTERIOR")
	private Double costoAnterior;
	
	@NotNull
	@Column(name="PRECIOANTERIOR")
	private Double precioAnterior;
	
	@NotNull
	@Column(name="SUBTOTAL")
	private Double subTotal;
	
	@NotNull
	@Column(name="UTILIDAD")
	private Double utilidad;

	public Integer getCodDetalleTransferencia() {
		return codDetalleTransferencia;
	}

	public void setCodDetalleTransferencia(Integer codDetalleTransferencia) {
		this.codDetalleTransferencia = codDetalleTransferencia;
	}

	public Integer getCodProducto() {
		return codProducto;
	}

	public void setCodProducto(Integer codProducto) {
		this.codProducto = codProducto;
	}
	
	public String getNomProducto() {
		return nomProducto;
	}

	public void setNomProducto(String nomProducto) {
		this.nomProducto = nomProducto;
	}

	public Integer getCodTransferencia() {
		return codTransferencia;
	}

	public void setCodTransferencia(Integer codTransferencia) {
		this.codTransferencia = codTransferencia;
	}

	public Double getCostoProducto() {
		return costoProducto;
	}

	public void setCostoProducto(Double costoProducto) {
		this.costoProducto = costoProducto;
	}

	public Double getPrecioProducto() {
		return precioProducto;
	}

	public void setPrecioProducto(Double precioProducto) {
		this.precioProducto = precioProducto;
	}

	public Integer getCantidadProducto() {
		return cantidadProducto;
	}

	public void setCantidadProducto(Integer cantidadProducto) {
		this.cantidadProducto = cantidadProducto;
	}

	public Integer getExistenciaAnterior() {
		return existenciaAnterior;
	}

	public void setExistenciaAnterior(Integer existenciaAnterior) {
		this.existenciaAnterior = existenciaAnterior;
	}

	public Double getCostoAnterior() {
		return costoAnterior;
	}

	public void setCostoAnterior(Double costoAnterior) {
		this.costoAnterior = costoAnterior;
	}

	public Double getPrecioAnterior() {
		return precioAnterior;
	}

	public void setPrecioAnterior(Double precioAnterior) {
		this.precioAnterior = precioAnterior;
	}

	public Double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}

	public Double getUtilidad() {
		return utilidad;
	}

	public void setUtilidad(Double utilidad) {
		this.utilidad = utilidad;
	}
	
}
