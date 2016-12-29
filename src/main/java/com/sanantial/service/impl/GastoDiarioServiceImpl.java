package com.sanantial.service.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.GastoDao;
import com.sanantial.dao.GastoDiarioDao;
import com.sanantial.dao.UsuarioDao;
import com.sanantial.entity.Gasto;
import com.sanantial.entity.GastoDiario;
import com.sanantial.entity.Usuario;
import com.sanantial.service.GastoDiarioService;
import com.sanantial.utils.Utils;


@Service("gastoDiarioService")
@Transactional(readOnly = true)
public class GastoDiarioServiceImpl implements GastoDiarioService {

	@Autowired GastoDiarioDao gastoDiarioDao;
	
	@Autowired GastoDao gastoDao;
	
	@Autowired UsuarioDao usuarioDao;
	
	@Override
	@Transactional(readOnly = false)
	public void saveGastoDiario(GastoDiario gastoDiario) {
		gastoDiarioDao.saveGastoDiario(gastoDiario);

	}

	@Override
	public List<GastoDiario> findGastoDiario() {

			Date date = new Date();
	        System.out.println("GastoDiario Fecha::: " + date);
	        Criterion restrictDate = Restrictions.like("fecha",date); 
	        return gastoDiarioDao.findByCriteria(restrictDate);

	}
	
	@Override
	@Transactional(readOnly = false)
	public void addGastoDiario(List<Integer> gastoDiarioIds) {
        Date date = new Date();
		for (Integer id : gastoDiarioIds) {
			Gasto gasto = gastoDao.findById(id);
			//hardcodeado el id de usuario a 1, temporal
			Usuario usuario = usuarioDao.findById(1);
			GastoDiario gastoDiario = new GastoDiario(gasto, usuario, date);
			
			System.out.println("Id to Add: "+id);
			Criterion idToSearch = Restrictions.like("gasto",gasto); 
			Criterion restrictDate = Restrictions.like("fecha",date);
			if (gastoDiarioDao.findByCriteria(Restrictions.and(idToSearch,restrictDate)).size()==0){
				saveGastoDiario(gastoDiario);
			}else{
				System.out.println("ya existe este gasto diario....");
			}
			 
			
		}
	}

	@Override
	@Transactional(readOnly = false)
	public GastoDiario createGastoDiarioVale(String list) {
		String [] values = Utils.splitString(list, ";");
		System.out.println("Gasto Values:::::: "+values[0]+" - "+values[1]+" - "+values[2]+" - "+values[3]+" - "+values[4]+" - "+values[5]);
		//hardcodeado el id de usuario a 1, temporal
		Usuario usuario = usuarioDao.findById(1);
		Integer valeId = Utils.getValueNumber(values[4]);
		if (null==valeId || valeId==0){
		  return null;
		}else {
			Gasto gasto = gastoDao.findById(valeId);
			GastoDiario gastoDiario = new GastoDiario(gasto,usuario,Utils.getFormatedDate());
			return gastoDiario;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public void deleteGasto(Integer gastoId) {
		System.out.println("eliminar gasto...."+gastoId);
		GastoDiario gastoDiario = gastoDiarioDao.findById(gastoId);
		System.out.println("gasto Diario: "+gastoDiario.getGastoDiarioId());
		gastoDiarioDao.delete(gastoDiario);
		
	}

}
