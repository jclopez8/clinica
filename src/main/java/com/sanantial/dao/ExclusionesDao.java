package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Exclusiones;
import com.sanantial.entity.Role;

public interface ExclusionesDao extends AbstractDao<Exclusiones, String> {

	void saveExclusiones(Exclusiones exclusiones);
	public Exclusiones findById(Integer id);
	public List<Exclusiones> findByCriteria(Criterion criterion);
	public List<Exclusiones> findAll();
}
