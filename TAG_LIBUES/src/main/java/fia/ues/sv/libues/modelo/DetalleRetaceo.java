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



 @Entity
@Table(name="detalleretaceo")
public class DetalleRetaceo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigodetalleretaceo;
	

	@NotNull
	@Column(name="CODIGOPRODUCTO")
	private Integer codigoproducto;
	
	/*@NotNull
	@Column(name="CODIGOPROVEEDOR")
	private Integer codigoproveedor;*/
	
	
	@NotNull
	@Column(name="CODIGORETACEO")
	private Integer codigoretaceo;
	
	
	/*@NotNull
	@Column(name="CODIGOFACTURAPROVEEDOR")
	private Integer codigofacturaproveedor;
	
	@NotNull
	@Column(name="FECHAFACTURAPROVEEDOR", nullable=false)
	// @DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date fechafacturaproveedor ;*/
	
	@NotNull
	@Column(name="COSTOPRODUCTO")
	private Double costoproducto;		
	
	
	@NotNull
	@Column(name="PRECIOPRODUCTO")
	private Double precioproducto;	
	
	@NotNull
	@Column(name="CANTIDADPRODUCTO")
	private Integer cantidadproducto;
	
	@NotNull
	@Column(name="EXISTENCIAANTERIOR")
	private Integer existenciaanterior;
	
		
	@NotNull
	@Column(name="COSTOUNITARIOANTERIOR")
	private Double costounitarioanterior;
	
	@NotNull
	@Column(name="PRECIOANTERIOR")
	private Double precioanterior;
		
	@NotNull
	@Column(name="SUBTOTAL")   
	private Double subtotal;
	
	
	
	@NotNull
	@Column(name="UTILIDAD")
	private Double utilidad;
	

	public Double getUtilidad() {
		return utilidad;
	}

	public void setUtilidad(Double utilidad) {
		this.utilidad = utilidad;
	}

	public Double getCostounitarioanterior() {
		return costounitarioanterior;
	}


	public void setCostounitarioanterior(Double costounitarioanterior) {
		this.costounitarioanterior = costounitarioanterior;
	}


	public Double getPrecioanterior() {
		return precioanterior;
	}


	public void setPrecioanterior(Double precioanterior) {
		this.precioanterior = precioanterior;
	}

	public Integer getExistenciaanterior() {
		return existenciaanterior;
	}

	
	public void setExistenciaanterior(Integer existenciaanterior) {
		this.existenciaanterior = existenciaanterior;
	}


	public Integer getCodigodetalleretaceo() {
		return codigodetalleretaceo;
	}


	public void setCodigodetalleretaceo(Integer codigodetalleretaceo) {
		this.codigodetalleretaceo = codigodetalleretaceo;
	}


	public Integer getCodigoproducto() {
		return codigoproducto;
	}


	public void setCodigoproducto(Integer codigoproducto) {
		this.codigoproducto = codigoproducto;
	}


	/*public Integer getCodigoproveedor() {
		return codigoproveedor;
	}


	public void setCodigoproveedor(Integer codigoproveedor) {
		this.codigoproveedor = codigoproveedor;
	}*/


	public Integer getCodigoretaceo() {
		return codigoretaceo;
	}


	public void setCodigoretaceo(Integer codigoretaceo) {
		this.codigoretaceo = codigoretaceo;
	}


	public Double getCostoproducto() {
		return costoproducto;
	}


	public void setCostoproducto(Double costoproducto) {
		this.costoproducto = costoproducto;
	}


	public Double getPrecioproducto() {
		return precioproducto;
	}


	public void setPrecioproducto(Double precioproducto) {
		this.precioproducto = precioproducto;
	}


	public Integer getCantidadproducto() {
		return cantidadproducto;
	}


	public void setCantidadproducto(Integer cantidadproducto) {
		this.cantidadproducto = cantidadproducto;
	}
		
	public Double getSubtotal() {
		return subtotal;
	}


	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	/*public Date getFechafacturaproveedor() {
		return fechafacturaproveedor;
	}


	public void setFechafacturaproveedor(Date fechafacturaproveedor) {
		this.fechafacturaproveedor = fechafacturaproveedor;
	}


	public Integer getCodigofacturaproveedor() {
		return codigofacturaproveedor;
	}


	public void setCodigofacturaproveedor(Integer codigofacturaproveedor) {
		this.codigofacturaproveedor = codigofacturaproveedor;
	}*/
	
	
	
	@Override
    public String toString() {
       /* return "detalleretaceo [CODIGODETALLERETACEO=" + codigodetalleretaceo + ", CODIGOPRODUCTO=" + codigoproducto 
                + ", CODIGOPROVEEDOR=" + codigoproveedor + ",CODIGORETACEO=" + codigoretaceo + ", COSTOPRODUCTO=" + costoproducto + ", PRECIOPRODUCTO=" + precioproducto
                + ", CANTIDADPRODUCTO=" + cantidadproducto  + ", SUBTOTA=" +subtotal 
                + ", FECHAFACTURAPROVEEDOR=" + fechafacturaproveedor + ", CODIGOFACTURAPROVEEDOR=" + codigofacturaproveedor +" ]";*/
        
		return "detalleretaceo [CODIGODETALLERETACEO=" + codigodetalleretaceo + ", CODIGOPRODUCTO=" + codigoproducto 
                + ",CODIGORETACEO=" + codigoretaceo + ", COSTOPRODUCTO=" + costoproducto + ", PRECIOPRODUCTO=" + precioproducto
                + ", CANTIDADPRODUCTO=" + cantidadproducto  + ", SUBTOTA=" +subtotal 
                + " ]";
		
		
    }


	
}
