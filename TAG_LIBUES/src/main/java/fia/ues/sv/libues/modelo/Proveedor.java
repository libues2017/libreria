package fia.ues.sv.libues.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

//Definicion de la Tabla
@Entity
@Table(name="proveedor")
public class Proveedor implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoproveedor;
	
	
	@NotEmpty
	@Column(name="NOMBREPROVEEDOR")
	private String nombreproveedor;
	
	@Column(name="DIRECCION")
	private String direccion;
	
	@NotEmpty
	@Column(name="TELEFONOPROVEEDOR")
	private String telefonoproveedor;
	
	@Column(name="CONTACTOPROVEEDOR1")
	private String contactoproveedor1;
	
	@Column(name="CONTACTOPROVEEDOR2")
	private String contactoproveedor2;
	
	@Column(name="ESTADO")
	private boolean estado;
		
	
//Metodos Set y Get

	
	public Integer getCodigoproveedor() {
		return codigoproveedor;
	}


	public boolean isEstado() {
		return estado;
	}


	public void setEstado(boolean estado) {
		this.estado = estado;
	}


	public void setCodigoproveedor(Integer codigoproveedor) {
		this.codigoproveedor = codigoproveedor;
	}


	public String getNombreproveedor() {
		return nombreproveedor;
	}


	public void setNombreproveedor(String nombreproveedor) {
		this.nombreproveedor = nombreproveedor;
	}


	public String getContactoproveedor1() {
		return contactoproveedor1;
	}


	public void setContactoproveedor1(String contactoproveedor1) {
		this.contactoproveedor1 = contactoproveedor1;
	}


	public String getContactoproveedor2() {
		return contactoproveedor2;
	}


	public void setContactoproveedor2(String contactoproveedor2) {
		this.contactoproveedor2 = contactoproveedor2;
	}


	public String getTelefonoproveedor() {
		return telefonoproveedor;
	}


	public void setTelefonoproveedor(String telefonoproveedor) {
		this.telefonoproveedor = telefonoproveedor;
	}

	
	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
  public String toString() {
      return nombreproveedor;
  }
}//Fin de la Clase
