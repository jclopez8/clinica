package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Gasto;
import com.sanantial.entity.Ingreso;

public interface IngresoDao extends AbstractDao<Ingreso, String> {

	void saveIngreso(Ingreso ingreso);
	public Ingreso findById(Integer id);
	public void delete(Ingreso e) ;
	public List<Ingreso> findByCriteria(Criterion criterion);
	public List<Ingreso> findAll();
}
