package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.IngresoDiario;

public interface IngresoDiarioDao extends AbstractDao<IngresoDiario, String> {

	void saveIngresoDiario(IngresoDiario ingresoDiario);
	public IngresoDiario findById(Integer id);
	public void delete(IngresoDiario e) ;
	public List<IngresoDiario> findByCriteria(Criterion criterion);
}
