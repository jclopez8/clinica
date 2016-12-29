package com.sanantial.controller;


import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



import com.sanantial.entity.Citas;
import com.sanantial.entity.Enfermera;
import com.sanantial.entity.Medicamento;
import com.sanantial.entity.Paciente;
import com.sanantial.entity.Tratamiento;
import com.sanantial.service.CitaService;
import com.sanantial.service.EnfermeraService;
import com.sanantial.service.MedicamentoService;
import com.sanantial.service.PacienteService;
import com.sanantial.service.TratamientoService;
import com.sanantial.service.VentaDiariaService;
import com.sanantial.utils.Utils;


@Controller
public class ClinicaController {

	 @Autowired
	    private CitaService citaService;
	 
	 @Autowired
	    private PacienteService pacienteService;
	 
	 @Autowired
	    private TratamientoService tratamientoService;
	 
	 @Autowired
	    private MedicamentoService medicamentoService;
	 
	 @Autowired
	    private VentaDiariaService ventaDiariaService;
	 
	 @Autowired
	    private EnfermeraService enfermeraService;
	 
	 public static final Logger  LOGGER = Logger.getLogger(ClinicaController.class.getName()); 
	 
	    @RequestMapping(value = "/tablero/enfermeras", method = RequestMethod.GET)
	    public String getTableroEnfermeras(Model model) {
	    	LOGGER.debug("tablero enfermeras GET");
	    	
	    	List<Enfermera> listaEnfermeras = enfermeraService.buscarEnfermeras();
	    	
	        List<Citas> listaCitas = citaService.buscarCitasNotEquals(Utils.getFormatedDate(),"NI");

	        model.addAttribute("listaEnfermeras", listaEnfermeras);
            model.addAttribute("listaCitas", listaCitas);
	        return "tableroEnfermeras";
	    }
	    
	    @RequestMapping(value = "/tablero/enfermeras", method = RequestMethod.POST)
	    public String subbmitTableroEnfermeras(Model model, @RequestParam(required = false, value = "statusToChange") String statusToChange,
	    		@RequestParam(required = false, value = "citaToChange") Integer citaToChange) {
	    	
	    
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("tablero enfermeras POST-"+citaToChange +" status: "+statusToChange);
	    	}
	    	if (citaToChange!=null && statusToChange!=null){
	    		citaService.actualizarStatusCita(citaToChange, statusToChange);
	    	}
	    	

	        List<Citas> listaCitas = citaService.buscarCitasNotEquals(Utils.getFormatedDate(),"NI");
	        List<Enfermera> listaEnfermeras = enfermeraService.buscarEnfermeras();

