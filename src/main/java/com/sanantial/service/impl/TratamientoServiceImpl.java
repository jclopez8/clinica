package com.sanantial.service.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.TratamientoDao;
import com.sanantial.entity.Tratamiento;
import com.sanantial.service.TratamientoService;



@Service("tratamientoService")
@Transactional(readOnly = true)
public class TratamientoServiceImpl implements TratamientoService {
	
	@Autowired
	TratamientoDao tratamientoDao;

	public TratamientoServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	@Transactional(readOnly = false)
	public void saveTratamiento(Tratamiento tratamiento) {
		tratamientoDao.saveOrUpdate(tratamiento);

	}

	@Override
	public Tratamiento findById(Integer id) {
		// TODO Auto-generated method stub
		return tratamientoDao.findById(id);
	}

	@Override
	public List<Tratamiento> findTratamiento(String nombre) {
		Criterion criterion = Restrictions.or(Restrictions.like("tratamientoNombre", nombre, MatchMode.ANYWHERE)
				
				);
		return tratamientoDao.findByCriteria(criterion);
	}

}
