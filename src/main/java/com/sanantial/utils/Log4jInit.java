package com.sanantial.utils;

import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class Log4jInit extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		
		String prefix = getServletContext().getRealPath(File.separator);
		System.out.println("Prefix:"+prefix);
		String file = getInitParameter("log4j-init-file");
		System.out.println("file:"+file);

		try {
			PropertyConfigurator.configure(prefix+"\\"+ file);
		} catch (Exception ex) {
			BasicConfigurator.configure();
			Logger.getRootLogger().error(
					"Error loading the logger properties.Using default config"
							+ ex.getMessage());
		}
		Logger logger = Logger.getLogger("com.sanantial");
		logger.debug("Sanantial Log4j configured.");
		logger.debug(prefix + file);
		
	}

}
