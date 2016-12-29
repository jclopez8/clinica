package com.sanantial.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.ReporteMedicoDao;
import com.sanantial.entity.ReporteMedico;
import com.sanantial.service.ReporteMedicoService;


@Service("reporteMedicoService")
@Transactional(readOnly = true)
public class ReporteMedicoServiceImpl implements ReporteMedicoService {

	@Autowired
	ReporteMedicoDao reporteMedicoDao;
	
	@Override
	@Transactional(readOnly = false)
	public void saveReporteMedico(ReporteMedico reporteMedico) {
		reporteMedicoDao.saveOrUpdate(reporteMedico);

	}

}
