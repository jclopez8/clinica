package com.sanantial.service.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.MedicamentoDao;
import com.sanantial.entity.Medicamento;
import com.sanantial.service.MedicamentoService;


@Service("medicamentoService")
@Transactional(readOnly = true)
public class MedicamentoServiceImpl implements MedicamentoService {

	@Autowired MedicamentoDao medicamentoDao;

	@Override
	@Transactional(readOnly = false)
	public void saveMedicamento(Medicamento medicamento) {
		System.out.println("SAVE MEDICAMENTO...");
		medicamento.setActivo(true);
		medicamentoDao.saveMedicamento(medicamento);

	}

	@Override
	public List<Medicamento> findMedicamento(String criterio) {
		Criterion criterion = Restrictions.or(Restrictions.like("medicamentoNombre", criterio, MatchMode.ANYWHERE));
		return medicamentoDao.findByCriteria(criterion);
	}

}
