package com.sanantial.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.GastoDiarioDao;
import com.sanantial.dao.IngresoDao;
import com.sanantial.dao.IngresoDiarioDao;
import com.sanantial.dao.UsuarioDao;
import com.sanantial.entity.GastoDiario;
import com.sanantial.entity.Ingreso;
import com.sanantial.entity.IngresoDiario;
import com.sanantial.entity.Usuario;
import com.sanantial.service.IngresoDiarioService;

@Service("ingresoDiarioService")
@Transactional(readOnly = true)
public class IngresoDiarioServiceImpl implements IngresoDiarioService {
	
	@Autowired 
	private IngresoDao ingresoDao;
	
	@Autowired 
	private IngresoDiarioDao ingresoDiarioDao;
	
	@Autowired
	private UsuarioDao usuarioDao;
	
	@Autowired
	private GastoDiarioDao gastoDiarioDao;

	@Override
	@Transactional(readOnly = false)
	public void saveIngresoDiario(IngresoDiario ingresoDiario) {
		ingresoDiarioDao.saveIngresoDiario(ingresoDiario);
	}

	@Override
	public IngresoDiario findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<IngresoDiario> findIngresoDiario() {

			Date date = new Date();
	        System.out.println("IngresoDiario Fecha::: " + date);
	        Criterion restrictDate = Restrictions.like("fecha",date); 
	        return ingresoDiarioDao.findByCriteria(restrictDate);

	}

	@Override
	@Transactional(readOnly = false)
	public void addIngresoDiario(List<Integer> ingresoDiarioIds) {
		Date date = new Date();
		for (Integer id : ingresoDiarioIds) {
			Ingreso ingreso = ingresoDao.findById(id);
			//harcodeado temporalmente con el usuario de id = 1
			Usuario usuario = usuarioDao.findById(1);
			IngresoDiario ingresoDiario = new IngresoDiario(usuario, ingreso, date);
			System.out.println("Id to Add: "+id);
			Criterion idToSearch = Restrictions.like("ingreso",ingreso); 
			 Criterion restrictDate = Restrictions.like("fecha",date); 
			 
			if(ingresoDiarioDao.findByCriteria(Restrictions.and(restrictDate, idToSearch)).size()==0){
				System.out.println("salvar ingreso diario........");
			   saveIngresoDiario(ingresoDiario);
			}else{
				System.out.println("ya existe este ingreso diario....");
			}
		}
	}

	@Override
	@Transactional(readOnly = false)
	public void deleteIngreso(Integer ingresoId) {
		System.out.println("eliminar ingreso...."+ingresoId);
		IngresoDiario ingresoDiario = ingresoDiarioDao.findById(ingresoId);
		System.out.println("ingreso Diario: "+ingresoDiario.getIngresoDiarioId());
		ingresoDiarioDao.delete(ingresoDiario);
		
	}
	
	

}
