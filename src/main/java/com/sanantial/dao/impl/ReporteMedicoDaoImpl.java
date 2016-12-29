package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.ReporteMedicoDao;
import com.sanantial.entity.ReporteMedico;

/**
 * @author JC
 *
 */

@Repository

public class ReporteMedicoDaoImpl extends
		AbstractDaoImpl<ReporteMedico, String> implements ReporteMedicoDao {


	
	
	protected ReporteMedicoDaoImpl() {
		super(ReporteMedico.class);
	}

	@Override
	public void saveReporteMedico(ReporteMedico reporteMedico) {
		saveOrUpdate(reporteMedico);

	}

	@Override
	public ReporteMedico findById(Integer id) {
		// TODO Auto-generated method stub
		return super.findById(id);
	}



	@Override
	public void delete(ReporteMedico e) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ReporteMedico> findByCriteria(Criterion criterion) {
		// TODO Auto-generated method stub
		return super.findByCriteria(criterion);
	}

}
