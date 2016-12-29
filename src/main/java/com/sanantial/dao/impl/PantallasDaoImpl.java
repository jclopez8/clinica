package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.PantallasDao;
import com.sanantial.entity.Pantallas;


@Repository
public class PantallasDaoImpl extends AbstractDaoImpl<Pantallas, String>
		implements PantallasDao {

	protected PantallasDaoImpl() {
		super(Pantallas.class);
		
	}


	@Override
	public void delete(Pantallas e) {
		super.saveOrUpdate(e);

	}

	@Override
	public void savePantallas(Pantallas pantallas) {
		super.saveOrUpdate(pantallas);

	}

	@Override
	public Pantallas findById(Integer id) {
		return super.findById(id);
	}

	@Override
	public List<Pantallas> findByCriteria(Criterion criterion) {
		return super.findByCriteria(criterion);
	}

	@Override
	public List<Pantallas> findAll() {
		return super.findAll();
	}

}
