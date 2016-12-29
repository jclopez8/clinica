/**
 * 
 */
package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.CitaDao;
import com.sanantial.entity.Citas;

/**
 * @author JC
 *
 */

@Repository
public class CitaDaoImpl extends AbstractDaoImpl<Citas, String>
		implements CitaDao {

	protected CitaDaoImpl() {
		super(Citas.class);

	}

	/* (non-Javadoc)
	 * @see com.sanantial.dao.AbstractDao#findById(java.lang.Integer)
	 */
	@Override
	public Citas findById(Integer id) {
		return super.findById(id);
	}



	/* (non-Javadoc)
	 * @see com.sanantial.dao.AbstractDao#delete(java.lang.Object)
	 */
	@Override
	public void delete(Citas e) {
		super.delete(e);

	}

	/* (non-Javadoc)
	 * @see com.sanantial.dao.AbstractDao#findByCriteria(org.hibernate.criterion.Criterion)
	 */
	@Override
	public List<Citas> findByCriteria(Criterion criterion) {
		   // criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return super.findByCriteria(criterion);
	}

	/* (non-Javadoc)
	 * @see com.sanantial.dao.CitaDao#saveCita(com.sanantial.entity.HistorialCitas)
	 */
	@Override
	public void saveCita(Citas citas) {
		saveOrUpdate(citas);
	}

	

}
