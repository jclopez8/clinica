package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.Exclusiones;
import com.sanantial.entity.Role;
import com.sanantial.entity.Usuario;

public interface LoginService {
	Exclusiones findById(Integer id);
	List <Exclusiones> findByRole(Role role);
	boolean isValidUser(String name, String password);
	public Usuario buscarUsuario(String name, String password);

}
