package com.sanantial.utils;

import java.util.List;

public class FunctionExclusion {
	
	public synchronized static boolean isPermitted(List<Integer> exclusiones, int function){
		if(null!=exclusiones){
			//System.out.println("TAg list Size"+exclusiones.size()+" contains "+exclusiones.contains(function));
			return !exclusiones.contains(function);//si lo contiene entonces no esta permitido
		}
		return true;
	}

}
