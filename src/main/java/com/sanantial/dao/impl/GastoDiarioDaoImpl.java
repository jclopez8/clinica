package com.sanantial.dao.impl;

import java.util.List;





import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.GastoDiarioDao;

import com.sanantial.entity.GastoDiario;
/**
 * @author JC
 *
 */

@Repository
public class GastoDiarioDaoImpl extends AbstractDaoImpl<GastoDiario, String>
		implements GastoDiarioDao {
	
	GastoDiarioDaoImpl(){
		super(GastoDiario.class);
	}

	@Override
	public void delete(GastoDiario e) {
		super.delete(e);

	}

	@Override
	public void saveGastoDiario(GastoDiario gastoDiario) {
		super.saveOrUpdate(gastoDiario);
	}

	@Override
	public GastoDiario findById(Integer id) {
		return super.findById(id);
	}

	
	

	@Override
	public List<GastoDiario> findByCriteria(Criterion criterion) {
		// TODO Auto-generated method stub
		 return super.findByCriteria(criterion);
	}

}
