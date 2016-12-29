package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.RoleDao;
import com.sanantial.entity.Role;


@Repository
public class RoleDaoImpl extends AbstractDaoImpl<Role, String> implements RoleDao {

	protected RoleDaoImpl() {
		super(Role.class);
	}


	@Override
	public void delete(Role e) {
		super.delete(e);

	}

	@Override
	public void saveRole(Role role) {
		super.saveOrUpdate(role);

	}

	@Override
	public Role findById(Integer id) {
		return super.findById(id);
	}

	@Override
	public List<Role> findByCriteria(Criterion criterion) {
		return super.findByCriteria(criterion);
	}

	@Override
	public List<Role> findAll() {
		return super.findAll();
	}

}
