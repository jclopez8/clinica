package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.ReporteMedico;

public interface ReporteMedicoDao extends AbstractDao<ReporteMedico, String> {
	void saveReporteMedico(ReporteMedico reporteMedico);
	public ReporteMedico findById(Integer id);
	public void delete(ReporteMedico e) ;
	public List<ReporteMedico> findByCriteria(Criterion criterion);

}
