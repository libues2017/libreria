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
@Table(name="detallecotizacion")
public class DetalleCotizacion implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer numeroDetalle;
	
	@NotNull
	@Column(name="CODIGOCOTIZACION")
	private Integer codigoCotizacion;
	
	@NotNull
	@Column(name="CODIGOPRODUCTO")
	private Integer codigoProducto;
	
	@NotNull
	@Column(name="NOMBREPRODUCTO")
	private String nombreProducto;
	
	@NotNull
	@Column(name="CANTIDAD")
	private Integer cantidad;
	
	@NotNull
	@Column(name="VALORUNITARIO")
	private Double valorUnitario;
	
	@NotNull
	@Column(name="VALORTOTAL")
	private Double valorTotal;

	public Integer getNumeroDetalle() {
		return numeroDetalle;
	}

	public void setNumeroDetalle(Integer numeroDetalle) {
		this.numeroDetalle = numeroDetalle;
	}

	public Integer getCodigoCotizacion() {
		return codigoCotizacion;
	}

	public void setCodigoCotizacion(Integer codigoCotizacion) {
		this.codigoCotizacion = codigoCotizacion;
	}

	public Integer getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(Integer codigoProducto) {
		this.codigoProducto = codigoProducto;
	}

	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Double getValorUnitario() {
		return valorUnitario;
	}

	public void setValorUnitario(Double valorUnitario) {
		this.valorUnitario = valorUnitario;
	}

	public Double getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(Double valorTotal) {
		this.valorTotal = valorTotal;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/*
	@Override
    public String toString() {
        return "detallecotizacion [NUMERODETALLE=" + numeroDetalle + ", CODIGOCOTIZACION=" + codigoCotizacion + ", CODIGOPRODUCTO=" + codigoProducto 
        		+ ", NOMBREPRODUCTO=" + nombreProducto + ", CANTIDAD=" + cantidad 
        		+", VALORUNITARIO=" + valorUnitario +", VALORTOTAL= "+ valorTotal +"]";
	}*/
	

}
