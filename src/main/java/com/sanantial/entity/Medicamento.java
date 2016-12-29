package com.sanantial.entity;

// Generated Jan 11, 2014 3:42:07 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Medicamento generated by hbm2java
 */
@Entity
@Table(name = "medicamento", catalog = "sanantialdb")
public class Medicamento implements java.io.Serializable {

	private Integer medicamentoId;
	private String medicamentoNombre;
	private String laboratorio;
	private Long precio;
	private Boolean activo;
	private Set<VentaDiaria> ventaDiarias = new HashSet<VentaDiaria>(0);

	public Medicamento() {
	}

	public Medicamento(String medicamentoNombre, String laboratorio,
			Long precio, Boolean activo, Set<VentaDiaria> ventaDiarias) {
		this.medicamentoNombre = medicamentoNombre;
		this.laboratorio = laboratorio;
		this.precio = precio;
		this.activo = activo;
		this.ventaDiarias = ventaDiarias;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "medicamento_id", unique = true, nullable = false)
	public Integer getMedicamentoId() {
		return this.medicamentoId;
	}

	public void setMedicamentoId(Integer medicamentoId) {
		this.medicamentoId = medicamentoId;
	}

	@Column(name = "medicamento_nombre", length = 45)
	public String getMedicamentoNombre() {
		return this.medicamentoNombre;
	}

	public void setMedicamentoNombre(String medicamentoNombre) {
		this.medicamentoNombre = medicamentoNombre;
	}

	@Column(name = "laboratorio", length = 45)
	public String getLaboratorio() {
		return this.laboratorio;
	}

	public void setLaboratorio(String laboratorio) {
		this.laboratorio = laboratorio;
	}

	@Column(name = "precio", precision = 10, scale = 0)
	public Long getPrecio() {
		return this.precio;
	}

	public void setPrecio(Long precio) {
		this.precio = precio;
	}

	@Column(name = "activo")
	public Boolean getActivo() {
		return this.activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "medicamento")
	public Set<VentaDiaria> getVentaDiarias() {
		return this.ventaDiarias;
	}

	public void setVentaDiarias(Set<VentaDiaria> ventaDiarias) {
		this.ventaDiarias = ventaDiarias;
	}
	
	public boolean equals(Object o) {
		if ((o instanceof Medicamento) && (((Medicamento)o).getMedicamentoId()== this.medicamentoId)) {
			return true;
		} else {
			return false;
		}
	}

}