	        model.addAttribute("listaEnfermeras", listaEnfermeras);
            model.addAttribute("listaCitas", listaCitas);
	        return "tableroEnfermeras";
	    }
	    
	    
	    @RequestMapping(value = "/quitar/tratamiento", method = RequestMethod.POST)
	    public String quitarTratamiento(final Model model, @RequestParam(required = false, value = "tratamientoDeleted") Integer tratamientoDeleted,
	    		@RequestParam(required = false, value = "citaToChange") Integer citaToChange) {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("Quitar tratamiento...tratamientoDeleted: "+tratamientoDeleted+" citaToChange: "+citaToChange);
	    	}
	    	citaService.deleteTratamiento(citaToChange, tratamientoDeleted);
	    	return"redirect:/tablero/enfermeras";
	    }
	    
	    
	    @RequestMapping(value = "/quitar/tratamientoIngresar", method = RequestMethod.POST)
	    public String quitarTratamientoIngresar(final Model model, @RequestParam(required = false, value = "tratamientoDeleted") Integer tratamientoDeleted,
	    		@RequestParam(required = false, value = "citaToChange") final Integer citaToChange) {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("Quitar tratamiento...tratamientoDeleted: "+tratamientoDeleted+" citaToChange: "+citaToChange);
	    	}
	    	citaService.deleteTratamiento(citaToChange, tratamientoDeleted);
	    	return"redirect:/ingresar/paciente";
	    }
	    
	    @RequestMapping(value = "/tablero/cambiarStatusTablero", method = RequestMethod.GET)
	    public String cambiarStatusTablero(Model model, @RequestParam("citasId") final Integer citasId) {
	    	LOGGER.debug("cambiar status tablero...");
	    	model.addAttribute("citaToChange", citasId);
	    	return"cambiarStatusTablero";
	    }
	    
	    
	    @RequestMapping(value = "/salvar/nota", method = RequestMethod.POST)
	    public String salvarNota(Model model, @RequestParam(required = false, value = "citaToChange") Integer citaToChange, @RequestParam(required = false, value = "observationsToSave")  byte[]  observationsToSave) {
	    	LOGGER.debug("salvar nota...");
	    	Citas cita = citaService.findById(citaToChange);
	    	cita.setObservaciones(observationsToSave);
	    	citaService.saveCita(cita);
	    	model.addAttribute("citaToChange", citaToChange);
	    	return"redirect:/tablero/enfermeras";
	    }
	    
	    
	    
	    @RequestMapping(value = "/tablero/agregarNota", method = RequestMethod.GET)
	    public String agregarNota(Model model, @RequestParam("citasId") Integer citasId) {
	    	LOGGER.debug("agregar nota...");
	    	Citas cita = citaService.findById(citasId);
	    	try {
	    		String strObservaciones = "";
	    		 if(cita.getObservaciones()!=null) {
				   strObservaciones = new String(cita.getObservaciones(), "UTF-8");
				 }
				
		    	model.addAttribute("citaToChange", citasId);
		    	model.addAttribute("observaciones", strObservaciones);
			} catch (UnsupportedEncodingException e) {
				
				e.printStackTrace();
			}
	    	
	    	return"agregarNota";
	    }
	    
	    
	    @RequestMapping(value = "/historial/mostrarNota", method = RequestMethod.GET)
	    public String mostrarNota(final Model model, @RequestParam("citasId") final Integer citasId) {
	    	LOGGER.debug("mostrar Nota...");
	    	Citas cita = citaService.findById(citasId);
	    	try {
	    		String strObservaciones = "";
	    		 if(cita.getObservaciones()!=null) {
				   strObservaciones = new String(cita.getObservaciones(), "UTF-8");
				 }
				
		    	model.addAttribute("citaToChange", citasId);
		    	model.addAttribute("observaciones", strObservaciones);
			} catch (UnsupportedEncodingException e) {
				
				e.printStackTrace();
			}
	    	
	    	return"mostrarNota";
	    }
	    
	    
	    @RequestMapping(value = "/historial/tratamientos", method = RequestMethod.GET)
	    public String historialTratamientos(final Model model, @RequestParam("pacienteId") final Integer pacienteId) {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("historial tratamientos... PacienteID: "+pacienteId);
	    	}  
	        Paciente paciente = pacienteService.findById(pacienteId);
	        List<Citas> listaCitas = citaService.buscarCitas(paciente);
	        model.addAttribute("listaCitas", listaCitas);
	    	
	        return "historialTratamientos";
	    }
	    
	    
	    @RequestMapping(value = "/agregar/tratamiento", method = RequestMethod.GET)
	    public String nuevoTratamiento(final Model model , @RequestParam("citasId") final Integer citasId, 
	    		@RequestParam(required = false, value = "viewToBack") final String viewToBack) {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("Nuevo tratamiento view to back....."+viewToBack);
	    	}
	    	model.addAttribute("citasId", citasId);
	    	model.addAttribute("viewToBack", viewToBack);
	    	
	    	return "agregarTratamiento";
	    }
	    
	    @RequestMapping(value = "/agregar/tratamiento", method = RequestMethod.POST)
	    public String agregarTratamiento(final Model model,   @RequestParam("tratamientoNombre")final String tratamientoNombre, 
	    		      									@RequestParam("verificadosHist")final String verificadosHist,
	    		      									@RequestParam("citasId") final Integer citasId,
	    		      									@RequestParam("viewToBack") final String viewToBack) 
	    {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("agregar tratamiento....."+tratamientoNombre+" Verificados "+verificadosHist+" CitasId: "+citasId);
	    	} 
	    	  List<Tratamiento> listaTratamientos = tratamientoService.findTratamiento(tratamientoNombre);
	    	  model.addAttribute("verificadosHist", verificadosHist);
	    	  model.addAttribute("listaTratamientos", listaTratamientos);
	    	  model.addAttribute("citasId", citasId);
	    	  model.addAttribute("viewToBack", viewToBack);
	    	return "agregarTratamiento";
	    }
	    
	    @RequestMapping(value = "/guardar/tratamiento", method = RequestMethod.POST)
	    public String guardarTratamiento(final Model model, @RequestParam("verificadosHist")String verificadosHist,
	    											  @RequestParam("citasId") final Integer citasId,
	    											  @RequestParam("viewToBack") String viewToBack) 
	    {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug(" Terminando... "+verificadosHist + " citasId: "+citasId);
	    	}
	       	  if(verificadosHist!=null && !verificadosHist.equals("")){
		    	  final List<Integer> tratamientosIds = Utils.splitTratamientos(verificadosHist);
		    	 if (tratamientosIds.size()>0){
		    	    citaService.addTratamientos(citasId, tratamientosIds);
		    	  }
	    	  }else{
	    		  LOGGER.info("...ninguno seleccionado..");
	    	  }
	    	
	    	// String view
	    	 if (viewToBack.equals("tableroEnfermeras")){	    	 
	    	    return "redirect:/tablero/enfermeras";
	    	}else if (viewToBack.equals("ingresarPaciente")){
	    		return "redirect:/ingresar/paciente";
	    	}else {
	    		if(LOGGER.isDebugEnabled()){
	    			LOGGER.debug("redirect...: "+citasId);
	    		}
	    		return "redirect:/caja/nota?citasId="+citasId;
	    	}
	    }
	    
	    
	    @RequestMapping(value = "/cancelar/tratamiento", method = RequestMethod.POST)
	    public String cancelarTratamiento(final Model model, @RequestParam("verificadosHist")String verificadosHist,
	    											  @RequestParam("citasId") final Integer citasId,
	    											  @RequestParam("viewToBack") String viewToBack) 
	    {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug(" Terminando... "+verificadosHist + " citasId: "+citasId);
	    	}
	       	    	
	    	// String view
	    	 if (viewToBack.equals("tableroEnfermeras")){	
	    		 LOGGER.debug("redirect:/tablero/enfermeras");
	    	    return "redirect:/tablero/enfermeras";
	    	}else if (viewToBack.equals("ingresarPaciente")){
	    		LOGGER.debug("redirect:/ingresar/paciente");
	    		return "redirect:/ingresar/paciente";
	    	}else {
	    		if(LOGGER.isDebugEnabled()){
	    			if(LOGGER.isDebugEnabled()){
	    				LOGGER.debug("redirect...: "+citasId);
	    			}
	    		}
	    		return "redirect:/caja/nota?citasId="+citasId;
	    	}
	    }
	    
	    @RequestMapping(value = "/agregar/medicamento", method = RequestMethod.GET)
	    public String nuevoMedicamento(final Model model , @RequestParam("citasId") final Integer citasId, 
	    		@RequestParam(required = false, value = "viewToBack") final String viewToBack) {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("Nuevo tratamiento view to back....."+viewToBack);
	    	}
	    	System.out.println("Nuevo tratamiento view to back....."+viewToBack);
	    	model.addAttribute("citasId", citasId);
	    	model.addAttribute("viewToBack", viewToBack);
	    	  
	    	  
	    	return "agregarMedicamento";
	    }
	    
	    
	    @RequestMapping(value = "/agregar/medicamento", method = RequestMethod.POST)
	    public String agregarMedicamento(final Model model , @RequestParam("medicamentoNombre")String medicamentoNombre,
	    											@RequestParam("verificadosHist")String verificadosHist,
	    											@RequestParam("citasId") final Integer citasId, 
	    											@RequestParam(required = false, value = "viewToBack") String viewToBack) {
	    	
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("agregar medicamento....."+medicamentoNombre+" Verificados "+verificadosHist+" CitasId: "+citasId);
	    		
	    	} 
	    	  System.out.println("agregar medicamento....."+medicamentoNombre+" Verificados "+verificadosHist+" CitasId: "+citasId);
	    	  List<Medicamento> listaMedicamentos =   medicamentoService.findMedicamento(medicamentoNombre);
	    	  
	    	  model.addAttribute("verificadosHist", verificadosHist);
	    	  model.addAttribute("listaMedicamentos", listaMedicamentos);
	    	  model.addAttribute("citasId", citasId);
	    	  model.addAttribute("viewToBack", viewToBack);
	    	 
	    	return "agregarMedicamento";
	    }
	    
	    
	    @RequestMapping(value = "/guardar/medicamento", method = RequestMethod.POST)
	    public String guardarMedicamento(final Model model, @RequestParam("verificadosHist")String verificadosHist,
	    											  @RequestParam("citasId") Integer citasId,
	    											  @RequestParam("viewToBack") final String viewToBack) 
	    {
	    	
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("viewToBackkkk TERMINAR: "+viewToBack);
	    	} 
	    	System.out.println("viewToBackkkk TERMINAR: "+viewToBack);
	    	  if(verificadosHist!=null && !verificadosHist.equals("")){
		    	  List<Integer> medicamentosIds = Utils.splitTratamientos(verificadosHist);
		    	
			       	  if (medicamentosIds.size()>0){
			    	    ventaDiariaService.addMedicamentos(citasId, medicamentosIds);
			    	    
			    	  }
	    	  }else{
			    		  
	    		  LOGGER.info("NInGUnO agregado--");
			    }
		    	 	    	  
	    	 if (viewToBack.equals("tableroEnfermeras")){	    	 
	    	    return "redirect:/tablero/enfermeras";
	    	}else {
	    		if(LOGGER.isDebugEnabled()){
	    			LOGGER.debug("redirect: "+citasId);
	    		}
	    		return "redirect:/caja/nota?citasId="+citasId;
	    	}
	    }
	    
	    
	    @RequestMapping(value = "/cancelar/medicamento", method = RequestMethod.POST)
	    public String cancelarMedicamento(final Model model, @RequestParam("verificadosHist")String verificadosHist,
	    											  @RequestParam("citasId") Integer citasId,
	    											  @RequestParam("viewToBack") final String viewToBack) 
	    {
	    	 
	    	if(LOGGER.isDebugEnabled()){
	    	LOGGER.debug("viewToBackkkk CANCELAR: "+viewToBack);
	    	}    	 
		    	 	    	  
	    	 if (viewToBack.equals("tableroEnfermeras")){
	    		 
	    			 LOGGER.debug("redirect: tablero/enfermeras");
	    		 
	    	    return "redirect:/tablero/enfermeras";
	    	}else {
	    		if(LOGGER.isDebugEnabled()){
	    			LOGGER.debug("redirect: "+citasId);
	    		}
	    		return "redirect:/caja/nota?citasId="+citasId;
	    	}
	    }
	    
	    
	    @RequestMapping(value = "/tablero/doctores", method = RequestMethod.GET)
	    public String getTableroDoctores(final Model model) {
	    	LOGGER.debug("tablero doctores GET-----");
	    	
	        List<Citas> listaCitas = citaService.buscarCitasNotEquals(Utils.getFormatedDate(),"NI");
            model.addAttribute("listaCitas", listaCitas);
	        return "tableroDoctores";
	    }
	    
	    @RequestMapping(value = "/tablero/doctores", method = RequestMethod.POST)
	    public String submmitTableroDoctores(final Model model, @RequestParam(required = false, value = "statusToChange") String statusToChange,
	    		@RequestParam(required = false, value = "citaToChange") Integer citaToChange) {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("tablero doctores POST-----"+citaToChange +" status: "+statusToChange);
	    	}
	    	
	    	if (citaToChange!=null && statusToChange!=null){
	    		citaService.actualizarStatusCita(citaToChange, statusToChange);
	    	}
	    	
	    	
	        List<Citas> listaCitas = citaService.buscarCitasNotEquals(Utils.getFormatedDate(),"NI");
            model.addAttribute("listaCitas", listaCitas);
	        return "tableroDoctores";
	    }
	    
	    
	    @RequestMapping(value = "/ingresar/paciente", method = RequestMethod.GET)
	    public String ingresarPaciente(final Model model) {
	    	
	    	LOGGER.debug("ingresar paciente..");
	    	List<Citas> listaCitas = citaService.buscarCitas(Utils.getFormatedDate(),"NI");
	    	Collections.sort(listaCitas);
            model.addAttribute("listaCitas", listaCitas);
	        return "ingresarPaciente";
	    }
	    
	    
	    @RequestMapping(value = "/ingresar/paciente", method = RequestMethod.POST)
	    public String cambiarStatus(final Model model,@RequestParam("citasId") final Integer citasId) {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("ingresar paciente.."+citasId);
	    	}
	    	Citas cita = citaService.findById(citasId);
            cita.setStatus("Sala Espera");
            citaService.saveCita(cita);
	        return "redirect:/ingresar/paciente";
	    }
	    
	    
	    @RequestMapping(value = "/salvar/enfermera", method = RequestMethod.POST)
	    public String salvarEnfermera(final Model model, 	@RequestParam(required = false, value = "enfermeraToAdd") final Integer enfermeraToAdd,	@RequestParam(required = false, value = "citaToChange") final Integer citaToChange) {
	    	if(LOGGER.isDebugEnabled()){
	    		LOGGER.debug("salvar enfermera...ID: "+enfermeraToAdd);
	    	}
	    	final Enfermera enfermera = enfermeraService.findById(enfermeraToAdd);
	    	Citas cita = citaService.findById(citaToChange);
	    	cita.setEnfermera(enfermera);
	    	citaService.saveCita(cita);
	    	return"redirect:/tablero/enfermeras";
	    }


}
