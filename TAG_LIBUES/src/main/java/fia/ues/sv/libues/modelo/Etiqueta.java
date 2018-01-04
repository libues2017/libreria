package fia.ues.sv.libues.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;

public class Etiqueta implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoetiqueta;
	
	@Column(name="CORRELATIVO")
	private Integer codigoproducto;
	
	@NotEmpty
	@Column(name="NOMBREPRODUCTO", nullable=false)
	private String nombreProducto;	
	
	@Column(name="PRECIO")
	private Double precioproducto;
	
	@NotEmpty
	@Column(name="AUTOR_MARCA")
	private String autor_marca;

	public Integer getCodigoetiqueta() {
		return codigoetiqueta;
	}

	public void setCodigoetiqueta(Integer codigoetiqueta) {
		this.codigoetiqueta = codigoetiqueta;
	}

	public Integer getCorrelativo() {
		return getCorrelativo();
	}

	public void setCorrelativo(Integer correlativo) {
		this.codigoproducto = correlativo;
	}

	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}

	public Double getPrecio() {
		return getPrecio();
	}

	public void setPrecio(Double precio) {
		this.precioproducto = precio;
	}

	public String getAutor_marca() {
		return autor_marca;
	}

	public void setAutor_marca(String autor_marca) {
		this.autor_marca = autor_marca;
	}
	
	
		
	

}
