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
@Table(name="localizacion")
public class Localizacion implements Serializable{
	
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idlocalizacion;
	
	
	@Column(name="codigoprod")
	private Integer codigoprod;
	
	
	@Column(name="nombreprod")
	private String nombreprod;
	
	
	@Column(name="lugar")
	private String lugar;
	
	@NotEmpty
	@Column(name="estante")
	private Integer estante;
	
	@NotEmpty
	@Column(name="nivel")
	private Integer nivel;
	
	@NotEmpty
	@Column(name="cantidad")
	private Integer cantidad;

	// Getters and Setters
	public Integer getIdlocalizacion() {
		return idlocalizacion;
	}

	public void setIdlocalizacion(Integer idlocalizacion) {
		this.idlocalizacion = idlocalizacion;
	}

	public Integer getCodigoprod() {
		return codigoprod;
	}

	public void setCodigoprod(Integer codigoprod) {
		this.codigoprod = codigoprod;
	}

	public String getNombreprod() {
		return nombreprod;
	}

	public void setNombreprod(String nombreprod) {
		this.nombreprod = nombreprod;
	}

	public String getLugar() {
		return lugar;
	}

	public void setLugar(String lugar) {
		this.lugar = lugar;
	}

	public Integer getEstante() {
		return estante;
	}

	public void setEstante(Integer estante) {
		this.estante = estante;
	}

	public Integer getNivel() {
		return nivel;
	}

	public void setNivel(Integer nivel) {
		this.nivel = nivel;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	
	
	@Override
    public String toString() {
        return  nombreprod ;
    }

}
