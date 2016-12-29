package com.sanantial.service.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sanantial.dao.CitaDao;
import com.sanantial.dao.ConsultaDao;
import com.sanantial.dao.MedicamentoDao;
import com.sanantial.dao.NotaVentaDao;
import com.sanantial.dao.TratamientoDao;
import com.sanantial.dao.UsuarioDao;
import com.sanantial.dao.VentaDiariaDao;
import com.sanantial.entity.Citas;
import com.sanantial.entity.Consulta;
import com.sanantial.entity.Medicamento;
import com.sanantial.entity.NotaVenta;
import com.sanantial.entity.Tratamiento;
import com.sanantial.entity.Usuario;
import com.sanantial.entity.VentaDiaria;
import com.sanantial.service.VentaDiariaService;
import com.sanantial.utils.Utils;

@Service("ventaDiariaService")
@Transactional(readOnly = false)
public class VentaDiariaServiceImpl implements VentaDiariaService {

	@Autowired
	private VentaDiariaDao ventaDiariaDao;
	
	@Autowired
	private ConsultaDao consultaDao;
	
	@Autowired
	private UsuarioDao usuarioDao;
	
	@Autowired
	private TratamientoDao tratamientoDao;
	
	@Autowired
	private MedicamentoDao medicamentoDao;
	
	@Autowired
	private NotaVentaDao notaVentaDao;
	
	@Autowired
	private CitaDao citaDao;
	
	
	@Override
	public void saveVentaDiaria(VentaDiaria ventaDiaria) {
		ventaDiariaDao.saveVentaDiaria(ventaDiaria);

	}

	@Override
	public VentaDiaria createVentaDiariaTratamiento(String list,NotaVenta notaVenta, Usuario usuario) {
		
		String [] values = Utils.splitString(list, ";");
		System.out.println("Values:::::: "+values[0]+" - "+values[1]+" - "+values[2]+" - "+values[3]+" - "+values[4]+" - "+values[5]);
		Consulta consulta = consultaDao.findById(0);
		Tratamiento tratamiento = tratamientoDao.findById(Integer.parseInt(values[0]));
		Medicamento medicamento = medicamentoDao.findById(0);
		//Usuario usuario = usuarioDao.findById(1);
		//TODO nota venta harcodeada 
		//NotaVenta notaVenta = notaVentaDao.findById(1);
		
		System.out.println("pago tarjeta venta diaria: "+values[2]+" : "+Long.parseLong(values[2]));
		VentaDiaria venta = new VentaDiaria(consulta, tratamiento, medicamento, usuario, notaVenta, Utils.getDescuento(values[5]),Integer.parseInt(values[4]), Long.parseLong(values[2]), 1, Utils.getFormatedDate());//el vale se cambio a un gasto diario se va null
		return venta;
	}

