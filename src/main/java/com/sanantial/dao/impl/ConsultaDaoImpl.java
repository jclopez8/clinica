package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.ConsultaDao;
import com.sanantial.entity.Consulta;


@Repository
public class ConsultaDaoImpl extends AbstractDaoImpl<Consulta, String>
		implements ConsultaDao {

	protected ConsultaDaoImpl(){
		super(Consulta.class);
	}
	
	

	@Override
	public List<Consulta> findAll() {
	
		return super.findAll();
	}

	@Override
	public void saveConsulta(Consulta consulta) {
		super.saveOrUpdate(consulta);

	}

	@Override
	public Consulta findById(Integer id) {
	
		return super.findById(id);
	}

	@Override
	public void delete(Consulta e) {
		super.delete(e);

	}

	@Override
	public List<Consulta> findByCriteria(Criterion criterion) {
		
		return super.findByCriteria(criterion);
	}

}
