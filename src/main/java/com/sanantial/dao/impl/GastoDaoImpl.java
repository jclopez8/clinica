package com.sanantial.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sanantial.dao.GastoDao;
import com.sanantial.entity.Gasto;

@Repository
public class GastoDaoImpl extends AbstractDaoImpl<Gasto, String> implements GastoDao{

	protected GastoDaoImpl() {
		super(Gasto.class);
	}
	
	@Override
	public List<Gasto> findAll(){
		return super.findAll();
	}
}
