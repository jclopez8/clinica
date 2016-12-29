package com.sanantial.service;

import java.util.List;

import com.sanantial.entity.Medicamento;

public interface MedicamentoService {
   void saveMedicamento(Medicamento medicamento);
   List<Medicamento> findMedicamento(String criterio);
}
