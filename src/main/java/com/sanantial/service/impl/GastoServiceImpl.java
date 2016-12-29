package com.sanantial.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.GastoDao;
import com.sanantial.entity.Gasto;
import com.sanantial.service.GastoService;

@Service("gastoService")
@Transactional(readOnly = true)
public class GastoServiceImpl implements GastoService{
	
	@Autowired GastoDao gastoDao;

	@Override
	public List<Gasto> findGastos() {
		return gastoDao.findAll();
	}

}
