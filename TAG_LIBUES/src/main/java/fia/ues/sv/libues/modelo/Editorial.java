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
@Table(name="editorial")
public class Editorial implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoeditorial;
	
	@NotEmpty
	@Column(name="codigoespecifico")
	private String codigoespecifico;
	
	@NotEmpty
	@Column(name="nombreeditorial")
	private String nombre;
	
	@Column(name="ESTADO")
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
	public Integer getCodigoeditorial() {
		return codigoeditorial;
	}
	public void setCodigoeditorial(Integer codigoeditorial) {
		this.codigoeditorial = codigoeditorial;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getCodigoespecifico() {
		return codigoespecifico;
	}
	public void setCodigoespecifico(String codigoespecifico) {
		this.codigoespecifico = codigoespecifico;
	}
	@Override
    public String toString() {
        return  nombre ;
    }

}

