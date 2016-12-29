package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Tratamiento;

public interface TratamientoDao extends AbstractDao<Tratamiento, String> {
	void saveTratamiento(Tratamiento tratamiento);
	public Tratamiento findById(Integer id);
	public void delete(Tratamiento e) ;
	public List<Tratamiento> findByCriteria(Criterion criterion);

}
