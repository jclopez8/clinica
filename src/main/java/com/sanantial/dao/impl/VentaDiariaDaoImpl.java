package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.VentaDiariaDao;
import com.sanantial.entity.VentaDiaria;

/**
 * @author JC
 *
 */

@Repository
public class VentaDiariaDaoImpl extends AbstractDaoImpl<VentaDiaria, String>
		implements VentaDiariaDao {

	protected VentaDiariaDaoImpl() {
		super(VentaDiaria.class);
		}

	

	@Override
	public void saveVentaDiaria(VentaDiaria ventaDiaria) {
		saveOrUpdate(ventaDiaria);

	}

	@Override
	public VentaDiaria findById(final Integer id) {
		return super.findById(id);
	}



	@Override
	public void delete(VentaDiaria e) {
		super.delete(e);

	}

	
	@Override
	public List<VentaDiaria> findByCriteria(Criterion criterion) {
		return super.findByCriteria(criterion);
	}

}
