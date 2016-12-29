package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.ExclusionesDao;
import com.sanantial.entity.Exclusiones;


@Repository
public class ExclusionesDaoImpl extends AbstractDaoImpl<Exclusiones, String>
		implements ExclusionesDao {

	protected ExclusionesDaoImpl() {
		super(Exclusiones.class);
	}


	@Override
	public void delete(Exclusiones e) {
		super.delete(e);

	}

	@Override
	public void saveExclusiones(Exclusiones exclusiones) {
		super.saveOrUpdate(exclusiones);

	}

	@Override
	public Exclusiones findById(Integer id) {
		return super.findById(id);
	}

	@Override
	public List<Exclusiones> findByCriteria(Criterion criterion) {
		return super.findByCriteria(criterion);
	}

	@Override
	public List<Exclusiones> findAll() {
		return super.findAll();
	}

}
