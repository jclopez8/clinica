package com.sanantial.entity;

// Generated 12/11/2013 12:25:52 AM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * GastoDiarioId generated by hbm2java
 */
@Embeddable
public class GastoDiarioId implements java.io.Serializable {

	private int gastoDiarioId;
	private int usuarioId;

	public GastoDiarioId() {
	}

	public GastoDiarioId(int gastoDiarioId, int usuarioId) {
		this.gastoDiarioId = gastoDiarioId;
		this.usuarioId = usuarioId;
	}

	@Column(name = "gasto_diario_id", nullable = false)
	public int getGastoDiarioId() {
		return this.gastoDiarioId;
	}

	public void setGastoDiarioId(int gastoDiarioId) {
		this.gastoDiarioId = gastoDiarioId;
	}

	@Column(name = "usuario_id", nullable = false)
	public int getUsuarioId() {
		return this.usuarioId;
	}

	public void setUsuarioId(int usuarioId) {
		this.usuarioId = usuarioId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof GastoDiarioId))
			return false;
		GastoDiarioId castOther = (GastoDiarioId) other;

		return (this.getGastoDiarioId() == castOther.getGastoDiarioId())
				&& (this.getUsuarioId() == castOther.getUsuarioId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getGastoDiarioId();
		result = 37 * result + this.getUsuarioId();
		return result;
	}

}
