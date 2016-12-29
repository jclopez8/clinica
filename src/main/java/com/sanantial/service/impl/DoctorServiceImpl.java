package com.sanantial.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.DoctorDao;
import com.sanantial.entity.Doctor;
import com.sanantial.service.DoctorService;


@Service("doctorService")
@Transactional(readOnly = true)
public class DoctorServiceImpl implements DoctorService {

	@Autowired 
	DoctorDao doctorDao;
	
	@Override
	@Transactional(readOnly = false)
	public void saveDoctor(Doctor doctor) {
		doctorDao.saveDoctor(doctor);

	}

	@Override
	public Doctor findById(Integer id) {
	
		return doctorDao.findById(id);
	}

}
