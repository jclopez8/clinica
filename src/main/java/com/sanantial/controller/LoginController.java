package com.sanantial.controller;

import java.util.ArrayList;
import org.apache.log4j.Logger;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sanantial.entity.Exclusiones;
import com.sanantial.entity.Usuario;
import com.sanantial.service.LoginService;




@Controller
public class LoginController {
	
	
	@Autowired
	LoginService loginService;
	
	public static final Logger  LOGGER = Logger.getLogger(LoginController.class.getName()); 
	
	  @RequestMapping(value = "/", method = RequestMethod.GET)
	    public String displayLogin(Model model,HttpServletRequest request) {
		  LOGGER.debug("login Service GET");
	        return "login";
	    }
	  
	  @RequestMapping(value = "/autentia", method = RequestMethod.POST)
	    public String submmitLogin(final Model model,HttpServletRequest request,@RequestParam("user") final String user,@RequestParam("password") final String password) {
		  LOGGER.debug("submit login...");
	    Usuario usuario = loginService.buscarUsuario(user, password);
		  if(usuario!=null){
			  LOGGER.info("valid USER!");
			 
			  List<Exclusiones> exclusionesUser  = loginService.findByRole(usuario.getRole());
			  List<Integer> exclusionesNumbers = new ArrayList<Integer>();
			  List<String> exclusionesScreens = new ArrayList<String>();
			  for (Exclusiones exclusiones2 : exclusionesUser) {
				 //System.out.println("exclusiones: "+exclusiones2.getPantallas().getPantallaId()+" : "+exclusiones2.getPantallas().getPantallaNombre()+" para Role: "+usuario.getRole());;
				 exclusionesNumbers.add(exclusiones2.getPantallas().getPantallaId());
				 exclusionesScreens.add(exclusiones2.getPantallas().getPantallaNombre());
				 
			}
			  request.getSession(true).setAttribute("exclusionesNumbers", exclusionesNumbers);
			  request.getSession().setAttribute("exclusionesScreens", exclusionesScreens);
			  request.getSession().setAttribute("usuario", usuario);
//			  String view = "";
//			  if ("MED".equals(usuario.getRole().getCode()))
//				  view = "redirect: /tablero/doctores";
				  
			  return "index";
		  }else{
			  LOGGER.warn("invalid USER passsssssss");
			  model.addAttribute("valid", "fail");
	        return "login";
	        }
	    }
	  
	  
	  @RequestMapping(value = "/forbidden", method = RequestMethod.GET)
	    public String forbiddenAccess(final Model model) {
		  LOGGER.warn("No Access.... ");
	        return "noAccess";
	    }
	  
	  @RequestMapping(value = "/logout", method = RequestMethod.GET)
	    public String logout(final Model model,HttpServletRequest request) {
		  LOGGER.info("Logout... Service GET");
	    List<Integer> exclusionesNumbers = (List<Integer>) request.getSession().getAttribute("exclusionesNumbers");
		  List<String> exclusionesScreens = (List<String>) request.getSession().getAttribute("exclusionesScreens");
		  if (null!=exclusionesNumbers){
		     exclusionesNumbers.clear();
		     exclusionesNumbers=null;
		     request.getSession().setAttribute("exclusionesNumbers", null); 
		     request.getSession().setAttribute("usuario", null); 
		  }
		  if(null!=exclusionesScreens){
			  exclusionesScreens.clear();
			  exclusionesScreens=null;
			  request.getSession().setAttribute("exclusionesScreens",null);
			  request.getSession().setAttribute("usuario", null); 
		  }
	    
	        return "login";
	    }

}
