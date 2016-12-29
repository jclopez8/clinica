package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Consulta;

public interface ConsultaDao  extends AbstractDao<Consulta, String>{

	void saveConsulta(Consulta consulta);
	public Consulta findById(Integer id);
	public void delete(Consulta e) ;
	public List<Consulta> findByCriteria(Criterion criterion);

}
