package com.sanantial.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.PacienteDao;
import com.sanantial.entity.Paciente;
import com.sanantial.service.PacienteService;

@Service("pacienteService")
@Transactional(readOnly = true)
public class PacienteServiceImpl implements PacienteService {

	@Autowired 
	private PacienteDao pacienteDao;
	
	@Override
	 @Transactional(readOnly = false)
	public void savePaciente(Paciente paciente) {
		pacienteDao.saveOrUpdate(paciente);
		
	}
	
	@Override
	public Paciente findById(Integer id) {
		return pacienteDao.findById(id);
		
	}
	
	@Override
	public List<Paciente> findPaciente(String criterio){
		return pacienteDao.findPaciente(criterio);
	}

}
