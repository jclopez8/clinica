package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.GastoDiario;

public interface GastoDiarioService {
	void saveGastoDiario(GastoDiario gastoDiario);
	void addGastoDiario(List<Integer> gastoDiarioIds);
	List<GastoDiario> findGastoDiario();
	public GastoDiario createGastoDiarioVale(String list);
	void deleteGasto(Integer gastoId);

}
