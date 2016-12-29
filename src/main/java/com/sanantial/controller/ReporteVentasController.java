package com.sanantial.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sanantial.entity.Gasto;
import com.sanantial.entity.GastoDiario;
import com.sanantial.entity.Ingreso;
import com.sanantial.entity.IngresoDiario;
import com.sanantial.entity.VentaDiaria;
import com.sanantial.service.GastoDiarioService;
import com.sanantial.service.GastoService;
import com.sanantial.service.IngresoDiarioService;
import com.sanantial.service.IngresoService;
import com.sanantial.service.VentaDiariaService;
import com.sanantial.utils.Utils;


@Controller
public class ReporteVentasController {

	
@Autowired VentaDiariaService ventaDiariaService;
	
	@Autowired GastoDiarioService gastoDiarioService;
	
	@Autowired IngresoDiarioService ingresoDiarioService;
	
	@Autowired GastoService gastoService;
	
	@Autowired IngresoService ingresoService;
	
	public static final Logger  LOGGER = Logger.getLogger(ReporteVentasController.class.getName()); 
	
	private void reporteVentasModel(Model model){
		List<VentaDiaria> ventaDiaria = ventaDiariaService.findVentaDiaria();
		 if(LOGGER.isDebugEnabled()){
			 LOGGER.debug("ventaDiaria Size: "+ventaDiaria.size());
		 }
        model.addAttribute("ventaDiaria", ventaDiaria);
        
        List<IngresoDiario> ingresoDiario = ingresoDiarioService.findIngresoDiario();
        if(LOGGER.isDebugEnabled()){
        	LOGGER.debug("ingresoDiario Size: " + ingresoDiario.size());
        }
        model.addAttribute("ingresoDiario", ingresoDiario);

        List<GastoDiario> gastoDiario = gastoDiarioService.findGastoDiario();
	        
	    model.addAttribute("gastoDiario", gastoDiario);
	}
	
	 @RequestMapping(value = "/buscar/reporte_ventas", method = RequestMethod.GET)
	 public String reporteVentas(Model model){
		 reporteVentasModel(model);
		 
		 return "reporteVentaDiaria";
	 }
	 
	 @RequestMapping(value ="/buscar/reporte_ventas", method = RequestMethod.POST)
	 public String subbmitGastosReporteVentas(Model model, 
			 @RequestParam(required = false, value="idGastos") String idGastos,
			 @RequestParam(required = false, value="idIngresos") String idIngresos){
		 if(LOGGER.isDebugEnabled()){
		    LOGGER.debug("idGastos: " + idGastos);
		    LOGGER.debug("idIngresos: " + idIngresos);
		 }
		 
		 if(idGastos.length() > 0){
			 List<Integer> gastoDiarioIds = Utils.splitStringToInteger(idGastos);
			 if(gastoDiarioIds.size() > 0){
				 gastoDiarioService.addGastoDiario(gastoDiarioIds); 
			 }
		 }
		 
		 if(idIngresos.length() > 0){
			 List<Integer> ingresoDiarioIds = Utils.splitStringToInteger(idIngresos);
			 if(ingresoDiarioIds.size() > 0){
				ingresoDiarioService.addIngresoDiario(ingresoDiarioIds); 
			 }
		 }
		 
		 reporteVentasModel(model);
		 
		 return "reporteVentaDiaria";
	}
	 
	 @RequestMapping(value = "/agregar_gastos", method = RequestMethod.GET)
	 public String catalogoGastos(Model model){
		 List<Gasto> gasto = gastoService.findGastos();
		 if(LOGGER.isDebugEnabled()){
			 LOGGER.debug("Gasto size: " + gasto.size());
		 }
		 
		 model.addAttribute("gasto", gasto);
		 
		 return "catalogoGastos";
	 }
	 
	 @RequestMapping(value = "/agregar_ingresos", method = RequestMethod.GET)
	 public String catalogoIngresos(Model model){
		 List<Ingreso> ingreso = ingresoService.findIngresos();
		 if(LOGGER.isDebugEnabled()){
		 LOGGER.debug("Ingresos Size: " + ingreso.size());
		 }
		 model.addAttribute("ingreso", ingreso);
		 return "catalogoIngresos";
	 }
	 
	 
	 @RequestMapping(value = "/quitar/ingreso", method = RequestMethod.POST)
	 public String quitarIngreso(Model model, @RequestParam(required = false,  value="hiddenIngresoId") final  Integer ingresoId ){
		 if(LOGGER.isDebugEnabled()){
		    LOGGER.debug("ingresoId quitar elementos: "+ingresoId);
		 }
		 ingresoDiarioService.deleteIngreso(ingresoId);
		 return "redirect:/buscar/reporte_ventas";
	 }
	 
	 @RequestMapping(value = "/quitar/gasto", method = RequestMethod.POST)
	 public String quitarGasto(Model model, @RequestParam(required = false,  value="hiddenGastoId") final  Integer gastoId ){
		 if(LOGGER.isDebugEnabled()){
			 LOGGER.debug("gastoId quitar elementos: "+gastoId);
		 }
		 gastoDiarioService.deleteGasto(gastoId);
		 return "redirect:/buscar/reporte_ventas";
	 }
}
