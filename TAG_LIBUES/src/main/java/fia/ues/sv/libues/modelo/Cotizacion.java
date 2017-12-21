package fia.ues.sv.libues.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="cotizacion")
public class Cotizacion implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoCotizacion;
	
	@NotNull
	@Column(name="NOMBRECLIENTE")
	private String nombreCliente;
	
	@NotNull
	@Column(name="TELEFONO")
	private String telefono;
	
	@NotNull
	@Column(name="CORREO")
	private String correo;
	
	@NotNull
	@Column(name="FECHACOTIZACION")
	private Date fechaCotizacion;
	
	@Column(name="TOTAL")
	private Double total;

	public Integer getCodigoCotizacion() {
		return codigoCotizacion;
	}

	public void setCodigoCotizacion(Integer codigoCotizacion) {
		this.codigoCotizacion = codigoCotizacion;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public Date getFechaCotizacion() {
		return fechaCotizacion;
	}

	public void setFechaCotizacion(Date fechaCotizacion) {
		this.fechaCotizacion = fechaCotizacion;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
