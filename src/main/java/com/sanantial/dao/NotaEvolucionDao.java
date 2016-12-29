package com.sanantial.dao;

import com.sanantial.entity.NotaEvolucion;

public interface NotaEvolucionDao  extends AbstractDao<NotaEvolucion, String>  {

	void saveNotaEvolucion(NotaEvolucion notaEvolucion);
}
