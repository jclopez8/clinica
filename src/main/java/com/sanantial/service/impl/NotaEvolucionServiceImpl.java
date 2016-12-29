package com.sanantial.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.sanantial.dao.NotaEvolucionDao;
import com.sanantial.entity.NotaEvolucion;
import com.sanantial.service.NotaEvolucionService;

@Service("notaEvolucionService")
@Transactional(readOnly = true)
public class NotaEvolucionServiceImpl  implements NotaEvolucionService  {

	@Autowired 
	private NotaEvolucionDao notaEvolucionDao;
	
	@Override
	@Transactional(readOnly = false)
	public void saveNotaEvolucion(NotaEvolucion notaEvolucion) {
		notaEvolucionDao.saveOrUpdate(notaEvolucion);
		
	}
}
