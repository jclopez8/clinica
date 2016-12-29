package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.NotaVentaDao;
import com.sanantial.entity.NotaVenta;

@Repository
public class NotaVentaDaoImpl extends AbstractDaoImpl<NotaVenta, String> implements
		NotaVentaDao {

	protected NotaVentaDaoImpl() {
		super(NotaVenta.class);

	}
	
	@Override
	public void saveNotaVenta(NotaVenta notaVenta) {
		super.saveOrUpdate(notaVenta);

	}

	@Override
	public NotaVenta findById(Integer id) {
		return super.findById(id);
	}

	@Override
	public void delete(NotaVenta e) {
		super.delete(e);

	}

	@Override
	public List<NotaVenta> findByCriteria(Criterion criterion) {
			return super.findByCriteria(criterion);
	}

}
