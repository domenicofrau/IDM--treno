package com.idm.trenohibernate;

public class Passeggeri extends Vagone {
	
	private int postiNormali;
	private int postiDisabili;
	private int postiTotali;
	private boolean servizi;
	

	public Passeggeri(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili, boolean servizi) {
		super(lunghezza, peso, prezzo);
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
	
	

	
}