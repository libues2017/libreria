package fia.ues.sv.libues.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="area")
public class Area implements Serializable {
	
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoarea;
	
	@NotEmpty
	@Column(name="NOMBREAREA", nullable=false)
	private String nombrearea;
	
	@NotNull
	@Column(name="ESTADO", nullable=false)
	private boolean estado;
		
	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public Integer getCodigoarea() {
		return codigoarea;
	}

	public void setCodigoarea(Integer codigoarea) {
		this.codigoarea = codigoarea;
	}

	public String getNombrearea() {
		return nombrearea;
	}

	public void setNombrearea(String nombrearea) {
		this.nombrearea = nombrearea;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
    public String toString() {
        return nombrearea ;
    }

}

