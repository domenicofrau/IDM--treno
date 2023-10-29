package com.idm.trenohibernate;

public class Locomotiva extends Vagone {

	private int pesoTrainabile;

	public Locomotiva(int lunghezza, int peso, int prezzo, int pesoTrainabile, TipoVagone tipo) {
		super(lunghezza, peso, prezzo, tipo);
		this.pesoTrainabile = pesoTrainabile;
	}

	public Locomotiva() {
		super();
	}

	public int getPesoTrainabile() {
		return pesoTrainabile;
	}

	public void setPesoTrainabile(int pesoTrainabile) {
		this.pesoTrainabile = pesoTrainabile;
	}

	@Override
	public String toString() {
		return "Locomotiva [pesoTrainabile=" + pesoTrainabile + ", " + super.toString() + "]";
	}

}