	@Override
	public void createVentaDiariaMedicamento(String list,NotaVenta notaVenta, Usuario usuario) {
		
		String [] values = Utils.splitString(list, ";");
		System.out.println("Values:::::: "+values[0]+" - "+values[1]+" - "+values[2]+" - "+values[3]+" - "+values[4]+" - "+values[5]+" - "+values[6]);
		Consulta consulta = consultaDao.findById(0);
		Tratamiento tratamiento = tratamientoDao.findById(0);
		//System.out.println("MEdicamento ID"+Integer.parseInt(values[1]));
		Medicamento medicamento = medicamentoDao.findById(Integer.parseInt(values[1]));
		//System.out.println("medicamento: "+medicamento.getMedicamentoNombre());
		//Usuario usuario = usuarioDao.findById(1);
		//TODO nota venta harcodeada 
		//NotaVenta notaVenta = notaVentaDao.findById(1);
		int cantidad = Integer.parseInt(values[6]);
		
		VentaDiaria venta = ventaDiariaDao.findById(Integer.parseInt(values[0]));
		venta.setConsulta(consulta);
		venta.setTratamiento(tratamiento);
		venta.setMedicamento(medicamento);
		venta.setUsuario(usuario);
		venta.setNotaVenta(notaVenta);
		System.out.println(values[0]+"-----------getting descuento MED: "+values[5]+" Desc: "+Utils.getDescuento(values[5]));
		venta.setDescuento(Utils.getDescuento(values[5]));
		venta.setVale(0);
		System.out.println("Pago tarjeta medicamento:"+values[3]+" : "+Long.parseLong(values[3].toString()));
		venta.setPagoTarjeta(Long.parseLong(values[3].toString()));
		venta.setCantidad(cantidad);
		venta.setFecha( Utils.getFormatedDate());
		ventaDiariaDao.saveOrUpdate(venta);
				
				//new VentaDiaria(consulta, tratamiento, medicamento, usuario, notaVenta, Utils.getDescuento(values[5]), 0, Long.getLong(values[4]), cantidad, Utils.getFormatedDate());
		//return venta;
	}

	
	@Override
	public void createVentaDiariaConsulta(String list,NotaVenta notaVenta, Usuario usuario) {
		
		String [] values = Utils.splitString(list, ";");
		System.out.println("create consulta Values:::::: "+values[0]+" - "+values[1]+" - "+values[2]+" - "+values[3]+" - "+values[4]+" - "+values[5]);
		Consulta consulta = consultaDao.findById(Integer.parseInt(values[1]));
		Tratamiento tratamiento = tratamientoDao.findById(0);
		Medicamento medicamento = medicamentoDao.findById(0);
		//Usuario usuario = usuarioDao.findById(1);
		//TODO nota venta harcodeada 
		//NotaVenta notaVenta = notaVentaDao.findById(1);
		VentaDiaria venta = ventaDiariaDao.findById(Integer.parseInt(values[0]));
		venta.setConsulta(consulta);
		venta.setTratamiento(tratamiento);
		venta.setMedicamento(medicamento);
		venta.setUsuario(usuario);
		venta.setNotaVenta(notaVenta);
		System.out.println(values[0]+"-----------getting descuento CONS: "+values[5]+" Desc: "+Utils.getDescuento(values[5]));
		venta.setDescuento(Utils.getDescuento(values[5]));
		venta.setVale(0);
		System.out.println("Consulta tarjeta:"+values[3]);
		venta.setPagoTarjeta(Long.parseLong(values[3]));
		venta.setCantidad(1);
		venta.setFecha( Utils.getFormatedDate());
		ventaDiariaDao.saveOrUpdate(venta);

	}

	
	@Override
	public List<VentaDiaria> findVentaDiaria() {
		Criterion restrictDate = Restrictions.like("fecha",Utils.getFormatedDate()); 
		 return ventaDiariaDao.findByCriteria(restrictDate);
		
		
	}

	
	@Override
	public void addConsulta(Integer citaId, List<Integer> consultaIds) {
		 //Date date = new Date();
		 System.out.println("++++++Add consulta++++");
		 Consulta consulta;
		 Tratamiento tratamiento = tratamientoDao.findById(0);
		 Medicamento medicamento = medicamentoDao.findById(0);
		 
			//TODO hardcodeado el id de usuario a 1, temporal
		 Usuario usuario = usuarioDao.findById(1);
		 Citas cita = citaDao.findById(citaId);
		 NotaVenta notaVenta = cita.getNotaVenta();
		 VentaDiaria ventaDiaria ;
			for (Integer id : consultaIds) {
			
				if(!existConsulta(id, notaVenta)){
					System.out.println(" ---No eXiste-----");
				  consulta = consultaDao.findById(id);
				 
				  ventaDiaria = new VentaDiaria(consulta,tratamiento,medicamento,usuario,notaVenta);
				  ventaDiariaDao.saveOrUpdate(ventaDiaria);
				}else{
					System.out.println(" ---si Existe---");
				}
			}
		
	}



	@Override
	public void addMedicamentos(Integer citaId, List<Integer> medicamentoIds) {
		 Tratamiento tratamiento = tratamientoDao.findById(0);
		 Consulta consulta = consultaDao.findById(0);
		//TODO hardcodeado el id de usuario a 1, temporal
		 Usuario usuario = usuarioDao.findById(1);
		 Citas cita = citaDao.findById(citaId);
		 NotaVenta notaVenta = cita.getNotaVenta();
		 Medicamento medicamento;
		 VentaDiaria ventaDiaria ;
			for (Integer id : medicamentoIds) {
				 medicamento = medicamentoDao.findById(id);
				 List<VentaDiaria> venta = findVentaDiaria(medicamento,notaVenta);
				 if (venta.size()==0){
					 ventaDiaria = new VentaDiaria(consulta,tratamiento,medicamento,usuario,notaVenta,0, 0,  0L, 1, Utils.getFormatedDate());
					 ventaDiariaDao.saveOrUpdate(ventaDiaria);
				 }else{
					 System.out.println("----------------------Ya existe el Medicamento------------------------");
				 }
			}
	}



	@Override
	public void deleteElements(List<Integer> elementosIds) {
		
		VentaDiaria ventaDiaria ;
		for (Integer id : elementosIds) {
		
			ventaDiaria = ventaDiariaDao.findById(id);
			ventaDiariaDao.delete(ventaDiaria);
			System.out.println("deleted: "+id);
		}
		System.out.println("elementos borrados.............");
	}



	@Override
	public List<VentaDiaria> findVentaDiaria(Medicamento medicamento, NotaVenta notaVenta) {
		
		Criterion criterioMedicamento = Restrictions.like("medicamento",medicamento); 
		Criterion criterioNotaVta = Restrictions.like("notaVenta",notaVenta); 
		 return ventaDiariaDao.findByCriteria(Restrictions.and(criterioMedicamento, criterioNotaVta));
		
		
	}
	
	
	@Override
	public boolean existConsulta( Integer consultaId, NotaVenta notaVenta) {
		
		Consulta consulta = consultaDao.findById(consultaId);
		Criterion criterioConsulta = Restrictions.like("consulta",consulta); 
		Criterion criterioNotaVta = Restrictions.like("notaVenta",notaVenta);
		List<VentaDiaria> listVentaDiaria = ventaDiariaDao.findByCriteria(Restrictions.and(criterioConsulta, criterioNotaVta));
		if( listVentaDiaria.size()==0){
			System.out.println("-----lista size 0 ----");
		  return false;
		  }
		else{
			System.out.println("-----lista size NO 0 ----: "+((VentaDiaria)listVentaDiaria.get(0)).getVentaId());
		   return true;
		   }
		
	}




}
