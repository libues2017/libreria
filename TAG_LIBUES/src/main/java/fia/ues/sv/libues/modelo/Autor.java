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
@Table(name="autor")
public class Autor implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoautor;
	
	@NotEmpty
	@Column(name="nombreautor")
	private String nombreautor;

	
	@Column(name="ESTADO",nullable=false)
	private boolean estado;

	
	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getCodigoautor() {
		return codigoautor;
	}

	public void setCodigoautor(Integer codigoautor) {
		this.codigoautor = codigoautor;
	}

	public String getNombreautor() {
		return nombreautor;
	}

	public void setNombreautor(String nombreautor) {
		this.nombreautor = nombreautor;
	}

	@Override
    public String toString() {
        return nombreautor ;
    }
	
}

