package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.GastoDiario;

public interface GastoDiarioDao extends AbstractDao<GastoDiario, String> {

	void saveGastoDiario(GastoDiario gastoDiario);
	public GastoDiario findById(Integer id);
	public void delete(GastoDiario gastoDiario) ;
	public List<GastoDiario> findByCriteria(Criterion criterion);
}
