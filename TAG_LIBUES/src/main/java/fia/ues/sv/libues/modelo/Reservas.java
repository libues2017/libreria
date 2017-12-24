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
@Table(name="reservas")
public class Reservas implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idreservas;
	
	@NotNull
	@Column(name="codigoproducto")
	private Integer codigoproducto;
	
	@NotEmpty
	@Column(name="nombreproducto")
	private String nombreproducto;
	
	@NotEmpty
	@Column(name="nombre")
	private String nombre;
	
	@NotEmpty
	@Column(name="dui")
	private String dui;
	
	@NotEmpty
	@Column(name="telefono")
	private String telefono;
	
	@NotNull
	@Column(name="fechaini")
	private Date fechaini;
	
	@NotNull
	@Column(name="fechafin")
	private Date fechafin;
	
	@NotNull
	@Column(name="cantidad")
	private Integer cantidad;
	
	@NotNull
	@Column(name="precio")
	private Double precio;

	public Integer getIdreservas() {
		return idreservas;
	}

	public void setIdreservas(Integer idreservas) {
		this.idreservas = idreservas;
	}

	public Integer getCodigoproducto() {
		return codigoproducto;
	}

	public void setCodigoproducto(Integer codigoproducto) {
		this.codigoproducto = codigoproducto;
	}

	public String getNombreproducto() {
		return nombreproducto;
	}

	public void setNombreproducto(String nombreproducto) {
		this.nombreproducto = nombreproducto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDui() {
		return dui;
	}

	public void setDui(String dui) {
		this.dui = dui;
	}		

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Date getFechaini() {
		return fechaini;
	}

	public void setFechaini(Date fechaini) {
		this.fechaini = fechaini;
	}

	public Date getFechafin() {
		return fechafin;
	}

	public void setFechafin(Date fechafin) {
		this.fechafin = fechafin;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}		
	
}
