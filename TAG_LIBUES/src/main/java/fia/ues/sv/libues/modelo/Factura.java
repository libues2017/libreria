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
@Table(name="factura")
public class Factura implements Serializable{
	
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idfactura;
	
	@NotNull
	@Column(name="numerofactura")
	private Integer numerofactura;	
	
	@NotNull
	@Column(name="fechafactura")
	private Date fechafactura;
	
	@Column(name="total")
	private Double total;
	
	@Column(name="tipofactura")
	private String tipofactura;
	
	@Column(name="cliente")
	private String cliente;
	
	@Column(name="direccion")
	private String direccion;
	
	@Column(name="documento")
	private String documento;
	
	@Column(name="tipocredito")
	private String tipocredito;

	@Column(name="estado")
	private boolean estado;
	
	/* Getters y setters */
	
	public Integer getIdfactura() {
		return idfactura;
	}

	public void setIdfactura(Integer idfactura) {
		this.idfactura = idfactura;
	}

	public Integer getNumerofactura() {
		return numerofactura;
	}

	public void setNumerofactura(Integer numerofactura) {
		this.numerofactura = numerofactura;
	}

	public Date getFechafactura() {
		return fechafactura;
	}

	public void setFechafactura(Date fechafactura) {
		this.fechafactura = fechafactura;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getTipofactura() {
		return tipofactura;
	}

	public void setTipofactura(String tipofactura) {
		this.tipofactura = tipofactura;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public String getTipocredito() {
		return tipocredito;
	}

	public void setTipocredito(String tipocredito) {
		this.tipocredito = tipocredito;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
