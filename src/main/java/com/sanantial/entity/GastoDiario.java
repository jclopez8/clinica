package com.sanantial.entity;

// Generated Jan 11, 2014 3:42:07 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * GastoDiario generated by hbm2java
 */
@Entity
@Table(name = "gasto_diario", catalog = "sanantialdb")
public class GastoDiario implements java.io.Serializable {

	private Integer gastoDiarioId;
	private Gasto gasto;
	private Usuario usuario;
	private Date fecha;

	public GastoDiario() {
	}

	public GastoDiario(Gasto gasto, Usuario usuario) {
		this.gasto = gasto;
		this.usuario = usuario;
	}

	public GastoDiario(Gasto gasto, Usuario usuario, Date fecha) {
		this.gasto = gasto;
		this.usuario = usuario;
		this.fecha = fecha;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "gasto_diario_id", unique = true, nullable = false)
	public Integer getGastoDiarioId() {
		return this.gastoDiarioId;
	}

	public void setGastoDiarioId(Integer gastoDiarioId) {
		this.gastoDiarioId = gastoDiarioId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "gasto_id", nullable = false)
	public Gasto getGasto() {
		return this.gasto;
	}

	public void setGasto(Gasto gasto) {
		this.gasto = gasto;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuario_id", nullable = false)
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha", length = 10)
	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

}
