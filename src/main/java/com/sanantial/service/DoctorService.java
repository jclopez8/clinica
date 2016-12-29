package com.sanantial.service;

import com.sanantial.entity.Doctor;

public interface DoctorService {
	void saveDoctor(Doctor doctor);
	Doctor findById(Integer id);

}
