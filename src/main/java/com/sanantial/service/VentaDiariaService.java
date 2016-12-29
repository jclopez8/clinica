package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.Consulta;
import com.sanantial.entity.Medicamento;
import com.sanantial.entity.NotaVenta;
import com.sanantial.entity.Usuario;
import com.sanantial.entity.VentaDiaria;

public interface VentaDiariaService {

	void saveVentaDiaria(VentaDiaria ventaDiaria);
	VentaDiaria createVentaDiariaTratamiento(String values,NotaVenta notaVenta,Usuario usuario);
	List<VentaDiaria> findVentaDiaria();
	void addConsulta(Integer citaId, List<Integer> consultaIds) ;
	void addMedicamentos(Integer citasId,List<Integer> medicamentoIds);
	void deleteElements(List<Integer> elementosIds);
	//void deleteTratamientos(Integer citaId,List<Integer> tratamientosIds);
	void createVentaDiariaMedicamento(String list,NotaVenta notaVenta,Usuario usuario);
	void createVentaDiariaConsulta(String list,NotaVenta notaVenta,Usuario usuario);
	List<VentaDiaria> findVentaDiaria(Medicamento medicamento,	NotaVenta notaVenta);
	
	boolean existConsulta(Integer consultaId, NotaVenta notaVenta);
	
}
