package fia.ues.sv.libues.modelo;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
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
	
	
	
	@NotNull
	@Column(name="CODIGOPROVEEDOR")
	private Integer codigoproveedor;
	
	
	@NotNull
	@Column(name="TOTAL")
	private Double total;
	
	

	@NotNull
	@Column(name="UTILIDAD")
	private Double utilidad;
	

	public Double getUtilidad() {
		return utilidad;
	}


	public void setUtilidad(Double utilidad) {
		this.utilidad = utilidad;
	}


	public Double getTotal() {
		return total;
	}


	public void setTotal(Double total) {
		this.total = total;
	}


	public Integer getCodigoproveedor() {
		return codigoproveedor;
	}


	public void setCodigoproveedor(Integer codigoproveedor) {
		this.codigoproveedor = codigoproveedor;
	}


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
		
		/* String fec=fecharetaceo.toString()	;
			
			try {
				 fecharetaceo = new SimpleDateFormat("dd-MM-yyyy", new Locale("es", "MX")).parse(fec);
				//fecharetaceo = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MM-yyyy").parse(fec)));
				
				
				 //new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MM-yyyy").parse(fec)));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
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
