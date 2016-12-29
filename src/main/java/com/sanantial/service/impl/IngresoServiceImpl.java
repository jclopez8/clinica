package com.sanantial.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.IngresoDao;
import com.sanantial.entity.Ingreso;
import com.sanantial.service.IngresoService;

@Service("ingresoService")
@Transactional(readOnly = true)
public class IngresoServiceImpl implements IngresoService {
	
	@Autowired 
	private IngresoDao ingresoDao;

	@Override
	public List<Ingreso> findIngresos() {
		return ingresoDao.findAll();
	}

}
