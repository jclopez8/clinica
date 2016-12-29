package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.IngresoDiario;

public interface IngresoDiarioService {

	void saveIngresoDiario(IngresoDiario ingresoDiario);
	void addIngresoDiario(List<Integer> ingresoDiarioIds);
	IngresoDiario findById(Integer id);
	List<IngresoDiario> findIngresoDiario();
	void deleteIngreso(Integer ingresoId);
	
}
