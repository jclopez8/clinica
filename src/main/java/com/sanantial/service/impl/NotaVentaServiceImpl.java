package com.sanantial.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.CitaDao;
import com.sanantial.dao.NotaVentaDao;
import com.sanantial.entity.NotaVenta;
import com.sanantial.service.NotaVentaService;

@Service("notaVentaService")
@Transactional(readOnly = true)
public class NotaVentaServiceImpl implements NotaVentaService {

	@Autowired 
	private NotaVentaDao notaVentaDao;
	
	@Autowired 
	private CitaDao citaDao;
	
	@Override
	public void saveNotaVenta(NotaVenta notaVenta) {
		notaVentaDao.saveNotaVenta(notaVenta);

	}

	@Override
	public NotaVenta findById(Integer id) {
	
		return notaVentaDao.findById(id);
	}

	@Override
	public List<NotaVenta> findNotaVenta(String criterio) {
		// TODO Auto-generated method stub
		return null;
	}

}
