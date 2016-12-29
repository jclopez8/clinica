package com.sanantial.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.ConsultaDao;
import com.sanantial.entity.Consulta;
import com.sanantial.service.ConsultaService;


@Service("consultaService")
@Transactional(readOnly = true)
public class ConsultaServiceImpl implements ConsultaService {

	@Autowired 
	private ConsultaDao consultaDao;
	
	@Override
	@Transactional(readOnly = false)
	public void saveConsulta(Consulta consulta) {
		consultaDao.saveConsulta(consulta);
		
	}

	@Override
	public Consulta findById(Integer id) {
	
		return consultaDao.findById(id);
	}

	@Override
	public List<Consulta> findConsulta(String criterio) {
		//TODO
		return null;
	}

	@Override
	public List<Consulta> findConsulta() {
	
		return consultaDao.findAll();
	}

}
