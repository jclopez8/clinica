package com.sanantial.service;

import java.util.Date;
import java.util.List;

import com.sanantial.entity.Cita;
import com.sanantial.entity.Paciente;

public interface CitaService {
	
	void saveCita(Cita citas);
	void addTratamientos(Integer citasId,List<Integer> tratamientosIds);
	void actualizarStatusCita(Integer citasId, String status);
	Cita findById(Integer id);
	List<Cita> buscarCitas(Date date);
	List<Cita> buscarCitas(Date date, String status);
	List<Cita> buscarCitas(Paciente paciente);
	void deleteTratamientos(Integer citasId, List<Integer> tratamientosIds);
	List<Cita> buscarCitasNotEquals(Date date, String status);
	List<Cita> buscarCitas(Date date, Paciente paciente);
	void deleteTratamiento(Integer citasId, Integer tratamientoId);
}
