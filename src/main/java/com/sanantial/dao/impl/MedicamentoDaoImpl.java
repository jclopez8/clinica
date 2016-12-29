/**
 * 
 */
package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.MedicamentoDao;
import com.sanantial.entity.Medicamento;

/**
 * @author JC
 *
 */
@Repository
public class MedicamentoDaoImpl extends AbstractDaoImpl<Medicamento, String> implements
		MedicamentoDao {

	protected MedicamentoDaoImpl() {
		super(Medicamento.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void saveMedicamento(Medicamento medicamento) {
		saveOrUpdate(medicamento);
		
	}

	@Override
	 public Medicamento findById(Integer id){
		return super.findById(id);
	}
	 
	@Override
	 public void delete(Medicamento medicamento) {
		
		super.delete(medicamento);
	}
	
	@Override
	public List<Medicamento> findByCriteria(Criterion criterion){
		return super.findByCriteria(criterion);
	}



}
