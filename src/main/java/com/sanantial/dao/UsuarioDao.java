package com.sanantial.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.sanantial.entity.Usuario;

public interface UsuarioDao extends AbstractDao<Usuario, String>{
	Usuario findById(Integer id);
	boolean isValid(String name, String password);
	//List<Usuario> findByUserPass(Criterion criteria);
}
