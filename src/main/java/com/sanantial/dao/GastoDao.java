package com.sanantial.dao;

import java.util.List;

import com.sanantial.entity.Gasto;

public interface GastoDao extends AbstractDao<Gasto, String>{
	List<Gasto> findAll();
}
