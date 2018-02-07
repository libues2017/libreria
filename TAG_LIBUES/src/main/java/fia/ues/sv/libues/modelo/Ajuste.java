package fia.ues.sv.libues.modelo;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="ajuste")
public class Ajuste implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoajuste;	
	
	
	@NotNull
	@Column(name="CODIGOPRODUCTO", nullable=false)
	private Integer codigoproducto;
	
	@NotNull
	@Column(name="CANTIDADAJUSTE", nullable=false)
	private Integer cantidad;
			
	@NotNull
	@Column(name="CONCEPTO", nullable=false)
	private String concepto;
	
	@NotNull
	@Column(name="DESTINO", nullable=false)
	private String destino;
	
	@NotNull
	@Column(name="FECHAAJUSTE", nullable=false)
	private Date fechaajuste;
	
	
	
	

	public Integer getCodigoajuste() {
		return codigoajuste;
	}

	public void setCodigoajuste(Integer codigoajuste) {
		this.codigoajuste = codigoajuste;
	}

	public Integer getCodigoproducto() {
		return codigoproducto;
	}

	public void setCodigoproducto(Integer codigoproducto) {
		this.codigoproducto = codigoproducto;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public String getConcepto() {
		return concepto;
	}

	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}
	
	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}



}
