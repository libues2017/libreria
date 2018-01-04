package fia.ues.sv.libues.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name="etiquetas")
public class Etiqueta implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoetiqueta;
	
	@Column(name="CODIGOPRODUCTO")
	private Integer codigoproducto;
	
	@NotEmpty
	@Column(name="NOMBREPRODUCTO", nullable=false)
	private String nombreProducto;	
	
	@Column(name="PRECIOPRODUCTO")
	private Double precioproducto;
	
	@NotEmpty
	@Column(name="AUTOR_MARCA")
	private String autor_marca;
	
	@Column(name="CANTIDAD")
	private Integer cantidad;

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Integer getCodigoetiqueta() {
		return codigoetiqueta;
	}

	public void setCodigoetiqueta(Integer codigoetiqueta) {
		this.codigoetiqueta = codigoetiqueta;
	}

	

	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}

	
	public Integer getCodigoproducto() {
		return codigoproducto;
	}

	public void setCodigoproducto(Integer codigoproducto) {
		this.codigoproducto = codigoproducto;
	}

	public Double getPrecioproducto() {
		return precioproducto;
	}

	public void setPrecioproducto(Double precioproducto) {
		this.precioproducto = precioproducto;
	}

	public String getAutor_marca() {
		return autor_marca;
	}

	public void setAutor_marca(String autor_marca) {
		this.autor_marca = autor_marca;
	}
	
	
		
	

}
