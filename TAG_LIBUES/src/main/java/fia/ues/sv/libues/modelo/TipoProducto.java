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
@Table(name="tipoproducto")
public class TipoProducto implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codTipoProducto;
	
	@NotEmpty(message="No puede ir vacío")
	@Column(name="TIPOPRODUCTO", nullable=false)
	private String tipoProducto;

	public Integer getCodTipoProducto() {
		return codTipoProducto;
	}

	public void setCodTipoProducto(Integer codTipoProducto) {
		this.codTipoProducto = codTipoProducto;
	}

	public String getTipoProducto() {
		return tipoProducto;
	}

	public void setTipoProducto(String tipoProducto) {
		this.tipoProducto = tipoProducto;
	}
	
	@Override
    public String toString() {
        return tipoProducto;
    }

}

