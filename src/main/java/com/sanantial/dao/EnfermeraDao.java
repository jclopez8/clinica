package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Enfermera;

public interface EnfermeraDao extends AbstractDao<Enfermera, String> {

	
	void saveEnfermera(Enfermera enfermera);
	public Enfermera findById(Integer id);
	public void delete(Enfermera e) ;
	public List<Enfermera> findByCriteria(Criterion criterion);
}
