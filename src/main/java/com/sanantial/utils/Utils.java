package com.sanantial.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Utils {
	
	public static List<Integer> splitTratamientos(String lista){
		List<Integer> ids = new ArrayList<Integer>();
		String[] elements =   lista.split(":");
		System.out.println("lenght: "+elements.length);
		for (String element : elements) {
		  //System.out.println(" ID extracted: "+element.substring(0, element.indexOf(";")));
			ids.add(Integer.parseInt(element.substring(0, element.indexOf(";"))));
		}
		return ids;
	}
	
	public static List<Integer> splitStringToInteger(String lista){
		List<Integer> ids = new ArrayList<Integer>();
		String[] elements = lista.split(":");

		for(String element : elements) {
			ids.add(Integer.parseInt(element));
		}
		return ids;
	}
	
	public static List<Integer> splitStringToInteger(String lista, String separador){
		
		List<Integer> ids = new ArrayList<Integer>();
		String[] elements = lista.split(separador);
		
		for(String element : elements) {
			ids.add(Integer.parseInt(element));
		}
		return ids;
	}
	
	public static String[] splitString(String value, String separador){
		String[] elements = value.split(separador);
		return elements;
	}
	
	public static String getFormatedDateStr(String date, String format){
		SimpleDateFormat dateFormat = new SimpleDateFormat(format);
		
			return dateFormat.format(date);
	
		
	}
	
	
	public static Date getFormatedDate(String date, String format){
		SimpleDateFormat dateFormat = new SimpleDateFormat(format);
		try {
			return dateFormat.parse(date);
		} catch (ParseException e) {
		
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * Retrieve today's date in format yyyy-MM-dd
	 * @return
	 */
	public static Date getFormatedDate(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date now = new Date();
			
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd");
			//System.out.println(" 3. " + format.format(now));
			return dateFormat.parse(format.format(now));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static Integer getDescuento(String descuento){
		if(".95".equals(descuento)){
			return 5;
		}else if(".90".equals(descuento)){
			return 10;
		}else if(".80".equals(descuento)){
			return 20;
		}else if(".70".equals(descuento)){
			return 30;
		}else if(".60".equals(descuento)){
			return 40;
		}else if(".50".equals(descuento)){
			return 50;
		}else if("0".equals(descuento)){
			return 100;
		}
		return 0;
	}
	
	public static Integer getValueNumber(String totalVale){
		
		if ("0".equals(totalVale)){
			return 0;
			
		}else if ("100".equals(totalVale)){
			return 2;
			
		}else if("200".equals(totalVale)){
			return 3;
			
		}else if("400".equals(totalVale)){
			return 4;
		}else{
			System.out.println("CANTIDAD VALE NO RECONOCIDA");
			return null;
		}
		
	}
	/**
	 * Return > 0 Date1 is after Date2, Return < 0 Date1 is before Date2, Return = 0 Date1 is equal to Date2
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static int compareToDates(Date date1, Date date2){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return date1.compareTo(date2);
	}


}
