package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.DoctorDao;
import com.sanantial.entity.Doctor;

@Repository
public class DoctorDaoImpl extends AbstractDaoImpl<Doctor, String> implements DoctorDao {

	protected DoctorDaoImpl() {
		super(Doctor.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void saveDoctor(Doctor doctor) {
		saveOrUpdate(doctor);

	}

	@Override
	public Doctor findById(Integer id) {
		return super.findById(id);
	}

	@Override
	public void delete(Doctor e) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Doctor> findByCriteria(Criterion criterion) {
		// TODO Auto-generated method stub
		return null;
	}

}
