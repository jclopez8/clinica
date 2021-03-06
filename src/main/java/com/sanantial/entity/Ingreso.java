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
 * Ingreso generated by hbm2java
 */
@Entity
@Table(name = "ingreso", catalog = "sanantialdb")
public class Ingreso implements java.io.Serializable {

	private Integer ingresoId;
	private String ingresoNombre;
	private Long totalIngreso;
	private Set<IngresoDiario> ingresoDiarios = new HashSet<IngresoDiario>(0);

	public Ingreso() {
	}

	public Ingreso(String ingresoNombre, Long totalIngreso, Set<IngresoDiario> ingresoDiarios) {
		this.ingresoNombre = ingresoNombre;
		this.totalIngreso = totalIngreso;
		this.ingresoDiarios = ingresoDiarios;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ingreso_id", unique = true, nullable = false)
	public Integer getIngresoId() {
		return this.ingresoId;
	}

	public void setIngresoId(Integer ingresoId) {
		this.ingresoId = ingresoId;
	}

	@Column(name = "ingreso_nombre", length = 45)
	public String getIngresoNombre() {
		return this.ingresoNombre;
	}

	public void setIngresoNombre(String ingresoNombre) {
		this.ingresoNombre = ingresoNombre;
	}
	
	@Column(name = "total_ingreso", precision = 10, scale = 0)
	public Long getTotalIngreso() {
		return this.totalIngreso;
	}

	public void setTotalIngreso(Long totalIngreso) {
		this.totalIngreso = totalIngreso;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ingreso")
	public Set<IngresoDiario> getIngresoDiarios() {
		return this.ingresoDiarios;
	}

	public void setIngresoDiarios(Set<IngresoDiario> ingresoDiarios) {
		this.ingresoDiarios = ingresoDiarios;
	}

}
