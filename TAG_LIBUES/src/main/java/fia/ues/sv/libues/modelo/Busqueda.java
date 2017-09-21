package fia.ues.sv.libues.modelo;

public class Busqueda {
	
	private int codigoeditorial;
	private int codigoproveedor;
	private int codigoarea;
	private int codTipoProducto;
	private String nombreProducto;
	private String consignacion;
		
	public String getNombreProducto() {
		return nombreProducto;
	}
	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	public int getCodigoeditorial() {
		return codigoeditorial;
	}
	public void setCodigoeditorial(int codigoeditorial) {
		this.codigoeditorial = codigoeditorial;
	}
	public int getCodigoproveedor() {
		return codigoproveedor;
	}
	public void setCodigoproveedor(int codigoproveedor) {
		this.codigoproveedor = codigoproveedor;
	}
	public int getCodigoarea() {
		return codigoarea;
	}
	public void setCodigoarea(int codigoarea) {
		this.codigoarea = codigoarea;
	}
	public int getCodTipoProducto() {
		return codTipoProducto;
	}
	public void setCodTipoProducto(int codTipoProducto) {
		this.codTipoProducto = codTipoProducto;
	}
	public String getConsignacion() {
		return consignacion;
	}
	public void setConsignacion(String consignacion) {
		this.consignacion = consignacion;
	}

}