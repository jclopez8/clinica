package com.sanantial.dao.impl;

import org.springframework.stereotype.Repository;

import com.sanantial.dao.NotaEvolucionDao;
import com.sanantial.entity.NotaEvolucion;

@Repository
public class NotaEvolucionDaoImpl  extends AbstractDaoImpl<NotaEvolucion, String>
										implements NotaEvolucionDao {

	protected NotaEvolucionDaoImpl() {
		super(NotaEvolucion.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void saveOrUpdate(NotaEvolucion e) {
		super.saveOrUpdate(e);
		
	}

	@Override
	public void saveNotaEvolucion(NotaEvolucion notaEvolucion) {
		super.saveOrUpdate(notaEvolucion);
		
	}


}
