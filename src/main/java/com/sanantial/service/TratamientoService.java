package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.Tratamiento;

public interface TratamientoService {

	void saveTratamiento(Tratamiento tratamiento);

	Tratamiento findById(Integer id);
	
	List<Tratamiento> findTratamiento(String nombre);
}
