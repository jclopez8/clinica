package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.EnfermeraDao;
import com.sanantial.entity.Enfermera;


@Repository
public class EnfermeraDaoImpl extends AbstractDaoImpl<Enfermera, String> implements EnfermeraDao{

	protected EnfermeraDaoImpl() {
		super(Enfermera.class);
	}

	@Override
	public void saveEnfermera(Enfermera enfermera) {
		super.saveOrUpdate(enfermera);
		
	}

	@Override
	public Enfermera findById(Integer id){
		return super.findById(id);
		
	}
	
	@Override
	public void delete(Enfermera e) {
		
		super.delete(e);
	}
	
	@Override
	public List<Enfermera> findByCriteria(Criterion criterion){
		return super.findByCriteria(criterion);
		
	}
}
