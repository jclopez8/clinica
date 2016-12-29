package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.Paciente;

public interface PacienteService {

	void savePaciente(Paciente paciente);

	Paciente findById(Integer id);
	
	List<Paciente> findPaciente(String criterio);
}
