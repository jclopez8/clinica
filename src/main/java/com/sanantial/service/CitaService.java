package com.sanantial.service;

import java.util.Date;
import java.util.List;

import com.sanantial.entity.Citas;
import com.sanantial.entity.Paciente;

public interface CitaService {
	
	void saveCita(Citas citas);
	void addTratamientos(Integer citasId,List<Integer> tratamientosIds);
	void actualizarStatusCita(Integer citasId, String status);
	Citas findById(Integer id);
	List<Citas> buscarCitas(Date date);
	List<Citas> buscarCitas(Date date, String status);
	List<Citas> buscarCitas(Paciente paciente);
	void deleteTratamientos(Integer citasId, List<Integer> tratamientosIds);
	List<Citas> buscarCitasNotEquals(Date date, String status);
	List<Citas> buscarCitas(Date date, Paciente paciente);
	void deleteTratamiento(Integer citasId, Integer tratamientoId);
}
