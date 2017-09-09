
package fia.ues.sv.libues.modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty; 

@Entity
@Table(name="requisicion")
public class Requisicion implements Serializable{

private static final long serialVersionUID = 1L;

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigorequisicion;
	
	@NotEmpty
	@Column(name="destinorequisicion")
	private String destino;
	
	@NotEmpty
	@Column(name="fecharequisicion")
	private Date fecha;

	public Integer getCodigorequisicion() {
		return codigorequisicion;
	}

	public void setCodigorequisicion(Integer codigorequisicion) {
		this.codigorequisicion = codigorequisicion;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}	
}
