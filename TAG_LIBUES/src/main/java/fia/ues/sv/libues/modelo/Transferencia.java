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

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="transferencia")
public class Transferencia implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codTransferencia;
	
	@Column(name="TIPOTRANSFERENCIA")
	private String tipoTransferencia;
	
	@Column(name="SUCURSAL")
	private String sucursal;
	
	@NotNull
	@Column(name="FECHATRANSFERENCIA")
	private Date fechaTransferencia;

	public Integer getCodTransferencia() {
		return codTransferencia;
	}

	public void setCodTransferencia(Integer codTransferencia) {
		this.codTransferencia = codTransferencia;
	}

	public String getTipoTransferencia() {
		return tipoTransferencia;
	}

	public void setTipoTransferencia(String tipoTransferencia) {
		this.tipoTransferencia = tipoTransferencia;
	}


	public String getSucursal() {
		return sucursal;
	}

	public void setSucursal(String sucursal) {
		this.sucursal = sucursal;
	}

	public Date getFechaTransferencia() {
		return fechaTransferencia;
	}

	public void setFechaTransferencia(Date fechaTransferencia) {
		this.fechaTransferencia = fechaTransferencia;
	}
	
	

}
