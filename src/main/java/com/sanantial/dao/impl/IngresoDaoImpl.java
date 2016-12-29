package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.IngresoDao;
import com.sanantial.entity.Ingreso;


@Repository
public class IngresoDaoImpl extends AbstractDaoImpl<Ingreso, String> implements
		IngresoDao {

	protected IngresoDaoImpl() {
		super(Ingreso.class);
	}

	

	@Override
	public void saveIngreso(Ingreso ingreso) {
		super.saveOrUpdate(ingreso);

	}

	@Override
	public Ingreso findById(Integer id) {
		
		return super.findById(id);
	}

	@Override
	public void delete(Ingreso e) {
		super.delete(e);

	}

	@Override
	public List<Ingreso> findByCriteria(Criterion criterion) {
		
		return super.findByCriteria(criterion);
	}
	
	@Override
	public List<Ingreso> findAll(){
		return super.findAll();
	}

}
