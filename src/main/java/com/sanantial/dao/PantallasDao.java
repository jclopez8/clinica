package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Pantallas;

public interface PantallasDao extends AbstractDao<Pantallas, String> {

	void savePantallas(Pantallas pantallas);
	public Pantallas findById(Integer id);
	public List<Pantallas> findByCriteria(Criterion criterion);
	public List<Pantallas> findAll();

}
