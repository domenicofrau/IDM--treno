package com.idm.trenohibernate;

public class Locomotiva extends Vagone {
	
	private int pesoTrainabile;

	public Locomotiva(int lunghezza, int peso, int prezzo, int pesoTrainabile) {
		super(lunghezza, peso, prezzo);
		this.pesoTrainabile = pesoTrainabile;
	}

	@Override
	public String toString() {
		return "Locomotiva [pesoTrainabile=" + pesoTrainabile + ", " + super.toString() + "]";
	}
	
	

	
}