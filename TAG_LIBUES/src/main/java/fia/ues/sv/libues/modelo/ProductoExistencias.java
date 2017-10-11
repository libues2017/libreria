package fia.ues.sv.libues.modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import fia.ues.sv.libues.modelo.Producto;

public class ProductoExistencias {

	 public ArrayList<Producto> listaExistencias() {
        String dbURL = "jdbc:mysql://localhost:3306/libues";
        String username = "root";
        String password = "root";
        
        ArrayList<Producto> productos = new ArrayList<Producto>();
        
        try (Connection conn = DriverManager.getConnection(dbURL, username, password)) {
            String sql = "SELECT E.ID_MOVIMIENTO, M.ID_EMPRESA_ORIGEN, "
            		+ "M.ID_EMPRESA_DESTINO, M.ID_TIPO_MOVIMIENTO, M.ID_BODEGA, "
            		+ "M.ID_GRUPO_EMPRESA, M.VOLUMEN, M.FECHA, "
            		+ "COUNT(E.ID_MOV_EMP), SUM(E.TIEMPO) "
            		+ "FROM movimiento as M, empleado_movimiento as E "
            		+ "WHERE e.ID_MOVIMIENTO = M.ID_MOVIMIENTO "
            		+ "GROUP BY (M.ID_MOVIMIENTO)";
            
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
            	 Producto prod = new Producto();

                 prod.setCodigoProducto(result.getInt(1));
            	/* prod.setArea(result.getString(2));
            	 prod.setProveedor(result.getObject(3));
            	 prod.setEditorial(result.getString(4));
            	 prod.setTipoProducto(result.getString(5));*/
            	 prod.setNombreProducto(result.getString(6));
            	 prod.setCorrelativo(result.getInt(7));
            	 prod.setExistencia(result.getInt(8));
            	 prod.setUnidadMinima(result.getInt(9));
            	 prod.setIsbn(result.getString(10));
            	 prod.setFechaCreacion(result.getDate(11));
            	 prod.setPrecio(result.getDouble(12));
            	 prod.setEspecificoGastos(result.getString(13));
            	 prod.setConsignacion(result.getString(14));
            	 prod.setProveedorAnterior(result.getInt(15));
            	 prod.setUnidadMedida(result.getString(16));
            	 prod.setCostounitario(result.getDouble(17));
            	 prod.setPais(result.getString(18));

            	 System.out.println(prod.getCodigoProducto()+""+prod.getArea()+""+prod.getProveedor()+""+prod.getEditorial()+""
            	 +prod.getTipoProducto()+""+prod.getNombreProducto()+""+prod.getCorrelativo()+""+prod.getExistencia()+""
            	 +prod.getUnidadMinima()+""+prod.getIsbn()+""+prod.getFechaCreacion()+""+prod.getPrecio()+""+prod.getEspecificoGastos()+""
            	 +prod.getConsignacion()+""+prod.getProveedorAnterior()+""+prod.getUnidadMedida()+""+prod.getCostounitario()+""+prod.getPais());

            	productos.add(prod);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
	
        return productos;
    }


}
