package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Medicamento;

public interface MedicamentoDao extends AbstractDao<Medicamento, String> {

	 void saveMedicamento(Medicamento medicamento);
	 public Medicamento findById(Integer id);
	 public void delete(Medicamento e) ;
	 public List<Medicamento> findByCriteria(Criterion criterion);
}
