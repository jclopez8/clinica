package com.sanantial.service.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.ExclusionesDao;
import com.sanantial.dao.PantallasDao;
import com.sanantial.dao.RoleDao;
import com.sanantial.dao.UsuarioDao;
import com.sanantial.entity.Exclusiones;
import com.sanantial.entity.Role;
import com.sanantial.entity.Usuario;
import com.sanantial.service.LoginService;



@Service("loginService")
@Transactional(readOnly = true)
public class LoginServiceImpl implements LoginService {
	
	@Autowired 
	private ExclusionesDao exclusionesDao;
	
	@Autowired 
	private RoleDao roleDao;
	
	@Autowired
	private PantallasDao pantallasDao;
	
	@Autowired
	private UsuarioDao usuarioDao;
	
	

	@Override
	public Exclusiones findById(Integer id) {
		return exclusionesDao.findById(id);
	}

	@Override
	public List<Exclusiones> findByRole(Role role) {
		Criterion criterionRole = Restrictions.like("role",role); 
		return exclusionesDao.findByCriteria(criterionRole);
	}

	@Override
	public boolean isValidUser(String name, String password) {
			return usuarioDao.isValid(name, password);
	}

	@Override
	public Usuario buscarUsuario(String name, String password) {
		 Criterion criterionName = Restrictions.like("usuarioNombre",name); 
		 Criterion criterionPass = Restrictions.like("password",password); 
		 List<Usuario> listUsr = usuarioDao.findByCriteria(Restrictions.and(criterionName,criterionPass));
		 System.out.println("size Users::: "+listUsr.size());
		 if(listUsr.size()==0){
			 return null;
		 }else{
			 return listUsr.get(0);
		 }
	}

}
