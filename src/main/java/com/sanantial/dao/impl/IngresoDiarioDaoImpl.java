package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.IngresoDiarioDao;
import com.sanantial.entity.IngresoDiario;

@Repository
public class IngresoDiarioDaoImpl extends
		AbstractDaoImpl<IngresoDiario, String> implements IngresoDiarioDao {

	protected IngresoDiarioDaoImpl() {
		super(IngresoDiario.class);
		
	}

	

	@Override
	public void saveIngresoDiario(IngresoDiario ingresoDiario) {
		super.saveOrUpdate(ingresoDiario);

	}

	@Override
	public IngresoDiario findById(Integer id) {
		
		return super.findById(id);
	}

	@Override
	public void delete(IngresoDiario e) {
		super.delete(e);

	}

	@Override
	public List<IngresoDiario> findByCriteria(Criterion criterion) {
		
		return super.findByCriteria(criterion);
	}

}
