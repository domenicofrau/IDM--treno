package com.idm.trenohibernate;

public class Cargo extends Vagone {
	
	private int pesoTotale;
	private int pesoMerce;
	private TipoMerce tipoMerce;

	public Cargo(int lunghezza, int peso, int prezzo, TipoMerce tipoMerce, int pesoMerce) {
		super(lunghezza, peso, prezzo);
		this.pesoTotale = peso + pesoMerce;
		this.tipoMerce = tipoMerce;
	}

	@Override
	public String toString() {
		return "Cargo [pesoTotale=" + pesoTotale + ", pesoMerce=" + pesoMerce + ", tipoMerce=" + tipoMerce
				 + super.toString() + "]";
	}
	
	
	
}