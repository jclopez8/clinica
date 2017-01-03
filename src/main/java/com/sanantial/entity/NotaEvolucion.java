package com.sanantial.entity;
// Generated 02-ene-2017 20:51:27 by Hibernate Tools 5.2.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * NotaEvolucion generated by hbm2java
 */
@Entity
@Table(name = "nota_evolucion", catalog = "clinicadb")
public class NotaEvolucion implements java.io.Serializable {

	private Integer notaEvolucionId;
	private ReporteMedico reporteMedico;
	private byte[] notaEvolucion;

	public NotaEvolucion() {
	}

	public NotaEvolucion(ReporteMedico reporteMedico) {
		this.reporteMedico = reporteMedico;
	}

	public NotaEvolucion(ReporteMedico reporteMedico, byte[] notaEvolucion) {
		this.reporteMedico = reporteMedico;
		this.notaEvolucion = notaEvolucion;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "nota_evolucion_id", unique = true, nullable = false)
	public Integer getNotaEvolucionId() {
		return this.notaEvolucionId;
	}

	public void setNotaEvolucionId(Integer notaEvolucionId) {
		this.notaEvolucionId = notaEvolucionId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "reporte_medico_id", nullable = false)
	public ReporteMedico getReporteMedico() {
		return this.reporteMedico;
	}

	public void setReporteMedico(ReporteMedico reporteMedico) {
		this.reporteMedico = reporteMedico;
	}

	@Column(name = "nota_evolucion")
	public byte[] getNotaEvolucion() {
		return this.notaEvolucion;
	}

	public void setNotaEvolucion(byte[] notaEvolucion) {
		this.notaEvolucion = notaEvolucion;
	}

}
