package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.TratamientoDao;
import com.sanantial.entity.Tratamiento;


@Repository
public class TratamientoDaoImpl extends AbstractDaoImpl<Tratamiento, String>
		implements TratamientoDao {

	protected TratamientoDaoImpl() {
		super(Tratamiento.class);
	}

	

	@Override
	public void saveTratamiento(Tratamiento tratamiento) {
		super.saveOrUpdate(tratamiento);

	}

	@Override
	public Tratamiento findById(Integer id) {
		return super.findById(id);
	}

	@Override
	public void delete(Tratamiento e) {
		super.delete(e);

	}

	@Override
	public List<Tratamiento> findByCriteria(Criterion criterion) {
			return super.findByCriteria(criterion);
	}

}
