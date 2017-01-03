package com.sanantial.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sanantial.entity.Cita;

import com.sanantial.entity.Consulta;
import com.sanantial.entity.Usuario;
import com.sanantial.entity.VentaDiaria;
import com.sanantial.service.CitaService;
import com.sanantial.service.ConsultaService;
import com.sanantial.service.GastoDiarioService;
import com.sanantial.service.VentaDiariaService;
import com.sanantial.utils.Utils;


@Controller
public class CajaController {
	
	public static final Logger  LOGGER = Logger.getLogger(CajaController.class.getName()); 
	
	@Autowired VentaDiariaService ventaDiariaService;
	
	@Autowired ConsultaService consultaService;
	
	@Autowired CitaService citaService;	
	
	@Autowired GastoDiarioService gastoDiarioService;
	//@Autowired NotaVentaService notaVentaService;	
	
	
	 @RequestMapping(value = "/caja/nota", method = RequestMethod.GET)
	    public String nuevaNota(final Model model
	    		,@RequestParam("citasId") final  Integer citasId){
		 if(LOGGER.isDebugEnabled()){
			 LOGGER.debug(" Cita ID:"+citasId);
		 }
		Cita citas = citaService.findById(citasId);
		model.addAttribute("citas", citas);
		
		 model.addAttribute("citas", citas);
		 if (null!=citas.getNotaVenta().getPagada()&&citas.getNotaVenta().getPagada()){
			 return"cajaCobrado";
		 }else{
			 return "caja";
		 }
	 }
	 
	 
	 @RequestMapping(value = "/caja/nota", method = RequestMethod.POST)
	    public String terminarNota(final Model model, @RequestParam(required = false, value="idConsulta") String idConsulta
	    		,@RequestParam("citasId") Integer citasId){
		 if (LOGGER.isDebugEnabled()){
			 LOGGER.debug("idConsultas"+idConsulta);
		 }
		 ventaDiariaService.addConsulta(citasId, Utils.splitStringToInteger(idConsulta));
		
		 Cita citas = citaService.findById(citasId);
		 //System.out.println("pagada: "+citas.getNotaVenta().getPagada());
		 model.addAttribute("citas", citas);
		 if (null!=citas.getNotaVenta().getPagada()&&citas.getNotaVenta().getPagada()){
			 return"cajaCobrado";
		 }else{
			 return "caja";
		 }
		 
	 }

	 
	 
	 
	 @RequestMapping(value = "/caja/consulta", method = RequestMethod.GET)
	    public String agregarConsulta(final Model model) {
		 LOGGER.debug("agregar Consulta---");
	    	List<Consulta> consultas = consultaService.findConsulta();
	    	if (LOGGER.isDebugEnabled()){
	    		LOGGER.debug("numero de consultas: "+consultas.size());
	    	}

	    	model.addAttribute("consultas",consultas);
	    	return"agregarConsulta";
	    }
	 
	 
	 @RequestMapping(value = "/caja/eliminar", method = RequestMethod.GET)
	    public  @ResponseBody String eliminarElemento(@RequestParam(value = "elementosDeleted") String elementosDeleted, @RequestParam(value = "tratamientosDeleted") String tratamientosDeleted, @RequestParam(value = "citasId") Integer citasId) {
		 if(LOGGER.isDebugEnabled()){
		    LOGGER.debug(" elementosDeleted .... "+elementosDeleted);
		    LOGGER.debug(" tratamientosDeleted .... "+tratamientosDeleted);
		 }
		 if(elementosDeleted!=null && elementosDeleted!=""){
			 List<Integer> idsElementosToDelete = Utils.splitStringToInteger(elementosDeleted, ";");
			 ventaDiariaService.deleteElements(idsElementosToDelete);
		 }
		 if(tratamientosDeleted!=null && tratamientosDeleted!=""){
			 List<Integer> idsTratamientosToDelete = Utils.splitStringToInteger(tratamientosDeleted, ";");
			 citaService.deleteTratamientos(citasId, idsTratamientosToDelete);
		 }
		 return "elementos eliminados";
		 
	 }
	 
	 
	 @RequestMapping(value = "/caja/cobrar", method = RequestMethod.POST)
	    public String cobrar(final Model model, HttpServletRequest request) {
		 LOGGER.debug("cobrando.");

		 Usuario user =  (Usuario) request.getSession().getAttribute("usuario");
		 if(LOGGER.isDebugEnabled()){
			 LOGGER.debug("usuario: "+user.getUsuarioId()+" : "+user.getUsuarioNombre());
		 }
		 String citasId = request.getParameter("citasId");
		 Cita cita = citaService.findById(Integer.parseInt(citasId));
	
		 HashMap<String, String[]> mapParameters = (HashMap) request.getParameterMap();
		 String key= "rowTratamiento";
		 String [] values = mapParameters.get(key);
		
		 if (null!=values){
			 for (String value : values) {
				VentaDiaria venta =  ventaDiariaService.createVentaDiariaTratamiento(value,cita.getNotaVenta(), user);
				ventaDiariaService.saveVentaDiaria(venta);
			 }
		 }
		 key = "rowMedicamento";
		 values = mapParameters.get(key);
	
		 if (null!=values){
			 for (String value : values) {
				 ventaDiariaService.createVentaDiariaMedicamento(value,cita.getNotaVenta(),user);
			 }
		 }
		 key = "rowConsulta";
		 values = mapParameters.get(key);
		 if (null!=values){
			 for (String value : values) {
				ventaDiariaService.createVentaDiariaConsulta(value,cita.getNotaVenta(),user);
			 }
		 }
				 
		cita.getNotaVenta().setPagada(true);
		cita.setStatus("Terminada");
		citaService.saveCita(cita);
		
	    return "redirect:/caja/nota?citasId="+citasId;
		 
	 }
	 
	 
	   @RequestMapping(value = "/tablero/caja", method = RequestMethod.GET)
	    public String getTableroCaja(final Model model) {
		   LOGGER.debug("tablero caja GET-");
	       List<Cita> listaCitas = citaService.buscarCitasNotEquals(Utils.getFormatedDate(),"NI");;
            model.addAttribute("listaCitas", listaCitas);
	        return "tableroCaja";
	    }
	 
}
