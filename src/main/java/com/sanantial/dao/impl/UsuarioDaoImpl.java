package com.sanantial.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.sanantial.dao.UsuarioDao;
import com.sanantial.entity.Usuario;

@Repository
public class UsuarioDaoImpl extends AbstractDaoImpl<Usuario, String> implements UsuarioDao {

	protected UsuarioDaoImpl() {
		super(Usuario.class);
	}

	@Override
	public Usuario findById(Integer id) {
		return super.findById(id);
	}

	@Override
	public boolean isValid(String name, String password) {
		return true;
	}

//	@Override
//	public List<Usuario> findByUserPass(Criterion criteria) {
//		return super.findByCriteria(criteria);
//	}

	

}
