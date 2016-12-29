package com.sanantial.service.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.EnfermeraDao;
import com.sanantial.entity.Enfermera;
import com.sanantial.service.EnfermeraService;

@Service("enfermeraService")
@Transactional(readOnly = true)
public class EnfermeraServiceImpl implements EnfermeraService {

	@Autowired 
	private EnfermeraDao enfermeraDao;
	
	
	@Override
	public List<Enfermera> buscarEnfermeras() {
		System.out.println("buscar enfermeras....");
		Criterion activa = Restrictions.like("activa",true); 
		return enfermeraDao.findByCriteria(activa);
	}


	@Override
	public Enfermera findById(Integer id) {
		return enfermeraDao.findById(id);
	}

}
