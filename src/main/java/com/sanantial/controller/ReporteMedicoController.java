package com.sanantial.controller;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sanantial.entity.NotaEvolucion;
import com.sanantial.entity.Paciente;
import com.sanantial.entity.Usuario;
import com.sanantial.service.NotaEvolucionService;
import com.sanantial.service.PacienteService;
import com.sanantial.service.ReporteMedicoService;

@Controller
public class ReporteMedicoController {

	 @Autowired 
	 private ReporteMedicoService reporteMedicoService;
	 
	 @Autowired	    
	 private PacienteService pacienteService;
	 
	 @Autowired	    
	 private NotaEvolucionService notaEvolucionService;
	 
	 @RequestMapping(value = "/alta/reporte_medico", method = RequestMethod.GET)
	    public String altaReporteMedico(Model model, @RequestParam("pacienteId") Integer pacienteId,String saved,HttpServletRequest request){
		Paciente paciente = pacienteService.findById(pacienteId);
		//String user = (String) request.getAttribute("usuario");
		//Usuario user = (Usuario)request. getAttribute("usuario");
		//System.out.println("Usuario Nombreeee: "+user.getUsuarioNombre());
		model.addAttribute("lists", getList(paciente));
		try{
		model.addAttribute("padecimientoActualStr", new String(paciente.getReporteMedico().getPadecimientoActual(), "ISO-8859-1"));
		model.addAttribute("exploracionFisicaStr", new String(paciente.getReporteMedico().getExploracionFisica(), "ISO-8859-1"));
		model.addAttribute("laboratorioGabineteStr", new String(paciente.getReporteMedico().getLaboratorioGabinete(), "ISO-8859-1"));
		model.addAttribute("tratamientosPreviosStr", new String(paciente.getReporteMedico().getTratamientosPrevios(), "ISO-8859-1"));
		model.addAttribute("diagnosticoStr", new String(paciente.getReporteMedico().getDiagnostico(), "ISO-8859-1"));
		//model.addAttribute("usuario", user);
		}
		catch(Exception e){}
		String repMedA = "";
		String repMedB = "";
		
		if(paciente!=null 
				&& paciente.getReporteMedico()!=null 
				&& paciente.getReporteMedico().getTa()!=null
				&& !paciente.getReporteMedico().getTa().equals("")){
			String delimiter = "/";
			String tempTA[] = paciente.getReporteMedico().getTa().split(delimiter);
			if(tempTA.length>0)
				repMedA =  tempTA[0];
			if(tempTA.length>1)
				repMedB =  tempTA[1];
		}
		model.addAttribute("repMedA", repMedA);
		model.addAttribute("repMedB", repMedB);
		model.addAttribute("paciente", paciente);
		model.addAttribute("saved", saved);
		model.addAttribute("edad", getEdad(paciente.getFechaNac()));
		return"altaReporteMedico";
	 }
	 
	private String getEdad(Date fechaNac){
		String edad = "";
		if(fechaNac!=null){
			 Calendar fechaNacimiento = Calendar.getInstance();
			 Calendar fechaActual = Calendar.getInstance();
			 fechaNacimiento.setTime(fechaNac);
			 int anno = fechaActual.get(Calendar.YEAR)- fechaNacimiento.get(Calendar.YEAR);
			 int mes =fechaActual.get(Calendar.MONTH)- fechaNacimiento.get(Calendar.MONTH);
		     int dia = fechaActual.get(Calendar.DATE)- fechaNacimiento.get(Calendar.DATE);
		     if(mes<0 || (mes==0 && dia<0)){
		    	 anno--;
		     }
		     edad = Integer.toString(anno);
		}
		return edad;
	}
	 
	private List<String> getList(Paciente paciente) {
		 
			List<String> list = new ArrayList<String>();
			List<NotaEvolucion> listNotaEvo = new LinkedList<NotaEvolucion>();
			for(NotaEvolucion notaEvo : paciente.getReporteMedico().getNotaEvolucions()){
				listNotaEvo.add(notaEvo);
			}
			Collections.sort(listNotaEvo , new NotaEvolucionComparator ());
			for(NotaEvolucion notaEvo : listNotaEvo){
				try{
					String str = new String(notaEvo.getNotaEvolucion(), "ISO-8859-1");
					list.add(str);
				}catch(Exception e){}
			}
			return list;
	 
	}
	class NotaEvolucionComparator implements Comparator<NotaEvolucion> {

        public int compare(NotaEvolucion e1, NotaEvolucion e2) {
            return e1.getNotaEvolucionId().compareTo(e2.getNotaEvolucionId());
        }

    }
	 
	 @RequestMapping(value = "/salvar/reporte_medico", method = RequestMethod.POST)
	    public String salvarReporteMedico(Model model, HttpServletRequest request, Paciente paciente){
		 String strNotaEvolucion = request.getParameter("notaEvo").trim();
		 
		 String padecimientoActualStr = request.getParameter("padecimientoActualStr").trim();
		 String exploracionFisicaStr = request.getParameter("exploracionFisicaStr").trim();
		 String laboratorioGabineteStr = request.getParameter("laboratorioGabineteStr").trim();
		 String tratamientosPreviosStr = request.getParameter("tratamientosPreviosStr").trim();
		 String diagnosticoStr = request.getParameter("diagnosticoStr").trim();
		 String repMedA = request.getParameter("repMedA").trim();
		 String repMedB = request.getParameter("repMedB").trim();
		 
		 
		 if(strNotaEvolucion!= null && !strNotaEvolucion.trim().equals("")){
			 NotaEvolucion notaEvolucion = new NotaEvolucion();
			 notaEvolucion.setNotaEvolucion(strNotaEvolucion.getBytes());
			 notaEvolucion.setReporteMedico(paciente.getReporteMedico());
			 notaEvolucionService.saveNotaEvolucion(notaEvolucion);
		 }
		 paciente.getReporteMedico().setTa(repMedA + "/" + repMedB);
		 paciente.getReporteMedico().setPadecimientoActual(padecimientoActualStr.getBytes());
		 paciente.getReporteMedico().setExploracionFisica(exploracionFisicaStr.getBytes());
		 paciente.getReporteMedico().setLaboratorioGabinete(laboratorioGabineteStr.getBytes());
		 paciente.getReporteMedico().setTratamientosPrevios(tratamientosPreviosStr.getBytes());
		 paciente.getReporteMedico().setDiagnostico(diagnosticoStr.getBytes());
		 reporteMedicoService.saveReporteMedico(paciente.getReporteMedico());
		 model.addAttribute("saved", "success");
		 model.addAttribute("pacienteId", paciente.getPacienteId());
		 return "redirect:/alta/reporte_medico";
	 }
}
