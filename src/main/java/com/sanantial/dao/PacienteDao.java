package com.sanantial.dao;

import java.util.List;

import com.sanantial.entity.Paciente;

public interface PacienteDao extends AbstractDao<Paciente, String> {
	
	 void savePaciente(Paciente paciente);

	 public Paciente findById(Integer id);
 
	 public List<Paciente> findPaciente(String criterio) ;
}