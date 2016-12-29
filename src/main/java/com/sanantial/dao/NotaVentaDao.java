package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.NotaVenta;

public interface NotaVentaDao extends AbstractDao<NotaVenta, String> {

	void saveNotaVenta(NotaVenta notaVenta);
	public NotaVenta findById(Integer id);
	public void delete(NotaVenta e) ;
	public List<NotaVenta> findByCriteria(Criterion criterion);
}
