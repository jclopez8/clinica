/**
 * 
 */
package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Cita;

/**
 * @author JC
 *
 */
public interface CitaDao extends AbstractDao<Cita, String> {

	void saveCita(Cita citas);
	public Cita findById(Integer id);
	public void delete(Cita e) ;
	public List<Cita> findByCriteria(Criterion criterion);

}
