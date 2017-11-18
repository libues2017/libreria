package fia.ues.sv.libues.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;


@Entity
@Table(name="detalle_requisicion_producto")
public class DetalleRequisicion implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigodetalle;
	
	@NotNull
	@Column(name="CODIGOREQUISICION")
	private Integer codigorequisicion;
		
	@NotNull
	@Column(name="CODIGOPRODUCTO")
	private Integer codigoproducto;
	
	@NotNull
	@Column(name="NOMBREPRODUCTO")
	private String nombreproducto;
	
	@NotNull
	@Column(name="CANTIDADMOV")
	private Integer cantidad;
	
	@NotNull
	@Column(name="BODEGA")
	private Integer bodega;
	
	@NotNull
	@Column(name="SALA")
	private Integer sala;
	
	@NotNull
	@Column(name="COSTO")
	private Double costo;
	
	@NotNull
	@Column(name="PRECIO")
	private Double precio;
	
	@NotNull
	@Column(name="SUBTOTAL")
	private Double subtotal;

	
	
	public Integer getCodigodetalle() {
		return codigodetalle;
	}

	public void setCodigodetalle(Integer codigodetalle) {
		this.codigodetalle = codigodetalle;
	}

	public Integer getCodigorequisicion() {
		return codigorequisicion;
	}

	public void setCodigorequisicion(Integer codigorequisicion) {
		this.codigorequisicion = codigorequisicion;
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

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Integer getBodega() {
		return bodega;
	}

	public void setBodega(Integer bodega) {
		this.bodega = bodega;
	}

	public Integer getSala() {
		return sala;
	}

	public void setSala(Integer sala) {
		this.sala = sala;
	}

	public Double getCosto() {
		return costo;
	}

	public void setCosto(Double costo) {
		this.costo = costo;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

		
	@Override
    public String toString() {
        return "detalle_requisicion_producto [CODIGODETALLE=" + codigodetalle + ", CODIGOREQUISICION=" + codigorequisicion + ", CODIGOPRODUCTO=" + codigoproducto 
        		+ ", NOMBREPRODUCTO=" + nombreproducto + ", CANTIDAD=" + cantidad +",BODEGA=" + bodega +",SALA=" + sala
        		+", COSTO=" + costo +", PRECIO= "+ precio +", SUBTOTAL=" + subtotal + "]";
	}
}
