package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Doctor;

public interface DoctorDao extends AbstractDao<Doctor, String> {

	void saveDoctor(Doctor doctor);
	public Doctor findById(Integer id);
	public void delete(Doctor e) ;
	public List<Doctor> findByCriteria(Criterion criterion);
}
