package com.sanantial.service.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.controller.LoginController;
import com.sanantial.dao.CitaDao;
import com.sanantial.dao.TratamientoDao;
import com.sanantial.entity.Citas;
import com.sanantial.entity.Paciente;
import com.sanantial.entity.Tratamiento;
import com.sanantial.service.CitaService;
import com.sanantial.utils.Utils;


@Service("citaService")
@Transactional(readOnly = true)
public class CitaServiceImpl implements CitaService {

	public static final Logger  LOGGER = Logger.getLogger(CitaServiceImpl.class.getName()); 
	
	@Autowired 
	private CitaDao citaDao;
	
	@Autowired 
	private TratamientoDao tratamientoDao;

	@Override
	@Transactional(readOnly = false)
	public void saveCita(Citas citas) {
		LOGGER.debug("Saving Citas Service");
		//citas.setFecha(Utils.getFormatedDate());
		citaDao.saveCita(citas);
	}

	@Override
	public List<Citas> buscarCitas(Date date) {
		LOGGER.debug("Buscando citasssss date...");
		 Criterion restrictDate = Restrictions.like("fecha",date); 
		 List<Citas> citas = citaDao.findByCriteria(restrictDate);
		 return citas;
	
	}
	
	@Override
	public List<Citas> buscarCitas(Date date, Paciente paciente) {
		LOGGER.debug("Buscando citasssss date 1...");
		 Criterion restrictDate = Restrictions.like("fecha",date); 
		 Criterion restrictPaciente = Restrictions.eq("paciente",paciente); 
		 List<Citas> citas = citaDao.findByCriteria(Restrictions.and(restrictDate, restrictPaciente));
		
         return citas;
	
	}
	
	@Override
	public List<Citas> buscarCitas(Date date, String status) {
		LOGGER.debug("Buscando citasssss date 2...");
		 Criterion restrictDate = Restrictions.eq("fecha",date); 
		 Criterion restrictStatus = Restrictions.eq("status",status); 
		 List<Citas> citas = citaDao.findByCriteria(Restrictions.and(restrictDate, restrictStatus));
		 System.out.println("citas SIZE DAO::::  "+citas.size());
             return citas;
	}
	
	@Override
	public List<Citas> buscarCitasNotEquals(Date date, String status) {
		LOGGER.debug("Buscando buscarCitasNotEquals...");
		 Criterion restrictDate = Restrictions.eq("fecha",date); 
		 Criterion restrictStatus = Restrictions.ne("status",status); 
		 List<Citas> citas = citaDao.findByCriteria(Restrictions.and(restrictDate, restrictStatus));
		 return citas;
	}
	

	
	@Override
	public List<Citas> buscarCitas(Paciente paciente) {
		LOGGER.debug("Buscando by paciente...");
		Criterion buscarPaciente = Restrictions.like("paciente",paciente); 
        return  citaDao.findByCriteria(buscarPaciente);
	
	}

	@Override
	@Transactional(readOnly = false)
	public void addTratamientos(Integer citasId, List<Integer> tratamientosIds) {
		Set<Tratamiento> setTratamientos =  new HashSet<Tratamiento>(0);
		Tratamiento tratamiento = new Tratamiento();
		Citas cita = citaDao.findById(citasId);
		
		for (Integer id : tratamientosIds) {
			tratamiento = tratamientoDao.findById(id);
			if(tratamiento!=null && tratamiento.getTratamientoId()!=null){
				if(cita.getTratamientos().contains(tratamiento)){
				System.out.println("=========yA contiene este TRATAMIENTO===================="+tratamiento.getTratamientoNombre());
				}else{
					System.out.println("NOOOO contiene este TRATAMIENTO===================="+tratamiento.getTratamientoNombre());
			  setTratamientos.add(tratamiento);
			  }
			}
			else{
				System.out.println("tratamiento is NULL: "+id);
			}
		}
		
		System.out.println("Cita Id: "+citasId);

		if (setTratamientos.size()>0){
			cita.getTratamientos().addAll(setTratamientos);
			System.out.println("------after set tratamientos------");
			citaDao.saveCita(cita);
		}
		//cita.getTratamientos().contains(o)
	
	}

	@Override
	@Transactional(readOnly = false)
	public void actualizarStatusCita(final Integer citasId, final String status) {
		Citas cita = citaDao.findById(citasId);
		//System.out.println("Status: "+status);
		cita.setStatus(status);
		//System.out.println("after actualizar Cita ID: "+cita.getCitasId()+" status "+cita.getStatus());
		citaDao.saveCita(cita);
	}

	@Override
	public Citas findById(Integer id) {
		return citaDao.findById(id);
	}
	
	
	@Override
	@Transactional(readOnly = false)
	public void deleteTratamientos(final Integer citasId, List<Integer> tratamientosIds) {
		Citas cita = citaDao.findById(citasId);
		Tratamiento tratamiento;
		
		for (Integer id : tratamientosIds) {
			System.out.println(" ID : "+id);
			tratamiento=tratamientoDao.findById(id);
			boolean removed= cita.getTratamientos().remove(tratamiento);
			System.out.println(" removed: "+removed);
		}
	}
	
	@Override
	@Transactional(readOnly = false)
	public void deleteTratamiento(final Integer citasId, final Integer tratamientoId) {
		Citas cita = citaDao.findById(citasId);
		System.out.println(" ID : "+tratamientoId);
		Tratamiento tratamiento=tratamientoDao.findById(tratamientoId);
		boolean removed= cita.getTratamientos().remove(tratamiento);
		System.out.println(" removed: "+removed);
	
			 

		
	}

	
}
