package fia.ues.sv.libues.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import fia.ues.sv.libues.dao.AreaDao;
import fia.ues.sv.libues.modelo.Area;

@Service("areaService")
@Transactional
public class AreaServiceImpl implements AreaService {
	
	@Autowired
	private AreaDao dao;

	@Override
	public Area findById(int codigoarea) {
		return dao.findById(codigoarea);
	}

	@Override
	public Area findByNombre(String nombrearea) {
		Area area = dao.findByName(nombrearea);
		return area;	
		
		
	}

	@Override
	public void saveArea(Area area) {
		System.out.print("hasta aqui llega");
		dao.save(area);
	}

	@Override
	public void updateArea(Area area) {
		Area entity = dao.findById(area.getCodigoarea()); 
		if(entity!=null){
			entity.setNombrearea(area.getNombrearea());
			entity.setEstado(area.getEstado());
		}
		
	}

	@Override
	public void deleteAreaById(int codigoarea) {
		dao.deleteById(codigoarea);		
	}

	@Override
	public List<Area> findAllAreas() {
		return dao.findAllAreas();
	}

}

