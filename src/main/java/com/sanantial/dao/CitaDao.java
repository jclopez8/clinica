/**
 * 
 */
package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Citas;

/**
 * @author JC
 *
 */
public interface CitaDao extends AbstractDao<Citas, String> {

	void saveCita(Citas citas);
	public Citas findById(Integer id);
	public void delete(Citas e) ;
	public List<Citas> findByCriteria(Criterion criterion);

}
