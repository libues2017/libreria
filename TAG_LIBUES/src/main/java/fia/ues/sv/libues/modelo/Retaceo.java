package fia.ues.sv.libues.modelo;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;

 

@Entity
@Table(name="retaceo")
public class Retaceo implements Serializable{

	
	
	private static final long serialVersionUID = 1L;

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoretaceo;

	
	@NotNull
    @Column(name="FECHARETACEO")	
	private Date fecharetaceo ;
	
	
	
	@NotNull
	@Column(name="CODIGOFACTURAPROVEEDOR")
	private Integer codigofacturaproveedor;
	
	@NotNull
	@Column(name="FECHAFACTURAPROVEEDOR", nullable=false)	
	private Date fechafacturaproveedor ;
	
	
	

	public Integer getCodigofacturaproveedor() {
		return codigofacturaproveedor;
	}


	public void setCodigofacturaproveedor(Integer codigofacturaproveedor) {
		this.codigofacturaproveedor = codigofacturaproveedor;
	}


	public Date getFechafacturaproveedor() {
		return fechafacturaproveedor;
	}


	public void setFechafacturaproveedor(Date fechafacturaproveedor) {
		this.fechafacturaproveedor = fechafacturaproveedor;
	}


	public Date getFecharetaceo() {
		return fecharetaceo;
	}


	public void setFecharetaceo(Date fecharetaceo) {
		    
	    
	      this.fecharetaceo = fecharetaceo;
	     
	}
	


	public Integer getCodigoretaceo() {
		return codigoretaceo;
	}


	public void setCodigoretaceo(Integer codigoretaceo) {
		this.codigoretaceo = codigoretaceo;
	}
	

	
	
}
