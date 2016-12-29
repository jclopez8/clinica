package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.NotaVenta;

public interface NotaVentaService {

	void saveNotaVenta(NotaVenta notaVenta);

	NotaVenta findById(Integer id);
	
	List<NotaVenta> findNotaVenta(String criterio);
}
