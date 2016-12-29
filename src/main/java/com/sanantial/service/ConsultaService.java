package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.Consulta;

public interface ConsultaService {

	void saveConsulta(Consulta consulta);

	Consulta findById(Integer id);
	
	List<Consulta> findConsulta(String criterio);
	List<Consulta> findConsulta();
}
