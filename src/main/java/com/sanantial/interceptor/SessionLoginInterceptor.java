package com.sanantial.interceptor;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sanantial.exception.RestrictedPageException;

public class SessionLoginInterceptor extends HandlerInterceptorAdapter {
	
	//private static final Logger log = Logger.getLogger(SessionInterceptor.class.getPackage().getName());


	  
		 @Override  
		 public void afterCompletion(HttpServletRequest request,  
		   HttpServletResponse response, Object object, Exception ex)  
		   throws Exception {  
		  System.out.println("AfterCompletion");
		  

			 
		
		  }

	   
	  
		 @Override  
		 public void postHandle(HttpServletRequest request, HttpServletResponse response,  
		   Object object, ModelAndView modelAndView) throws Exception {  
//			 System.out.println("...POST Handle...");
			 

			 //System.out.println("PostHandle Model view: "+modelAndView.getViewName());
			 List<String> exclusionsScreens = (List<String>) request.getSession(true).getAttribute("exclusionesScreens");
			 System.out.println("exclusionsScreens: "+exclusionsScreens+" view: "+modelAndView.getViewName());
			 if (null==exclusionsScreens && !"login".equalsIgnoreCase(modelAndView.getViewName())){
			
				 System.out.println("Usuario No logueado o la session ha caducado");
				 throw new RestrictedPageException("Favor de loguearse");
			 
				 }else if(null!=exclusionsScreens && exclusionsScreens.contains(modelAndView.getViewName())){
					 System.out.println("no tiene acceso!!!!!! a la pagina: "+request.getRequestURL().toString());
					 //response.sendRedirect("/sanantial/forbidden");
					 throw new RestrictedPageException("No tiene acceso a la pagina solicitada");
				 }
				   
			 
		 }  
	 
	 
	  
		 @Override  
		 public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
		   Object object) throws Exception {  
			 System.out.println("PreHandleBoolean "+request.getRequestURL().toString());
					    return true;
	
		 }  
	 
 
	 
	}   