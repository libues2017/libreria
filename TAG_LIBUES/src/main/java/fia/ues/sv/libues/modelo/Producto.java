package fia.ues.sv.libues.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="producto")
public class Producto implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer codigoProducto;
	
	@ManyToOne
	@JoinColumn(name="CODIGOAREA", nullable=false)
	private Area Area;
	
	@ManyToOne
	@JoinColumn(name="CODIGOPROVEEDOR", nullable=false)
	private Proveedor Proveedor;
	
	@ManyToOne
	@JoinColumn(name="CODIGOEDITORIAL", nullable=false)
	private Editorial Editorial;
	
	@ManyToOne
	@JoinColumn(name="CODTIPOPRODUCTO", nullable=false)
	private TipoProducto TipoProducto;
	
	@NotEmpty
	@Column(name="NOMBREPRODUCTO", nullable=false)
	private String nombreProducto;
	
	@Column(name="CORRELATIVO")
	private String correlativo;
	
	@Column(name="EXISTENCIA")
	private Integer existencia;
	
	@Column(name="SALA")
	private Integer sala;
	
	@Column(name="UNIDADMINIMA")
	private Integer unidadMinima;
	
	@NotEmpty
	@Column(name="UNIDADMEDIDA", nullable=false)
	private String unidadMedida;
	
	@NotEmpty
	@Column(name="PAIS", nullable=false)
	private String pais;
	
	@Column(name="ISBN", nullable=false)
	private String isbn;
	
	@NotNull
	//@DateTimeFormat(pattern = "yyyy-mm-dd")
	@Column(name="fechaCreacion", nullable=false)
	private Date fechaCreacion;
	
	
	@Column(name="PRECIO")
	private Double precio;
	
	
	@Column(name="COSTOUNITARIO")
	private Double costounitario;
	
	@NotEmpty
	@Column(name="ESPECIFICOGASTOS", nullable=false)
	private String especificoGastos;
	
	@NotEmpty
	@Column(name="CONSIGNACION", nullable=false)
	private String consignacion;
	
	@NotNull
	@Column(name="PROVEEDORANTERIOR")
	private Integer proveedorAnterior;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name="autor_libro",
				joinColumns={@JoinColumn(name="CODIGOPRODUCTO")},
				inverseJoinColumns={@JoinColumn(name="CODIGOAUTOR")})
	private Set<Autor> autores = new HashSet<Autor>();

	
	
	
	

	public Integer getCodigoProducto() {
		return codigoProducto;
	}

	public void setCodigoProducto(Integer codigoProducto) {
		this.codigoProducto = codigoProducto;
	}

	public Area getArea() {
		return Area;
	}

	public void setArea(Area area) {
		Area = area;
	}

	public Proveedor getProveedor() {
		return Proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		Proveedor = proveedor;
	}

	public Editorial getEditorial() {
		return Editorial;
	}

	public void setEditorial(Editorial editorial) {
		Editorial = editorial;
	}

	public TipoProducto getTipoProducto() {
		return TipoProducto;
	}

	public void setTipoProducto(TipoProducto tipoProducto) {
		TipoProducto = tipoProducto;
	}

	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	
	public String getCorrelativo() {
		return correlativo;
	}

	public void setCorrelativo(String correlativo) {
		this.correlativo = correlativo;
	}

	public Integer getExistencia() {
		return existencia;
	}


	public void setExistencia(Integer existencia) {
		this.existencia = existencia;
	}


	public Integer getUnidadMinima() {
		return unidadMinima;
	}


	public void setUnidadMinima(Integer unidadMinima) {
		this.unidadMinima = unidadMinima;
	}
	
	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getIsbn() {
		return isbn;
	}


	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}


	public Date getFechaCreacion() {
		return fechaCreacion;
	}


	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}


	public Double getPrecio() {
		return precio;
	}


	public Double getCostounitario() {
		return costounitario;
	}

	public void setCostounitario(Double costounitario) {
		this.costounitario = costounitario;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public String getEspecificoGastos() {
		return especificoGastos;
	}


	public void setEspecificoGastos(String especificoGastos) {
		this.especificoGastos = especificoGastos;
	}


	public String getConsignacion() {
		return consignacion;
	}


	public void setConsignacion(String consignacion) {
		this.consignacion = consignacion;
	}


	public Integer getProveedorAnterior() {
		return proveedorAnterior;
	}


	public void setProveedorAnterior(Integer proveedorAnterior) {
		this.proveedorAnterior = proveedorAnterior;
	}


	public Set<Autor> getAutores() {
		return autores;
	}


	public void setAutores(Set<Autor> autores) {
		this.autores = autores;
	}
	
	@Override
    public String toString() {
        return "Producto [CODIGOPRODUCTO=" + codigoProducto + ", NOMBREPRODUCTO=" + nombreProducto 
                + ", EXISTENCIA=" + existencia + ", UNIDADMINIMA=" + unidadMinima + ", ISBN=" + isbn + ", FECHACREACION=" + fechaCreacion
                + ", PRECIO=" + precio + ", ESPECIFICOGASTOS=" +especificoGastos 
                + ", CONSIGNACION=" + consignacion + ", PROVEEDORANTERIOR" + proveedorAnterior +"UNIDADMEDIDA + unidadMedida]";
    }

	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

	public Integer getSala() {
		return sala;
	}

	public void setSala(Integer sala) {
		this.sala = sala;
	}	
	
}

