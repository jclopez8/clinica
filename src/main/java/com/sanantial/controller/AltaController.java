package com.sanantial.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sanantial.entity.Cita;
import com.sanantial.entity.Medicamento;
import com.sanantial.entity.NotaVenta;
import com.sanantial.entity.Paciente;
import com.sanantial.entity.ReporteMedico;
import com.sanantial.entity.Tratamiento;
import com.sanantial.service.CitaService;
import com.sanantial.service.DoctorService;
import com.sanantial.service.MedicamentoService;
import com.sanantial.service.PacienteService;
import com.sanantial.service.ReporteMedicoService;
import com.sanantial.service.TratamientoService;
import com.sanantial.utils.Utils;


@Controller
public class AltaController {

    @Autowired
    private PacienteService pacienteService;
    
    @Autowired
    private MedicamentoService medicamentoService;
    
    @Autowired
    private CitaService citaService;
    
    @Autowired
    private DoctorService doctorService;
    
    @Autowired
    private TratamientoService tratamientoServcie;
  
    @Autowired
    private ReporteMedicoService reporteMedicoServcie;
    
    public static final Logger  LOGGER = Logger.getLogger(AltaController.class.getName()); 
  

    @RequestMapping(value = "/alta/paciente", method = RequestMethod.GET)
    public String altaPaciente(Model model) {
    	LOGGER.debug("Alta Paciente.....");
    	Paciente paciente = new Paciente();
        model.addAttribute("paciente",paciente);
        return "altaPaciente";
    }

    @RequestMapping(value = "/salvar/paciente", method = RequestMethod.POST)
    public String salvarPaciente( Model model, Paciente paciente,HttpServletRequest request) {
    	System.out.println("Salvar Paciente");
    	String fechaNac = request.getParameter("d");
    	if (LOGGER.isDebugEnabled()){
    		LOGGER.debug("Saving Paciente...Fecha Nac"+fechaNac);
    	}
    
    	
    	//LOGGER.debug("FECH NAC"+fechaNac);
    	paciente.setFechaNac(Utils.getFormatedDate(fechaNac, "yyyy-MM-dd"));
    	
    	ReporteMedico reporteMedico = new ReporteMedico();
    	reporteMedicoServcie.saveReporteMedico(reporteMedico);
    	paciente.setReporteMedico(reporteMedico);
    	pacienteService.savePaciente(paciente);
        
        model.addAttribute("saved", "success");
        return "altaPaciente";
    }


    @RequestMapping(value = "/alta/medicamento", method = RequestMethod.GET)
    public String altaMedicamento(Model model) {
    	LOGGER.debug("Alta medicamento.....");
        model.addAttribute("medicamento",new Medicamento());
        return "altaMedicamento";
    }

    
    @RequestMapping(value = "/salvar/medicamento", method = RequestMethod.POST)
    public String salvarMedicamento( Model model, Medicamento medicamento) {
    	if (LOGGER.isDebugEnabled()){
    		LOGGER.debug("Saving Medicamento."+medicamento.getMedicamentoNombre());
    	}
  
       	medicamentoService.saveMedicamento(medicamento);
        
        model.addAttribute("saved", "success");
        return "altaMedicamento";
    }
    
    @RequestMapping(value = "/alta/tratamiento", method = RequestMethod.GET)
    public String altaTratamiento(Model model) {
    	LOGGER.debug("Alta medicamento.....");
        model.addAttribute("tratamiento",new Tratamiento());
        return "altaTratamiento";
    }
    
    @RequestMapping(value = "/alta/tratamiento", method = RequestMethod.POST)
    public String salvarTratamiento(Model model, Tratamiento tratamiento) {
    	LOGGER.debug("SAlvar tratamiento.....");
    	List<Tratamiento> tratamientoList =  tratamientoServcie.findTratamiento(tratamiento.getTratamientoNombre());
    	if(tratamientoList.size()==0){
    	   tratamientoServcie.saveTratamiento(tratamiento);
    	   model.addAttribute("saved", "success");
    	 }else{
    		 model.addAttribute("saved", "exist"); 
    	 }
        return "altaTratamiento";
    }
    
    
    @RequestMapping(value = "/nueva/cita", method = RequestMethod.GET)
    public String altaCita(Model model) {
    
         return "nuevaCita";
    }
    
    
    
    @RequestMapping(value = "/alta/cita", method = RequestMethod.GET)
    public String altaCita(Model model, @RequestParam("pacienteId") Integer pacienteId) {
    	if (LOGGER.isDebugEnabled()){
    		LOGGER.debug("Alta cita.....Paciente--"+pacienteId);
    	}
       		Paciente paciente = pacienteService.findById(pacienteId);
       		model.addAttribute("paciente",paciente);
	   		return "desplegarCitaPaciente";
    		
    		
        
    }
    
    
    @RequestMapping(value = "/alta/cita", method = RequestMethod.POST)
    public String salvarCita( Model model, HttpServletRequest request ,@RequestParam("pacienteId") Integer pacienteId) {
    	if (LOGGER.isDebugEnabled()){
    		LOGGER.debug("Saving Cita...- PacienteID"+pacienteId);
    	}
        String fecha = request.getParameter("d");
        String hora = request.getParameter("hora");
       	final Paciente paciente = pacienteService.findById(pacienteId);
    	
    	  List<Cita> listCitaPacienteHoy = citaService.buscarCitas(Utils.getFormatedDate(fecha,"yyyy-MM-dd"),paciente);
    	 if( Utils.compareToDates(Utils.getFormatedDate(fecha,"yyyy-MM-dd"), Utils.getFormatedDate())<0){
    		 model.addAttribute("saved", "invalidDate");
 			return "nuevaCita";
    	 }
    	  
    	  if(listCitaPacienteHoy.size()==0){
		    	Cita citas = new Cita();
		    	citas.setPaciente(paciente);
		        citas.setFecha(Utils.getFormatedDate(fecha,"yyyy-MM-dd"));
		        citas.setHora(Utils.getFormatedDate(hora, "HH:mm"));
		        String consulta = request.getParameter("consulta");
		       // System.out.println("consulta "+ consulta);
		      
		        NotaVenta notaVenta = new NotaVenta();
		        notaVenta.setFecha(Utils.getFormatedDate());
			    citas.setNotaVenta(notaVenta);
			    citas.setStatus("NI");
		        citaService.saveCita(citas);
		        
		        model.addAttribute("saved", "success");
		        model.addAttribute("citas", citas);
		        return "altaCita";
        }else{
        	
        	model.addAttribute("saved", "exist");
			return "nuevaCita";
        }
    }
    
    
    @RequestMapping(value = "/buscar/paciente", method = RequestMethod.GET)
    public String buscarPacienteCita(Model model,String reporteMedico) {
    	
    	if(reporteMedico!=null&&reporteMedico.equals("true")){
    		model.addAttribute("reporteMedico","true");
    	}else{
    		model.addAttribute("reporteMedico","false");
    	}
         return "buscarPaciente";
    }
    
    @RequestMapping(value = "/buscar/paciente", method = RequestMethod.POST)
    public String agregarPacienteCita(@RequestParam("pacienteNom")String pacienteNombre, Model model,HttpServletRequest request) {
    	
    	List<Paciente> listaPacientes =  pacienteService.findPaciente(pacienteNombre);
    	
        String reporteMedico = request.getParameter("reporteMedico").trim();
        model.addAttribute("reporteMedico",reporteMedico);
        model.addAttribute("listaPacientes",listaPacientes);
        return "buscarPaciente";
    }

}
