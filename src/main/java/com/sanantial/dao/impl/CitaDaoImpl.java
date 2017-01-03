/**
 * 
 */
package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.CitaDao;
import com.sanantial.entity.Cita;


/**
 * @author JC
 *
 */

@Repository
public class CitaDaoImpl extends AbstractDaoImpl<Cita, String>
		implements CitaDao {

	protected CitaDaoImpl() {
		super(Cita.class);

	}

	/* (non-Javadoc)
	 * @see com.sanantial.dao.AbstractDao#findById(java.lang.Integer)
	 */
	@Override
	public Cita findById(Integer id) {
		return super.findById(id);
	}



	/* (non-Javadoc)
	 * @see com.sanantial.dao.AbstractDao#delete(java.lang.Object)
	 */
	@Override
	public void delete(Cita e) {
		super.delete(e);

	}

	/* (non-Javadoc)
	 * @see com.sanantial.dao.AbstractDao#findByCriteria(org.hibernate.criterion.Criterion)
	 */
	@Override
	public List<Cita> findByCriteria(Criterion criterion) {
		   // criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return super.findByCriteria(criterion);
	}

	/* (non-Javadoc)
	 * @see com.sanantial.dao.CitaDao#saveCita(com.sanantial.entity.HistorialCitas)
	 */
	@Override
	public void saveCita(Cita citas) {
		saveOrUpdate(citas);
	}

	

}
