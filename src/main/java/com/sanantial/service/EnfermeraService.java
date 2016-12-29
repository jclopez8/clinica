package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.Enfermera;

public interface EnfermeraService {

	List<Enfermera> buscarEnfermeras();
	Enfermera findById(Integer id);
}
