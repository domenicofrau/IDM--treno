package com.idm.trenohibernate;

import lombok.*;

@Getter
@Setter
@ToString(callSuper = true)
@NoArgsConstructor

public class Passeggeri extends Vagone {

	private int postiNormali;
	private int postiDisabili;
	private int postiTotali;
	private boolean servizi;

	public Passeggeri(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili, boolean servizi,
			TipoVagone tipo) {
		super(lunghezza, peso, prezzo, tipo);
		this.postiNormali = postiNormali;
		this.postiDisabili = postiDisabili;
		this.postiTotali = postiNormali + postiDisabili;
		this.servizi = servizi;
	}
	@Override
	public String toString() {
		return "Passeggeri [postiNormali=" + postiNormali + ", postiDisabili=" + postiDisabili + ", postiTotali="
				+ postiTotali + ", servizi=" + servizi + " " + super.toString() + "]";
	}

	  @Override
	    public int compareTo(Vagone other) {
	        // Implement comparison logic based on your requirements
	        // For example, compare by some property like ID or another field.
	        return Integer.compare(this.getId(), other.getId());
	    }
}