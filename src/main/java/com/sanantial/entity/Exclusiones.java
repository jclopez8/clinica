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
 * Exclusiones generated by hbm2java
 */
@Entity
@Table(name = "exclusiones", catalog = "clinicadb")
public class Exclusiones implements java.io.Serializable {

	private Integer exclusionId;
	private Pantallas pantallas;
	private Role role;

	public Exclusiones() {
	}

	public Exclusiones(Pantallas pantallas, Role role) {
		this.pantallas = pantallas;
		this.role = role;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "exclusion_id", unique = true, nullable = false)
	public Integer getExclusionId() {
		return this.exclusionId;
	}

	public void setExclusionId(Integer exclusionId) {
		this.exclusionId = exclusionId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pantalla_id", nullable = false)
	public Pantallas getPantallas() {
		return this.pantallas;
	}

	public void setPantallas(Pantallas pantallas) {
		this.pantallas = pantallas;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id", nullable = false)
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}