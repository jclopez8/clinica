package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.PacienteDao;
import com.sanantial.entity.Paciente;

@Repository
public class PacienteDaoImpl extends AbstractDaoImpl<Paciente, String>  implements PacienteDao {

	protected PacienteDaoImpl() {
		super(Paciente.class);
	
	}

	@Override
	public void savePaciente(Paciente paciente) {
		saveOrUpdate(paciente);

	}

	@Override
	public Paciente findById(Integer id){
		return super.findById(id);
	}

	@Override
	public List<Paciente> findPaciente(String criterio) {
		Criterion criterion = Restrictions.or(Restrictions.like("pacienteNombre", criterio, MatchMode.ANYWHERE),
				  Restrictions.like("pacienteApellidoPat", criterio, MatchMode.ANYWHERE),
				  Restrictions.like("pacienteApellidoMat", criterio, MatchMode.ANYWHERE)
				);

		 return findByCriteria(criterion);
	}
	
	
}