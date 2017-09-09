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
	
	

	public Date getFecharetaceo() {
		return fecharetaceo;
	}


	public void setFecharetaceo(Date fecharetaceo) {
		//2007-12-25
		/*HttpServletRequest request = null;
		//this.fecharetaceo = fecharetaceo;
		String strFecha =request.getParameter("fecharetaceo");
	      
	      SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
	      //String strFecha = "2007-12-25";
	      Date fecha = null;
	      try {

	      fecha = formatoDelTexto.parse(strFecha);

	      } catch (ParseException ex) {

	      ex.printStackTrace();

	      }*/
	      
	      
	      
	      
	      this.fecharetaceo = fecharetaceo;
	      
		
		
	}
	


	public Integer getCodigoretaceo() {
		return codigoretaceo;
	}


	public void setCodigoretaceo(Integer codigoretaceo) {
		this.codigoretaceo = codigoretaceo;
	}
	

	


	
	
	
	
}
