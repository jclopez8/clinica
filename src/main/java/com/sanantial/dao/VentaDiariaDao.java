package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;


import com.sanantial.entity.VentaDiaria;

public interface VentaDiariaDao extends AbstractDao<VentaDiaria, String> {

	void saveVentaDiaria(VentaDiaria ventaDiaria);
	public VentaDiaria findById(Integer id);
	public void delete(VentaDiaria e) ;
	public List<VentaDiaria> findByCriteria(Criterion criterion);
	//public List<VentaDiaria> findByDate(String date);
}
