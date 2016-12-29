package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Role;

public interface RoleDao extends AbstractDao<Role, String> {
	void saveRole(Role role);
	public Role findById(Integer id);
	public List<Role> findByCriteria(Criterion criterion);
	public List<Role> findAll();

}
